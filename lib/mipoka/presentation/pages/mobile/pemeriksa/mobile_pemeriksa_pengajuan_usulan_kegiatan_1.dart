import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
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

                    buildTitle('Waktu Mulai Kegiatan'),
                    CustomTimePickerField(
                      selectedTime: waktuMulaiKegiatan,
                      onTimeSelected: (TimeOfDay time) {
                        waktuMulaiKegiatan = time;
                      },
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Waktu Selesai Kegiatan'),
                    CustomTimePickerField(
                      selectedTime: waktuSelesaiKegiatan,
                      onTimeSelected: (TimeOfDay time) {
                        waktuSelesaiKegiatan = time;
                      },
                    ),

                    Row(
                      children: [
                        buildTitle('Tempat Kegiatan Kegiatan'),

                        const SizedBox(width: 4.0),

                        Switch(
                          value: tempatKegiatan,
                          onChanged: (bool newValue) {
                            setState(() => tempatKegiatan = newValue);
                          },
                        ),

                        const SizedBox(width: 4.0),

                        Expanded(
                          child: tempatKegiatan == false ?
                          buildTitle('Dalam Kota') :
                          buildTitle('Luar Kota'),
                        ),
                      ],
                    ),
                    CustomTextField(controller: _commentTempatKegiatanController),

                    const CustomFieldSpacer(),

                    tempatKegiatan != false ?
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTitle('Tanggal Keberangkatan'),
                          CustomDatePickerField(
                            selectedDate: tanggalKeberangkatan,
                            onDateSelected: (value) {
                              setState(() {
                                tanggalKeberangkatan = value;
                              });
                            },
                          ),

                          const CustomFieldSpacer(),

                          buildTitle('Tanggal Kepulangan'),
                          CustomDatePickerField(
                            selectedDate: tanggalKepulangan,
                            onDateSelected: (value) {
                              setState(() {
                                tanggalKepulangan = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ) :
                    const Center(),

                    const CustomFieldSpacer(),

                    Row(
                      children: [
                        buildTitle('Jumlah Parsitipan'),

                        const SizedBox(width: 4.0),

                        Switch(
                          value: jenisPartisipan,
                          onChanged: (bool newValue) {
                            setState(() => jenisPartisipan = newValue);
                          },
                        ),

                        const SizedBox(width: 4.0),

                        Expanded(
                          child: jenisPartisipan == false ?
                          buildTitle('Tim') :
                          buildTitle('Orang'),
                        ),
                      ],
                    ),
                    CustomTextField(controller: _commentJumlahParsitipanController),

                    const CustomFieldSpacer(),

                    buildTitle('Target Kegiatan'),
                    CustomTextField(controller: _commentTargetKegiatanController),

                    const CustomFieldSpacer(),

                    buildTitle('Total Pendanaan'),
                    CustomTextField(controller: _commentTotalPendanaanController),

                    const CustomFieldSpacer(),

                    buildTitle('Keterangan'),
                    CustomTextField(controller: _commentKeteranganController),

                    const CustomFieldSpacer(),

                    buildTitle('Tanda Tangan Ormawa'),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          children: [
                            tandaTangan != true ?
                            InkWell(
                              onTap: () {
                                setState(() => tandaTangan = !tandaTangan);
                              },
                              child: const Text(
                                'Tekan untuk tanda tangan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ) :
                            const Center(),

                            tandaTangan == true ?
                            Column(
                              children: [

                                const CustomFieldSpacer(height: 4.0),

                                SfSignaturePad(
                                  key: signatureGlobalKey,
                                  backgroundColor: Colors.white,
                                  strokeColor: Colors.black,
                                  minimumStrokeWidth: 1.0,
                                  maximumStrokeWidth: 4.0,
                                ),

                                const CustomFieldSpacer(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() => tandaTangan = !tandaTangan);
                                      },
                                      child: const Text(
                                        'Tutup',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: _handleClearButtonPressed,
                                      child: const Text(
                                        'Clear',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ) :
                            const Center(),
                          ],
                        ),
                      ),
                    ),

                    const CustomFieldSpacer(),

                    CustomButton(
                      navigation: () {
                        tempatKegiatan == false ?
                        Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2DKRoute) :
                        Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2LKRoute);
                      },
                      text: 'Berikutnya',
                    )
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }
}