import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta extends StatefulWidget {
  const MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta({super.key});

  @override
  State<MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta> createState() => _MobilePenggunaPengajuanLaporanKegiatan2ImportPesertaState();
}

class _MobilePenggunaPengajuanLaporanKegiatan2ImportPesertaState extends State<MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta> {

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
                  CustomFilePickerButton(
                    onTap: () => FileUploader.selectAndUploadFile('importPeserta'),
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Unduh Templat',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        onTap: () {
                          Navigator.pop(context);
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
