import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/mobile_pemeriksa_custom_drawer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MobilePemeriksaPengajuanUsulanKegiatan1Page extends StatefulWidget {
  const MobilePemeriksaPengajuanUsulanKegiatan1Page({super.key});

  @override
  State<MobilePemeriksaPengajuanUsulanKegiatan1Page> createState() => _MobilePemeriksaPengajuanUsulanKegiatan1PageState();
}

class _MobilePemeriksaPengajuanUsulanKegiatan1PageState extends State<MobilePemeriksaPengajuanUsulanKegiatan1Page> {

  String ormawaDropDownValue = listNamaOrmawa[0];
  String pembiayaanDropDownValue = listPembiayaan[0];
  bool bentukKegiatanValue = false;
  String bentukKegiatanDropDownValue = listBentukKegiatan[0];
  DateTime? tanggalMulaiKegiatan;
  DateTime? tanggalSelesaiKegiatan;
  TimeOfDay? waktuMulaiKegiatan;
  TimeOfDay? waktuSelesaiKegiatan;
  bool tempatKegiatan = false;
  DateTime? tanggalKeberangkatan;
  DateTime? tanggalKepulangan;
  bool jenisPartisipan = false;

  final TextEditingController _commentNamaOrmawaController = TextEditingController();
  final TextEditingController _commentPembiayaanController = TextEditingController();
  final TextEditingController _commentNamaKegiatanController = TextEditingController();
  final TextEditingController _commentBentukKegiatanController = TextEditingController();
  final TextEditingController _commentDeskripsiKegiatanController = TextEditingController();
  final TextEditingController _commentTanggalMulaiKegiatanController = TextEditingController();
  final TextEditingController _commentTanggalSelesaiKegiatanController = TextEditingController();
  final TextEditingController _commentWaktuMulaiKegiatanController = TextEditingController();
  final TextEditingController _commentWaktuSelesaiKegiatanController = TextEditingController();
  final TextEditingController _commentTempatKegiatanController = TextEditingController();
  final TextEditingController _commentTanggalKeberangkatanController = TextEditingController();
  final TextEditingController _commentTanggalKepulanganController = TextEditingController();
  final TextEditingController _commentJumlahParsitipanController = TextEditingController();
  final TextEditingController _commentTargetKegiatanController = TextEditingController();
  final TextEditingController _commentTotalPendanaanController = TextEditingController();
  final TextEditingController _commentKeteranganController = TextEditingController();

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  bool tandaTangan = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPemeriksaDrawer(),

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

                    CustomCommentWidget(
                      title: 'Nama Ormawa',
                      mainText: 'Mikroskil Esport',
                      controller: _commentNamaOrmawaController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Pembiayaan',
                      mainText: 'Mandiri',
                      controller: _commentPembiayaanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Nama Kegiatan',
                      mainText: 'Vexana Starlight Tournament - MEL Mar 2023',
                      controller: _commentNamaKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Bentuk Kegiatan',
                      mainText: 'Daring, Bakti Sosial',
                      controller: _commentBentukKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Deskripsi Kegiatan',
                      mainText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                      controller: _commentDeskripsiKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Tanggal Mulai Kegiatan',
                      mainText: '11/05/2023',
                      controller: _commentTanggalMulaiKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Tanggal Selesai Kegiatan',
                      mainText: '11/05/2023',
                      controller: _commentTanggalSelesaiKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Waktu Mulai Kegiatan',
                      mainText: '13.30',
                      controller: _commentWaktuMulaiKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Waktu Selesai Kegiatan',
                      mainText: '15.30',
                      controller: _commentWaktuSelesaiKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Tempat Kegiatan',
                      mainText: 'Luar Kota, Planet Mars',
                      controller: _commentTempatKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Tanggal Keberangkatan',
                      mainText: '10/05/2023',
                      controller: _commentTanggalKeberangkatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Tanggal Kepulangan',
                      mainText: '13/05/2023',
                      controller: _commentTanggalKepulanganController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Jumlah Parsitipan',
                      mainText: '15 Orang',
                      controller: _commentJumlahParsitipanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Target Kegiatan',
                      mainText: 'Lorem Ipsum',
                      controller: _commentTargetKegiatanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Total Pendanaan',
                      mainText: 'Rp. 20.000.000',
                      controller: _commentTotalPendanaanController,
                    ),

                    const CustomFieldSpacer(),

                    CustomCommentWidget(
                      title: 'Keterangan',
                      mainText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla molestie vestibulum fringilla. Proin scelerisque mattis rhoncus.',
                      controller: _commentKeteranganController,
                    ),

                    const CustomFieldSpacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // CustomButton(
                        //   navigation: () => Navigator.pop(context),
                        //   text: 'Kembali',
                        // ),

                        const SizedBox(width: 8.0),

                        CustomButton(
                          navigation: () => Navigator.pushNamed(context, mobilePemeriksaPengajuanUsulanKegiatan2DKPageRoute),
                          text: 'Berikutnya (DK)',
                        ),

                        const SizedBox(width: 8.0),

                        CustomButton(
                          navigation: () => Navigator.pushNamed(context, mobilePemeriksaPengajuanUsulanKegiatan2LKPageRoute),
                          text: 'Berikutnya (LK)',
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