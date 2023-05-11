import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
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

  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _deskripsiKegiatanController = TextEditingController();
  final TextEditingController _tempatKegiatanController = TextEditingController();
  final TextEditingController _jumlahParsitipanController = TextEditingController();
  final TextEditingController _targetKegiatanController = TextEditingController();
  final TextEditingController _totalPendanaanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

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
                    buildTitle('Nama Ormawa'),
                    CustomDropdownButton(
                      value: ormawaDropDownValue,
                      items: listNamaOrmawa,
                      onChanged: (String? value) {
                        setState(() => ormawaDropDownValue = value!);
                      },
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Pembiayaan'),
                    CustomDropdownButton(
                      value: pembiayaanDropDownValue,
                      items: listPembiayaan,
                      onChanged: (String? value) {
                        setState(() => pembiayaanDropDownValue = value!);
                      },
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Nama Kegiatan'),
                    CustomTextField(controller: _namaKegiatanController),

                    Row(
                      children: [
                        buildTitle('Bentuk Kegiatan'),

                        const SizedBox(width: 4.0),

                        Switch(
                          value: bentukKegiatanValue,
                          onChanged: (bool newValue) {
                            setState(() => bentukKegiatanValue = newValue);
                          },
                        ),

                        const SizedBox(width: 4.0),

                        bentukKegiatanValue == false ?
                        buildTitle('Daring') :
                        buildTitle('Luring'),
                      ],
                    ),

                    CustomDropdownButton(
                      value: bentukKegiatanDropDownValue,
                      items: listBentukKegiatan,
                      onChanged: (String? value) {
                        setState(() => bentukKegiatanDropDownValue = value!);
                      },
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Deskripsi Kegiatan'),
                    CustomTextField(controller: _deskripsiKegiatanController),

                    const CustomFieldSpacer(),

                    buildTitle('Tanggal Mulai Kegiatan'),
                    CustomDatePickerField(
                      selectedDate: tanggalMulaiKegiatan,
                      onDateSelected: (value) {
                        setState(() {
                          tanggalMulaiKegiatan = value;
                        });
                      },
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Tanggal Selesai Kegiatan'),
                    CustomDatePickerField(
                      selectedDate: tanggalSelesaiKegiatan,
                      onDateSelected: (value) {
                        setState(() {
                          tanggalSelesaiKegiatan = value;
                        });
                      },
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
                    CustomTextField(controller: _tempatKegiatanController),

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
                    CustomTextField(controller: _jumlahParsitipanController),

                    const CustomFieldSpacer(),

                    buildTitle('Target Kegiatan'),
                    CustomTextField(controller: _targetKegiatanController),

                    const CustomFieldSpacer(),

                    buildTitle('Total Pendanaan'),
                    CustomTextField(controller: _totalPendanaanController),

                    const CustomFieldSpacer(),

                    buildTitle('Keterangan'),
                    CustomTextField(controller: _keteranganController),

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