import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanLaporanKegiatan3Page extends StatefulWidget {
  const PemeriksaPengajuanLaporanKegiatan3Page({super.key});

  @override
  State<PemeriksaPengajuanLaporanKegiatan3Page> createState() =>
      _PemeriksaPengajuanLaporanKegiatan3PageState();
}

class _PemeriksaPengajuanLaporanKegiatan3PageState
    extends State<PemeriksaPengajuanLaporanKegiatan3Page> {
  final TextEditingController _latarBelakangController =
      TextEditingController();
  final TextEditingController _hasilKegiatanController =
      TextEditingController();
  final TextEditingController _penutupController = TextEditingController();
  final TextEditingController _postinganKegiatanController =
      TextEditingController();
  final TextEditingController _dokumentasiKegiatanController =
      TextEditingController();
  final TextEditingController _tabulasiHasilController =
      TextEditingController();
  final TextEditingController _fakturpembayaranController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Kegiatan - Laporan Kegiatan'),
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
                    controller: _hasilKegiatanController,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentWidget(
                    title: 'Penutup',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _penutupController,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentForTable(
                    title: 'Postingan Kegiatan',
                    description: 'Catatan (Berisi file yang harus direvisi)',
                    controller: _postinganKegiatanController,
                  ),
                  CustomIconButton(
                    onTap: () => FileUploader.selectAndUploadFile(
                        'postingLaporanKegiatanButton'),
                    text: 'postingan_kegiatan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentForTable(
                    title: 'Dokumentasi Kegiatan',
                    description: 'Catatan (Berisi file yang harus direvisi)',
                    controller: _dokumentasiKegiatanController,
                  ),
                  CustomIconButton(
                    onTap: () => FileUploader.selectAndUploadFile(
                        'dokumentasiKegiatanButton'),
                    text: 'dokumentasi_kegiatan.pdf',
                    icon: Icons.picture_as_pdf,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentForTable(
                    title: 'Tabulasi Hasil',
                    description: 'Catatan (Berisi file yang harus direvisi)',
                    controller: _tabulasiHasilController,
                  ),
                  CustomIconButton(
                    onTap: () =>
                        FileUploader.selectAndUploadFile('tabulasiHasilButton'),
                    text: 'tabulasi_hasil.pdf',
                    icon: Icons.picture_as_pdf,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentForTable(
                    title: 'Faktur Pembayaran',
                    description: 'Catatan (Berisi file yang harus direvisi)',
                    controller: _fakturpembayaranController,
                  ),
                  CustomIconButton(
                    onTap: () => FileUploader.selectAndUploadFile(
                        'fakturPembayaranButton'),
                    text: 'tabulasi_hasil.pdf',
                    icon: Icons.picture_as_pdf,
                  ),
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // CustomButton(
                      //   navigation: () {
                      //     Navigator.pop(context);
                      //   },
                      //   text: 'Sebelumnya',
                      // ),
                      //
                      // const SizedBox(width: 4.0),

                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pushNamed(
                              context, pemeriksaDaftarLaporanKegiatanPageRoute);
                        },
                        text: 'Tolak',
                      ),

                      const SizedBox(width: 4.0),

                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pushNamed(
                              context, pemeriksaDaftarLaporanKegiatanPageRoute);
                        },
                        text: 'Terima',
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
