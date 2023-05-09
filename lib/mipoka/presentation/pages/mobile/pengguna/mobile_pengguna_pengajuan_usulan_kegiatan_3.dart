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

class MobilePenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan3({super.key});

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan3> createState() =>
      _MobilePenggunaPengajuanUsulanKegiatan3State();
}

class _MobilePenggunaPengajuanUsulanKegiatan3State
    extends State<MobilePenggunaPengajuanUsulanKegiatan3> {
  bool tempatKegiatan = false;
  bool tertibAcara = false;

  final QuillController _latarBelakangController = QuillController.basic();
  final QuillController _tujuanKegiatanController = QuillController.basic();
  final QuillController _manfaatKegiatanController = QuillController.basic();
  final QuillController _bentukPelaksanaanKegiatanController = QuillController.basic();
  final QuillController _targetPencapaianKegiatanController = QuillController.basic();
  final QuillController _waktuDanTempatPelaksanaanKegiatanController = QuillController.basic();
  final QuillController _rencanaAnggaranKegiatanController = QuillController.basic();
  final QuillController _perlengkapanDanPeralatanController = QuillController.basic();
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Latar Belakang'),
                  buildDescription('Berisi latar belakang kegiatan diusulkan'),
                  CustomRichTextField(controller: _latarBelakangController),

                  const CustomFieldSpacer(),

                  buildTitle('Tujuan Kegiatan'),
                  buildDescription('Berisi tujuan kegiatan diusulkan'),
                  CustomRichTextField(controller: _tujuanKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Manfaat Kegiatan'),
                  buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                  CustomRichTextField(controller: _manfaatKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Bentuk Pelaksanaan Kegiatan'),
                  buildDescription('Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                  CustomRichTextField(controller: _bentukPelaksanaanKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Target Pencapaian Kegiatan'),
                  buildDescription('Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                  CustomRichTextField(controller: _targetPencapaianKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu dan Tempat Pelaksanaan'),
                  buildDescription('Rincikan dengan jelas'),
                  CustomRichTextField(controller: _waktuDanTempatPelaksanaanKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Rencana Anggaran Kegiatan'),
                  buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                  CustomRichTextField(controller: _rencanaAnggaranKegiatanController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      buildTitle('Tertib Acara'),

                      Switch(
                        value: tertibAcara,
                        onChanged: (bool newValue) {
                          setState(() => tertibAcara = newValue);
                        },
                      ),

                      Expanded(
                        child: tertibAcara == false ?
                        buildTitle('Tidak') :
                        buildTitle('Ya'),
                      ),
                    ],
                  ),
                  tertibAcara != false ?
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan3TertibAcaraRoute),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Detail',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ) :
                  const Center(),

                  const CustomFieldSpacer(),

                  buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                  buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                  CustomRichTextField(controller: _perlengkapanDanPeralatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Penutup'),
                  CustomRichTextField(controller: _penutupController),

                  const CustomFieldSpacer(),

                  buildTitle('Lampiran - Lampiran'),

                  const CustomFieldSpacer(),

                  buildTitle('Postingan Kegiatan'),
                  buildDescription('Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                  CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('postingKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Postingan Kegiatan'),
                  buildDescription('Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                  CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('postingKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Surat Undangan Kegiatan'),
                  buildDescription('Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('suratUndanganKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Linimasa Kegiatan'),
                  buildDescription('Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('linimasaKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Kegiatan'),
                  buildDescription('Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(onTap: () => FileUploader.selectAndUploadFile('tempatKegiatanButton')),

                  const CustomFieldSpacer(),

                  CustomButton(
                    navigation: () {
                      Navigator.pushNamed(context, mobilePenggunaDaftarPengajuanKegiatanRoute);
                    },
                    text: 'Kirim',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
