import 'dart:io';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

class PenggunaMPTUnggahBuktiPage extends StatefulWidget {
  const PenggunaMPTUnggahBuktiPage({
    required this.idKegiatanPerPeriodeMpt,
    super.key,
  });

  final int idKegiatanPerPeriodeMpt;

  @override
  State<PenggunaMPTUnggahBuktiPage> createState() => _PenggunaMPTUnggahBuktiPageState();
}

class _PenggunaMPTUnggahBuktiPageState extends State<PenggunaMPTUnggahBuktiPage> {
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _fileSertifikatMptController = TextEditingController();
  final TextEditingController _shaController = TextEditingController();
  final StreamController<String?> _fileSertifikatMptStream = StreamController<String?>();
  final StreamController<bool?> _isNotDuplicatedStream = StreamController<bool?>();

  @override
  void initState() {
    context.read<RiwayatKegiatanMptBloc>().add(ReadAllRiwayatKegiatanMptEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    context.read<RiwayatKegiatanMptBloc>().close();
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
                                result = await FilePicker.platform.pickFiles();
                                _fileSertifikatMptStream.add(result?.names.first ?? "");
                              },
                              onDelete: () {
                                // deleteFileFromFirebase(_fileSertifikatMptController.text);
                                // _fileSertifikatMptController.text = "";
                                _fileSertifikatMptStream.add("");
                                // _isNotDuplicatedStream.add(false);
                                mipokaCustomToast("File telah dihapus.");
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

                            BlocBuilder<MipokaUserBloc, MipokaUserState>(
                              builder: (context, mipokaUserState) {
                                if(mipokaUserState is MipokaUserLoading) {
                                  return const Text("Loading ...");
                                } else if (mipokaUserState is MipokaUserHasData) {
                                  return CustomMipokaButton(
                                    onTap: () async {
                                      if (_keteranganController.text.isNotEmpty) {
                                        try {
                                          final result = this.result;
                                          if (result != null) {
                                            PlatformFile file = result.files.first;

                                            List<int> bytes = await File(file.path!).readAsBytes();
                                            String fileHash = sha256.convert(bytes).toString();

                                            List<String> hashList = riwayatKegiatanState.riwayatKegiatanMptList.map((sha256) => sha256.hash).toList();

                                            if (hashList.contains(fileHash) == true) {
                                              mipokaCustomToast("Tidak dapat mengunggah file yang sama");
                                            } else {
                                              String? downloadUrl = await uploadFileToFirebase(file, "sertifikatmpt${user?.uid ?? "unknown"}");
                                              _shaController.text = fileHash;
                                              _fileSertifikatMptController.text = downloadUrl ?? "";

                                              Future.microtask(() {
                                                context.read<RiwayatKegiatanMptBloc>().add(
                                                  CreateRiwayatKegiatanMptEvent(
                                                    riwayatKegiatanMpt: RiwayatKegiatanMpt(
                                                      idKegiatanPerPeriodeMpt: widget.idKegiatanPerPeriodeMpt,
                                                      idRiwayatKegiatanMpt: newId,
                                                      idUser: mipokaUserState.mipokaUser.idUser,
                                                      statusMpt: "pending",
                                                      fileSertifikatMpt: _fileSertifikatMptController.text,
                                                      hash: _shaController.text,
                                                      keteranganMhs: _keteranganController.text,
                                                      keteranganSa: "",
                                                      createdAt: currentDate,
                                                      createdBy: user?.email ?? "unknown",
                                                      updatedAt: currentDate,
                                                      updatedBy: user?.email ?? "unknown",
                                                    ),
                                                  ),
                                                );

                                                Navigator.pop(context);
                                              });
                                              mipokaCustomToast('File uploaded Successfully');
                                            }
                                          } else {
                                            mipokaCustomToast("Harap unggah file.");
                                          }
                                        } catch (error) {
                                          mipokaCustomToast(error.toString());
                                        }
                                      } else {
                                        mipokaCustomToast(emptyFieldMessage);
                                      }
                                    },
                                    text: "Tambah",
                                  );
                                } else if (mipokaUserState is MipokaUserError) {
                                  return Text(mipokaUserState.message);
                                } else {
                                  return const Text("MipokaUser Hasn't been triggered yet");
                                }
                              },
                            ),
                          ],
                        ),

                        // StreamBuilder<bool?>(
                        //   stream: _isNotDuplicatedStream.stream,
                        //   builder: (context, snapshot) {
                        //     bool isNotDuplicated = snapshot.data ?? false;
                        //     return Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         CustomMipokaButton(
                        //           onTap: () => Navigator.pop(context),
                        //           text: 'Batal',
                        //         ),
                        //
                        //         const SizedBox(width: 8.0),
                        //
                        //         isNotDuplicated == true ?
                        //         CustomMipokaButton(
                        //           onTap: () {
                        //             context.read<RiwayatMptBloc>().add(
                        //             CreateRiwayatMptEvent(
                        //               riwayatMpt: RiwayatMpt(
                        //                 idRiwayatMpt: idRiwayatMpt,
                        //                 idKegiatanMpt: idKegiatanMpt,
                        //                 idUser: idUser,
                        //                 statusMpt: statusMpt,
                        //                 fileSertifikatMpt: fileSertifikatMpt,
                        //                 hash: hash,
                        //                 keteranganMhs: keteranganMhs,
                        //                 keteranganSa: keteranganSa,
                        //                 createdAt: createdAt,
                        //                 createdBy: createdBy,
                        //                 updatedAt: updatedAt,
                        //                 updatedBy: updatedBy,
                        //               ),
                        //             ),
                        //             );
                        //             // Navigator.pop(context);
                        //           },
                        //           text: 'Tambah',
                        //         ) :
                        //         CustomMipokaButton(
                        //           onTap: () {
                        //             mipokaCustomToast("Mohon unggah sertifikat");},
                        //           text: "Tambah",
                        //         ),
                        //       ],
                        //     );
                        //   }
                        // ),
                      ],
                    ),
                  ],
                );
              } else if (riwayatKegiatanState is RiwayatKegiatanMptError) {
                return Text(riwayatKegiatanState.message);
              } else {
                return const Text("RiwayatKegiatan hasn't been triggered");
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<String?> selectAndUploadFile(String fileName) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      String? downloadUrl = await uploadFileToFirebase(file, fileName);

      mipokaCustomToast('File uploaded Successfully');
      return downloadUrl;
    } else {
      return null;
    }
  } catch (error) {
    mipokaCustomToast(error.toString());
    return null;
  }
}
