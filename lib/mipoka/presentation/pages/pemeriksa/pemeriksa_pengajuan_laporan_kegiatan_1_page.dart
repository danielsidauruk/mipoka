import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanLaporanKegiatan1Page extends StatefulWidget {
  const PemeriksaPengajuanLaporanKegiatan1Page({super.key});

  @override
  State<PemeriksaPengajuanLaporanKegiatan1Page> createState() =>
      _PemeriksaPengajuanLaporanKegiatan1PageState();
}

class _PemeriksaPengajuanLaporanKegiatan1PageState
    extends State<PemeriksaPengajuanLaporanKegiatan1Page> {
  final TextEditingController _commentNamaKegiatanController =
      TextEditingController();
  final TextEditingController _commentPencapaianController =
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Kegiatan - Laporan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  customDisplayField('Mikroskil Esport'),
                  const CustomFieldSpacer(),
                  CustomCommentWidget(
                    title: 'Nama Kegiatan',
                    mainText: 'Vexana Starlight Tournament - MEL Mar 2023',
                    controller: _commentNamaKegiatanController,
                  ),
                  const CustomFieldSpacer(),
                  CustomCommentWidget(
                    title: 'Pencapaian',
                    mainText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                    controller: _commentPencapaianController,
                  ),
                  const CustomFieldSpacer(),
                  CustomMipokaButton(
                    onTap: () => Navigator.pushNamed(
                      context,
                      pemeriksaPengajuanLaporanKegiatan2PageRoute,
                    ),
                    text: 'Berikutnya',
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
