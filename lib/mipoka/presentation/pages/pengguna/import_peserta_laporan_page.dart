import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';

class ImportPesertaLaporanPage extends StatefulWidget {
  const ImportPesertaLaporanPage({
    super.key,
    required this.laporan,
  });

  final Laporan laporan;

  @override
  State<ImportPesertaLaporanPage> createState() => _ImportPesertaLaporanPageState();
}

class _ImportPesertaLaporanPageState extends State<ImportPesertaLaporanPage> {

  @override
  void dispose() {
    context.read<MipokaUserByNimBloc>().close();
    context.read<LaporanBloc>().close();
    index = 0;
    super.dispose();
  }

  final StreamController<String?> _excelFileStream = StreamController<String?>.broadcast();
  String? _excelFileController;
  FilePickerResult? result;

  var index = 0;

  User? user = FirebaseAuth.instance.currentUser;

  List nimList = [];
  List peranList = [];

  void _processUploadedFile(PlatformFile file) async {
    Uint8List? bytes;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      try {
        Excel excel = Excel.decodeBytes(bytes);
        Sheet? sheet = excel.tables[excel.tables.keys.first];

        nimList = [];
        peranList = [];

        for (var i = 1; i < sheet!.rows.length; i++) {
          var row = sheet.rows[i];
          var nim = row[0]?.value;
          var peran = row[1]?.value;

          if (nim != null && peran != null) {
            nimList.add(nim.toString());
            peranList.add(peran.toString());
          }
        }
        print("NimList  : $nimList");
        print("Peran    : $peranList");

        // for (var i = 1; i < nimList.length; i++) {
        //   int uniqueId = UniqueIdGenerator.generateUniqueId();
        //
        //   context.read<LaporanBloc>().add(
        //     UpdateLaporanSecondPageEvent(
        //       laporan: widget.laporan.copyWith(
        //         pesertaKegiatanLaporan: [
        //           ...widget.laporan.pesertaKegiatanLaporan,
        //           PesertaKegiatanLaporan(
        //               idPesertaKegiatanLaporan: , nim: nim, namaLengkap: namaLengkap, peran: peran, createdAt: createdAt, createdBy: createdBy, updatedAt: updatedAt, updatedBy: updatedBy,
        //           )
        //         ]
        //       ),
        //     ),
        //   );
        // }
        // Future.microtask(() {
        //   mipokaCustomToast("Data telah di update.");
        //   Navigator.pop(context);
        // });
      } catch (e) {
        mipokaCustomToast("Format/file yang dimasukkan salah.");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Import Peserta'),
                  buildDescription('Unduh templat Excel dan unggah. Pastikan hanya menulis NIM di Templat.'),

                  const CustomFieldSpacer(),

                  buildTitle('Unggah'),
                  StreamBuilder<String?>(
                    initialData: _excelFileController,
                    stream: _excelFileStream.stream,
                    builder: (context, snapshot) {
                      String filePath = snapshot.data ?? "";
                      return MipokaExcelUploader(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          if (result != null){
                            _excelFileStream.add(result?.files.first.name);
                            _processUploadedFile(result!.files.first);
                          }
                        },
                        text: filePath,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () async => downloadFileWithDio(
                            url: nimTemplate,
                            fileName: "pesertaKegiatan.xlsx"
                        ),
                        text: 'Unduh Templat',
                      ),
                    ],
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () async {
                          final result = this.result;
                          if (result != null) {
                            print("nimList : ${nimList.length}");
                            for (var index = 0; index < nimList.length; index++) {
                              this.index = index;
                              print("Current Index  : ${this.index}");

                              context.read<MipokaUserByNimBloc>().add(ReadMipokaUserByNimEvent(nim: nimList[index]));

                              Future.delayed(const Duration(seconds: 10));
                              print("Index After    : ${this.index}");
                            }

                          } else {
                            mipokaCustomToast("Harap unggah file yang diperlukan.");
                          }
                        },
                        text: 'Proses',
                      ),

                      BlocListener<MipokaUserByNimBloc, MipokaUserByNimState>(
                        listenWhen: (prev, current) =>
                        prev.runtimeType != current.runtimeType,
                        listener: (context, state) {
                          if(state is MipokaUserByNimByNimHasData) {
                            final mipokaUser = state.mipokaUser;
                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            context.read<LaporanBloc>().add(
                              UpdateLaporanSecondPageEvent(
                                laporan: widget.laporan.copyWith(
                                  pesertaKegiatanLaporan: [
                                    ...widget.laporan.pesertaKegiatanLaporan,
                                    PesertaKegiatanLaporan(
                                      idPesertaKegiatanLaporan: 30 + index,
                                      nim: nimList[index],
                                      namaLengkap: mipokaUser.namaLengkap,
                                      peran: peranList[index],
                                      createdAt: currentDate,
                                      createdBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          // else {
                          //   int uniqueId = UniqueIdGenerator.generateUniqueId();
                          //   String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                          //
                          //   context.read<LaporanBloc>().add(
                          //     UpdateLaporanSecondPageEvent(
                          //       laporan: widget.laporan.copyWith(
                          //         pesertaKegiatanLaporan: [
                          //           ...widget.laporan.pesertaKegiatanLaporan,
                          //           PesertaKegiatanLaporan(
                          //             idPesertaKegiatanLaporan: uniqueId,
                          //             nim: nimList[index],
                          //             namaLengkap: "unregistered user",
                          //             peran: peranList[index],
                          //             createdAt: currentDate,
                          //             createdBy: user?.email ?? "unknown",
                          //             updatedAt: currentDate,
                          //             updatedBy: user?.email ?? "unknown",
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   );
                          //   index ++;
                          // }
                        },
                        child: const SizedBox(),
                      ),

                      // BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                      //   builder: (context, state) {
                      //     if (result != null) {
                      //       if(state is MipokaUserByNimByNimHasData) {
                      //         final mipokaUser = state.mipokaUser;
                      //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                      //         String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                      //
                      //         context.read<LaporanBloc>().add(
                      //           UpdateLaporanSecondPageEvent(
                      //             laporan: widget.laporan.copyWith(
                      //               pesertaKegiatanLaporan: [
                      //                 ...widget.laporan.pesertaKegiatanLaporan,
                      //                 PesertaKegiatanLaporan(
                      //                   idPesertaKegiatanLaporan: uniqueId,
                      //                   nim: nimList[index],
                      //                   namaLengkap: mipokaUser.namaLengkap,
                      //                   peran: peranList[index],
                      //                   createdAt: currentDate,
                      //                   createdBy: user?.email ?? "unknown",
                      //                   updatedAt: currentDate,
                      //                   updatedBy: user?.email ?? "unknown",
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //
                      //         index ++;
                      //
                      //         return const SizedBox();
                      //       } else {
                      //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                      //         String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                      //
                      //         context.read<LaporanBloc>().add(
                      //           UpdateLaporanSecondPageEvent(
                      //             laporan: widget.laporan.copyWith(
                      //               pesertaKegiatanLaporan: [
                      //                 ...widget.laporan.pesertaKegiatanLaporan,
                      //                 PesertaKegiatanLaporan(
                      //                   idPesertaKegiatanLaporan: uniqueId,
                      //                   nim: nimList[index],
                      //                   namaLengkap: "unregistered user",
                      //                   peran: peranList[index],
                      //                   createdAt: currentDate,
                      //                   createdBy: user?.email ?? "unknown",
                      //                   updatedAt: currentDate,
                      //                   updatedBy: user?.email ?? "unknown",
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //
                      //         index ++;
                      //
                      //         return const SizedBox();
                      //       }
                      //
                      //     } else {
                      //       return const SizedBox();
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<void> _downloadFile({}) async {
//   DownloadService downloadService =
//   kIsWeb ? WebDownloadService() : MobileDownloadService();
//   await downloadService.download(url: url);
// }
