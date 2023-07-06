import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
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
    required this.idLaporan,
  });

  final int idLaporan;

  @override
  State<ImportPesertaLaporanPage> createState() => _ImportPesertaLaporanPageState();
}

class _ImportPesertaLaporanPageState extends State<ImportPesertaLaporanPage> {

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;
  FilePickerResult? result;

  void _processUploadedFile(PlatformFile file) async {
    Uint8List? bytes;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      Excel excel = Excel.decodeBytes(bytes);
      Sheet? sheet = excel.tables[excel.tables.keys.first];

      List nimList = [];
      List peranList = [];

      for (var row in sheet!.rows) {
        var nim = row[0]?.value;
        var peran = row[1]?.value;

        if (nim != null && peran != null) {
          nimList.add(nim);
          peranList.add(peran);
        }
      }

      for (var i = 1; i < nimList.length; i++) {
        context.read<PesertaKegiatanLaporanBloc>().add(
          CreatePesertaKegiatanLaporanEvent(
            idLaporanKegiatan: widget.idLaporan,
            pesertaKegiatanLaporan: PesertaKegiatanLaporan(
              idPesertaKegiatanLaporan: newId + i,
              nim: nimList[i].toString(),
              namaLengkap: "",
              peran: peranList[i].toString(),
              createdAt: currentDate,
              createdBy: user?.email ?? "unknown",
              updatedAt: currentDate,
              updatedBy: user?.email ?? "unknown",
            ),
          ),
        );
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
                          final result = this.result;
                          if (result != null) {
                            PlatformFile file = result.files.first;
                            _processUploadedFile(file);

                            mipokaCustomToast("Data telah di update.");
                            Navigator.pop(context);
                          } else {
                            mipokaCustomToast("Harap unggah file yang diperlukan.");
                          }
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
