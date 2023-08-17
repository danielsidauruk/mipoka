import 'dart:io';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:universal_io/io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaMPTUnggahBuktiPage extends StatefulWidget {
  const PenggunaMPTUnggahBuktiPage({
    required this.kegiatanPerPeriodeMpt,
    super.key,
  });

  final KegiatanPerPeriodeMpt kegiatanPerPeriodeMpt;

  @override
  State<PenggunaMPTUnggahBuktiPage> createState() => _PenggunaMPTUnggahBuktiPageState();
}

class _PenggunaMPTUnggahBuktiPageState extends State<PenggunaMPTUnggahBuktiPage> {
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _fileSertifikatMptController = TextEditingController();
  final TextEditingController _shaController = TextEditingController();
  final StreamController<String?> _fileSertifikatMptStream = StreamController<String?>.broadcast();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    context.read<RiwayatKegiatanMptBloc>().close();
    _fileSertifikatMptStream.close();
    super.dispose();
  }

  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<RiwayatKegiatanMptBloc, RiwayatKegiatanMptState>(
            builder: (context, riwayatKegiatanState) {
              if (riwayatKegiatanState is RiwayatKegiatanMptLoading) {
                return const Text('Loading ....');
              } else if (riwayatKegiatanState is AllRiwayatKegiatanMptHasData){

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    const CustomMobileTitle(text: 'MPT - Unggah Bukti MPT'),

                    const CustomFieldSpacer(),

                    CustomContentBox(
                      children: [

                        buildTitle('Unggah File'),
                        StreamBuilder<String?>(
                          stream: _fileSertifikatMptStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return CustomFilePickerButton(
                              onTap: () async {
                                result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf'],
                                );
                                _fileSertifikatMptStream.add(result?.names.first ?? "");
                              },
                              onDelete: () {
                                _fileSertifikatMptStream.add("");
                              },
                              text: text,
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Keterangan'),
                        CustomTextField(controller: _keteranganController),

                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Batal',
                            ),

                            const SizedBox(width: 8.0),

                            // BlocBuilder<MipokaUserBloc, MipokaUserState>(
                            //   builder: (context, state) {
                            //     if(state is MipokaUserLoading) {
                            //       return const Text("Loading ...");
                            //     } else if (state is MipokaUserHasData) {
                            //       return CustomMipokaButton(
                            //         onTap: () async {
                            //           if (_keteranganController.text.isNotEmpty) {
                            //             try {
                            //               final result = this.result;
                            //               if (result != null) {
                            //                 PlatformFile file = result.files.first;
                            //
                            //                 Uint8List? bytes;
                            //                 String? fileHash;
                            //
                            //                 if (kIsWeb) {
                            //                   bytes = file.bytes!;
                            //                   List<int> convertedList = bytes.toList();
                            //                   fileHash = sha256.convert(convertedList).toString();
                            //                 } else if (Platform.isAndroid) {
                            //                   bytes = await File(file.path!).readAsBytes();
                            //                   fileHash = sha256.convert(bytes).toString();
                            //                 }
                            //
                            //                 List<String> hashList = riwayatKegiatanState.riwayatKegiatanMptList.map(
                            //                         (sha256) => sha256.hash).toList();
                            //
                            //                 if (hashList.contains(fileHash) == true) {
                            //                   mipokaCustomToast("Tidak dapat mengunggah file yang sama");
                            //                 } else {
                            //                   mipokaCustomToast('Sedang menyimpan file ...');
                            //                   print (fileHash);
                            //                   String? downloadUrl = await uploadBytesToFirebase(bytes!, "${user?.uid ?? ""}${file.name}");
                            //                   _shaController.text = fileHash ?? "";
                            //                   _fileSertifikatMptController.text = downloadUrl ?? "";
                            //
                            //                   if (context.mounted) {
                            //                     context.read<RiwayatKegiatanMptBloc>().add(
                            //                       CreateRiwayatKegiatanMptEvent(
                            //                         riwayatKegiatanMpt: RiwayatKegiatanMpt(
                            //                           kegiatanPerPeriodeMpt: widget.kegiatanPerPeriodeMpt,
                            //                           idRiwayatKegiatanMpt: newId,
                            //                           mipokaUser: state.mipokaUser,
                            //                           statusMpt: tertunda,
                            //                           fileSertifikatMpt: _fileSertifikatMptController.text,
                            //                           hash: _shaController.text,
                            //                           keteranganMhs: _keteranganController.text,
                            //                           keteranganSa: "",
                            //                           createdAt: currentDate,
                            //                           createdBy: user?.email ?? "unknown",
                            //                           updatedAt: currentDate,
                            //                           updatedBy: user?.email ?? "unknown",
                            //                         ),
                            //                       ),
                            //                     );
                            //                   }
                            //                 }
                            //               } else {
                            //                 mipokaCustomToast("Harap unggah file.");
                            //               }
                            //             } catch (error) {
                            //               if (kDebugMode) {
                            //                 print (error);
                            //               }
                            //               // mipokaCustomToast(error.toString());
                            //               mipokaCustomToast("Fitur belum tersedia.");
                            //             }
                            //           } else {
                            //             mipokaCustomToast(emptyFieldMessage);
                            //           }
                            //         },
                            //         text: "Tambah",
                            //       );
                            //     } else if (state is MipokaUserError) {
                            //       return Text(state.message);
                            //     } else {
                            //       return const Text("MipokaUser Hasn't been triggered yet");
                            //     }
                            //   },
                            // ),
                            BlocBuilder<MipokaUserBloc, MipokaUserState>(
                              builder: (context, state) {
                                if (state is MipokaUserLoading) {
                                  return const Text("Loading ...");
                                } else if (state is MipokaUserHasData) {
                                  return CustomMipokaButton(
                                    onTap: () async {
                                      if (_keteranganController.text.isNotEmpty) {

                                        try {
                                          final result = this.result;
                                          if (result != null) {
                                            PlatformFile file = result.files.first;

                                            Uint8List? bytes;
                                            String? fileHash;

                                            if (kIsWeb) {
                                              bytes = file.bytes!;
                                              List<int> convertedList = bytes.toList();
                                              fileHash = sha256.convert(convertedList).toString();
                                            } else if (Platform.isAndroid) {
                                              bytes = await File(file.path!).readAsBytes();
                                              fileHash = sha256.convert(bytes).toString();
                                            }

                                            List<String> hashList = riwayatKegiatanState.riwayatKegiatanMptList
                                                .map((sha256) => sha256.hash)
                                                .toList();

                                            if (hashList.contains(fileHash) == true) {
                                              mipokaCustomToast("Tidak dapat mengunggah file yang sama");
                                            } else {
                                              mipokaCustomToast(savingDataMessage);

                                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                                              String? fileUrl = await uploadBytesToFirebase(
                                                  bytes!, "$uniqueId${file.name}");

                                              _shaController.text = fileHash ?? "";
                                              _fileSertifikatMptController.text = fileUrl ?? "";

                                              if (context.mounted) {
                                                int uniqueId = UniqueIdGenerator.generateUniqueId();
                                                String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                                                if(context.mounted) {
                                                  context.read<NotifikasiBloc>().add(
                                                    CreateNotifikasiEvent(
                                                      notifikasi: Notifikasi(
                                                        idNotifikasi: uniqueId,
                                                        teksNotifikasi: "${state.mipokaUser.namaLengkap} telah mengunggah bukti MPT pada kegiatan ${widget.kegiatanPerPeriodeMpt.namaKegiatanMpt}",
                                                        tglNotifikasi: DateTime.now().toString(),
                                                        createdAt: currentDate,
                                                        createdBy: user?.email ?? "unknown",
                                                        updatedAt: currentDate,
                                                        updatedBy: user?.email ?? "unknown",
                                                      ),
                                                    ),
                                                  );
                                                }

                                                await Future.delayed(const Duration(milliseconds: 500));
                                                if(context.mounted) {
                                                  Navigator.pop(
                                                    context,
                                                    RiwayatKegiatanMpt(
                                                      kegiatanPerPeriodeMpt: widget.kegiatanPerPeriodeMpt,
                                                      idRiwayatKegiatanMpt: uniqueId,
                                                      mipokaUser: state.mipokaUser,
                                                      statusMpt: tertunda,
                                                      fileSertifikatMpt: _fileSertifikatMptController.text,
                                                      hash: _shaController.text,
                                                      keteranganMhs: _keteranganController.text,
                                                      keteranganSa: "-",
                                                      createdAt: currentDate,
                                                      createdBy: user?.email ?? "unknown",
                                                      updatedAt: currentDate,
                                                      updatedBy: user?.email ?? "unknown",
                                                    ),
                                                  );
                                                }
                                              }
                                            }
                                          } else {
                                            mipokaCustomToast(emptyFieldMessage);
                                          }
                                        } catch (error) {
                                          if (kDebugMode) {
                                            print(error);
                                          }
                                          mipokaCustomToast("Fitur belum tersedia.");
                                        }
                                      } else {
                                        mipokaCustomToast(emptyFieldMessage);
                                      }
                                    },
                                    text: "Tambah",
                                  );
                                } else if (state is MipokaUserError) {
                                  return Text(state.message);
                                } else {
                                  return const SizedBox();
                                  // return const Text("MipokaUser Hasn't been triggered yet");
                                }
                              },
                            ),


                            // BlocListener<RiwayatKegiatanMptBloc, RiwayatKegiatanMptState>(
                            //   listenWhen: (prev, current) =>
                            //   prev.runtimeType != current.runtimeType,
                            //   listener: (context, state) {
                            //     if (state is RiwayatKegiatanMptSuccess) {
                            //       mipokaCustomToast('File Berhasil di Upload');
                            //       Navigator.pop(context);
                            //     } else if (state is RiwayatKegiatanMptError) {
                            //       mipokaCustomToast(state.message);
                            //     }
                            //   },
                            //   child: const SizedBox(),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else if (riwayatKegiatanState is RiwayatKegiatanMptError) {
                return Text(riwayatKegiatanState.message);
              } else {
                // return const Text("RiwayatKegiatan hasn't been triggered");
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
