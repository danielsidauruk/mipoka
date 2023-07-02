import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanUsulanKegiatan3Page extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan3Page({
    required this.idRevisiUsulan,
    super.key,
  });

  final int idRevisiUsulan;

  @override
  State<PemeriksaPengajuanUsulanKegiatan3Page> createState() =>
      _PemeriksaPengajuanUsulanKegiatan3PageState();
}

class _PemeriksaPengajuanUsulanKegiatan3PageState
    extends State<PemeriksaPengajuanUsulanKegiatan3Page> {
  final TextEditingController _latarBelakangController =
      TextEditingController();
  final TextEditingController _tujuanKegiatanController =
      TextEditingController();
  final TextEditingController _manfaatKegiatanController =
      TextEditingController();
  final TextEditingController _bentukPelaksanaanKegiatanController =
      TextEditingController();
  final TextEditingController _targetPencapaianKegiatanController =
      TextEditingController();
  final TextEditingController _waktuDanTempatPelaksanaanKegiatanController =
      TextEditingController();
  final TextEditingController _rencanaAnggaranKegiatanController =
      TextEditingController();
  final TextEditingController _perlengkapanDanPeralatanController =
      TextEditingController();
  final TextEditingController _penutupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
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
                  CustomCommentWidget(
                    title: 'Latar Belakang',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _latarBelakangController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Tujuan Kegiatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _tujuanKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Manfaat Kegiatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _manfaatKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Bentuk Pelaksanaan Kegiatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _bentukPelaksanaanKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Bentuk Pelaksanaan Kegiatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _targetPencapaianKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Waktu dan Tempat Pelaksanaan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _waktuDanTempatPelaksanaanKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Rencana Anggaran Kegiatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _rencanaAnggaranKegiatanController,
                  ),

                  const CustomFieldSpacer(),

                  // tertibAcara != false ?
                  buildTitle('Tertib Acara'),
                  CustomIconButton(
                    onTap: () => Navigator.pushNamed(context,
                        pemeriksaPengajuanUsulanKegiatan3TertibAcaraPageRoute),
                    text: 'Detail',
                    icon: Icons.arrow_forward_ios,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Perlengkapan dan Peralatan',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _perlengkapanDanPeralatanController,
                  ),

                  const CustomFieldSpacer(),

                  CustomCommentWidget(
                    title: 'Penutup',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _penutupController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Lampiran - Lampiran'),

                  const CustomFieldSpacer(height: 4.0),

                  buildTitle('Postingan Kegiatan'),
                  buildDescription(
                      'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                  CustomIconButton(
                    onTap: () => selectAndUploadFile(
                      'postingKegiatanButton',
                      // 1,
                    ),
                    text: 'postingan_kegiatan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Surat Undangan Kegiatan'),
                  buildDescription(
                      'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                  CustomIconButton(
                    onTap: () => selectAndUploadFile(
                      'suratUndanganKegiatanButton',
                      // 1,
                    ),
                    text: 'surat_undangan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Linimasa Kegiatan'),
                  buildDescription(
                      'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                  CustomIconButton(
                    onTap: () => selectAndUploadFile(
                      'linimasaKegiatanButton',
                      // 1
                    ),
                    text: 'linimasa_kegiatan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Kegiatan'),
                  buildDescription(
                      'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                  CustomIconButton(
                    onTap: () => selectAndUploadFile(
                      'tempatKegiatanButton',
                      // 1
                    ),
                    text: 'tempat_kegiatan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  CustomMipokaButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, pemeriksaDaftarUsulanKegiatanPageRoute);
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
