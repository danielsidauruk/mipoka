import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/upload_and_read_excel.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class ImportPesertaLaporanPage extends StatefulWidget {
  const ImportPesertaLaporanPage({
    super.key,
    required this.idLaporan,
  });

  final int idLaporan;

  @override
  State<ImportPesertaLaporanPage> createState() => _ImportPesertaLaporanPageState();
}

class _ImportPesertaLaporanPageState extends State<ImportPesertaLaporanPage> {

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
                  // CustomFilePickerButton(
                  //   onTap: () => selectAndUploadFile(
                  //     'importPeserta',
                  //     // 1
                  //   ),
                  // ),
                  TextButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          PlatformFile file = result.files.first;

                          List<int> bytes = await File(file.path!).readAsBytes();
                          Excel excel = Excel.decodeBytes(bytes);

                          final sheet = excel.tables[excel.tables.keys.first];

                          var nimList = [];
                          var peranList = [];

                          for (var row in sheet!.rows) {
                            var nim = row[0]?.value;
                            var peran = row[1]?.value;

                            if (nim != null && peran != null) {
                              nimList.add(nim);
                              peranList.add(peran);
                            }
                          }

                          for (var i = 1; i < nimList.length; i++) {
                            print('idPeserta: ${randomId + i}, NIM: ${nimList[i]}, Peran: ${peranList[i]}');
                          }
                        }
                      },
                      child: const Text("upload"),
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () async => downloadFileWithDio(
                            url: pesertaKegiatanTemplate,
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
                        onTap: () {
                          Navigator.pop(context);
                          context.read<PesertaKegiatanLaporanBloc>().add(
                            CreatePesertaKegiatanLaporanEvent(
                              idUsulanKegiatan: widget.idLaporan,
                              pesertaKegiatanLaporan: PesertaKegiatanLaporan(
                                idPesertaKegiatanLaporan: int.parse("${widget.idLaporan}$newId"),
                                nim: "",
                                namaLengkap: "",
                                peran: "",
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            ),
                          );
                        },
                        text: 'Proses',
                      ),
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
