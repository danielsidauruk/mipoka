import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/read_pdf.dart';
import 'package:mipoka/domain/utils/usulan_kegiatan_template.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_switch_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:http/http.dart' as http;

class PenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan3({super.key});

  @override
  State<PenggunaPengajuanUsulanKegiatan3> createState() =>
      _PenggunaPengajuanUsulanKegiatan3State();
}

class _PenggunaPengajuanUsulanKegiatan3State
    extends State<PenggunaPengajuanUsulanKegiatan3> {

  bool tempatKegiatan = false;
  bool tertibAcara = false;

  final QuillController _latarBelakangController = QuillController.basic();
  final QuillController _tujuanKegiatanController = QuillController.basic();
  final QuillController _manfaatKegiatanController = QuillController.basic();
  final QuillController _bentukPelaksanaanKegiatanController =
      QuillController.basic();
  final QuillController _targetPencapaianKegiatanController =
      QuillController.basic();
  final QuillController _waktuDanTempatPelaksanaanKegiatanController =
      QuillController.basic();
  final QuillController _rencanaAnggaranKegiatanController =
      QuillController.basic();
  final QuillController _perlengkapanDanPeralatanController =
      QuillController.basic();
  final QuillController _penutupController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    print('Page 3 Reloaded');
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
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
                  buildDescription(
                      'Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                  CustomRichTextField(
                      controller: _bentukPelaksanaanKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Target Pencapaian Kegiatan'),
                  buildDescription(
                      'Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                  CustomRichTextField(
                      controller: _targetPencapaianKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu dan Tempat Pelaksanaan'),
                  buildDescription('Rincikan dengan jelas'),
                  CustomRichTextField(
                      controller: _waktuDanTempatPelaksanaanKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Rencana Anggaran Kegiatan'),
                  buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                  CustomRichTextField(
                      controller: _rencanaAnggaranKegiatanController),

                  const CustomFieldSpacer(),

                  CustomSwitch(
                    title: 'Tertib Acara',
                    option1: 'Tidak',
                    option2: 'Ya',
                    onChanged: (value) {
                      setState(() => tertibAcara = value);
                    },
                  ),

                  tertibAcara == true
                      ? InkWell(
                          onTap: () => Navigator.pushNamed(context,
                              penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute),
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
                        )
                      : const Center(),

                  const CustomFieldSpacer(),

                  buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                  buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                  CustomRichTextField(
                      controller: _perlengkapanDanPeralatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Penutup'),
                  CustomRichTextField(controller: _penutupController),

                  const CustomFieldSpacer(),

                  buildTitle('Lampiran - Lampiran'),

                  const CustomFieldSpacer(),

                  buildTitle('Postingan Kegiatan'),
                  buildDescription(
                      'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                  CustomFilePickerButton(
                      onTap: () => FileUploader.selectAndUploadFile(
                          'postingKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Postingan Kegiatan'),
                  buildDescription(
                      'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                  CustomFilePickerButton(
                      onTap: () => FileUploader.selectAndUploadFile(
                          'postingKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Surat Undangan Kegiatan'),
                  buildDescription(
                      'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(
                      onTap: () => FileUploader.selectAndUploadFile(
                          'suratUndanganKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Linimasa Kegiatan'),
                  buildDescription(
                      'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(
                      onTap: () => FileUploader.selectAndUploadFile(
                          'linimasaKegiatanButton')),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Kegiatan'),
                  buildDescription(
                      'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                  CustomFilePickerButton(
                      onTap: () => FileUploader.selectAndUploadFile(
                          'tempatKegiatanButton')),

                  const CustomFieldSpacer(),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Sebelumnya',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        // onTap: () => Navigator.pushNamed(context, penggunaDaftarPengajuanKegiatanPageRoute),
                        onTap: () {
                          // fillDocxTemplate();
                          // showPDFViewer(context, 'https://storage.googleapis.com/usulan_kegiatan_output/cheatsheet-gcp-A4.pdf');
                          // PdfViewer.openAsset('assets/hello.pdf')
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomPdfViewer(
                                pdfUrl: 'https://storage.googleapis.com/usulan_kegiatan_output/cheatsheet-gcp-A4.pdf',
                              ),
                            ),
                          );
                          print('Button has been pressed');
                          // print('getPlainText : ${_latarBelakangController.getPlainText()}');
                          // print('document ${_latarBelakangController.document.toPlainText()}');
                          // print('document ${_latarBelakangController.document.toDelta()}');
                        },
                        text: 'Kirim',
                      ),
                    ],
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
