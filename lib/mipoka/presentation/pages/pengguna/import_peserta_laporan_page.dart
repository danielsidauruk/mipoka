import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file.dart';
import 'package:mipoka/domain/utils/download_service.dart';
import 'package:mipoka/domain/utils/get_device_info.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:permission_handler/permission_handler.dart';

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

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () async {
                          // downloadFile(pesertaKegiatanTemplate);
                          // downloadFileWithDio(
                          //   url: pesertaKegiatanTemplate,
                          //   fileName: "pesertaKegiatan.xlsx"
                          // );
                          html.window.open(pesertaKegiatanTemplate, "_blank");
                          // getDeviceInfo();
                          // DownloadService downloadService =
                          // kIsWeb ? WebDownloadService() : MobileDownloadService();
                          // await downloadService.download(url: pesertaKegiatanTemplate);
                        },
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
                              pesertaKegiatanLaporan: const PesertaKegiatanLaporan(
                                idPesertaKegiatanLaporan: 0,
                                nim: "",
                                namaLengkap: "",
                                peran: "",
                                createdAt: "",
                                createdBy: "",
                                updatedAt: "",
                                updatedBy: "",
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

  Future<void> downloadFileWithDio({required String url, required String fileName}) async {
    try {
      if (Platform.isAndroid) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          // Add more permissions to request here.
        ].request();

        if (statuses[Permission.storage]!.isGranted) {
          var dir = await DownloadsPathProvider.downloadsDirectory;
          if (dir != null) {
            // String fileName = url.split('/').last;
            String savePath = "${dir.path}/$fileName";
            print(savePath);
            // Output: /storage/emulated/0/Download/file.pdf

            await Dio().download(
              url,
              savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  print("${(received / total * 100).toStringAsFixed(0)}%");
                  // return mipokaCustomToast("${(received / total * 100).toStringAsFixed(0)}%");
                  // You can build a progress bar feature too.
                }
              },
            );
            mipokaCustomToast("File is saved to the download folder.");
          }
        } else {
          mipokaCustomToast("No permission to read and write.");
        }
      } else if (kIsWeb) {
        html.window.open(url, "_blank");
      }
    } catch (e) {
      mipokaCustomToast("Error while downloading file: $e");
      print(e);
    }
  }
}

// Future<void> _downloadFile({}) async {
//   DownloadService downloadService =
//   kIsWeb ? WebDownloadService() : MobileDownloadService();
//   await downloadService.download(url: url);
// }
