import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/Method/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';

class MobilePenggunaPengajuanLaporanKegiatan3 extends StatefulWidget {
  const MobilePenggunaPengajuanLaporanKegiatan3({super.key});

  @override
  State<MobilePenggunaPengajuanLaporanKegiatan3> createState() =>
      _MobilePenggunaPengajuanLaporanKegiatan3State();
}

class _MobilePenggunaPengajuanLaporanKegiatan3State
    extends State<MobilePenggunaPengajuanLaporanKegiatan3> {
  bool tempatKegiatan = false;
  bool isLampiran = false;

  final QuillController _latarBelakangController = QuillController.basic();
  final QuillController _hasilKegiatanController = QuillController.basic();
  final QuillController _penutupController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Latar Belakang'),
                  buildDescription('Berisi latar belakang kegiatan diusulkan'),
                  CustomRichTextField(controller: _latarBelakangController),

                  const CustomFieldSpacer(),

                  buildTitle('Tujuan Kegiatan'),
                  buildDescription('Berisi tujuan kegiatan diusulkan'),
                  CustomRichTextField(controller: _hasilKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Penutup'),
                  buildDescription('Ucapkan salam penutup.'),
                  CustomRichTextField(controller: _penutupController),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      buildTitle('Lampiran'),

                      Switch(
                        value: isLampiran,
                        onChanged: (bool newValue) {
                          setState(() => isLampiran = newValue);
                        },
                      ),

                      Expanded(
                        child: isLampiran == false ?
                        buildTitle('Tidak') :
                        buildTitle('Ya'),
                      ),
                    ],
                  ),
                  isLampiran != false ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomFieldSpacer(),

                      buildTitle('Postingan Kegiatan'),
                      buildDescription('Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                      CustomFilePickerButton(
                        onTap: () => FileUploader.selectAndUploadFile('postingLaporanKegiatanButton'),
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Dokumentasi Kegiatan'),
                      buildDescription('Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                      CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('dokumentasiKegiatanButton')),

                      const CustomFieldSpacer(),

                      buildTitle('Tabulasi Hasil'),
                      buildDescription('Unggah foto pencapaian dari kegiatan yang telah dilaksanakan.'),
                      CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('tabulasiHasilButton')),

                      const CustomFieldSpacer(),

                      buildTitle('Faktur Pembayaran'),
                      buildDescription('Unggah bon transaksi kegiatan yang telah dilaksanakan.'),
                      CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('fakturPembayaranButton')),
                    ],
                  ) :
                  const Center(),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Sebelumnya',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, mobilePenggunaDaftarLaporanKegiatanRoute);
                        },
                        text: 'Kirim',
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}