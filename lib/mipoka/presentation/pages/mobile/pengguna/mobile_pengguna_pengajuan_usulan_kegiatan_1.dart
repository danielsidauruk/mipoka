import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_textfield.dart';
import 'package:mipoka/mipoka/presentation/widgets/date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/time_picker_field.dart';

class MobilePenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan1({super.key});

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan1> createState() => _MobilePenggunaPengajuanUsulanKegiatan1State();
}

class _MobilePenggunaPengajuanUsulanKegiatan1State extends State<MobilePenggunaPengajuanUsulanKegiatan1> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobilePenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

                const FieldSpacer(),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Nama Ormawa'),
                      titleSpacer(),
                      CustomDropdownButton(
                        value: ormawaDropDownValue,
                        items: listNamaOrmawa,
                        onChanged: (String? value) {
                          setState(() => ormawaDropDownValue = value!);
                        },
                      ),

                      const FieldSpacer(),

                      buildTitle('Pembiayaan'),
                      titleSpacer(),
                      CustomDropdownButton(
                        value: pembiayaanDropDownValue,
                        items: listPembiayaan,
                        onChanged: (String? value) {
                          setState(() => pembiayaanDropDownValue = value!);
                        },
                      ),

                      const FieldSpacer(),

                      buildTitle('Nama Kegiatan'),
                      titleSpacer(),
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

                      const FieldSpacer(),
                      
                      buildTitle('Deskripsi Kegiatan'),
                      titleSpacer(),
                      CustomTextField(controller: _deskripsiKegiatanController),


                      const FieldSpacer(),

                      buildTitle('Tanggal Mulai Kegiatan'),
                      titleSpacer(),
                      DatePickerField(
                        selectedDate: tanggalMulaiKegiatan,
                        onDateSelected: (value) {
                          setState(() {
                            tanggalMulaiKegiatan = value;
                          });
                        },
                      ),

                      const FieldSpacer(),

                      buildTitle('Tanggal Selesai Kegiatan'),
                      titleSpacer(),
                      DatePickerField(
                        selectedDate: tanggalSelesaiKegiatan,
                        onDateSelected: (value) {
                          setState(() {
                            tanggalSelesaiKegiatan = value;
                          });
                        },
                      ),

                      const FieldSpacer(),

                      buildTitle('Waktu Mulai Kegiatan'),
                      titleSpacer(),
                      TimePickerField(
                        selectedTime: waktuMulaiKegiatan,
                        onTimeSelected: (TimeOfDay time) {
                          waktuMulaiKegiatan = time;
                        },
                      ),

                      const FieldSpacer(),

                      buildTitle('Waktu Selesai Kegiatan'),
                      titleSpacer(),
                      TimePickerField(
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
                      titleSpacer(),
                      CustomTextField(controller: _tempatKegiatanController),

                      const FieldSpacer(),

                      tempatKegiatan != false ?
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle('Tanggal Keberangkatan'),
                            titleSpacer(),
                            DatePickerField(
                              selectedDate: tanggalKeberangkatan,
                              onDateSelected: (value) {
                                setState(() {
                                  tanggalKeberangkatan = value;
                                });
                              },
                            ),

                            const FieldSpacer(),

                            buildTitle('Tanggal Kepulangan'),
                            titleSpacer(),
                            DatePickerField(
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

                      const FieldSpacer(),
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
                      titleSpacer(),
                      CustomTextField(controller: _jumlahParsitipanController),

                      const FieldSpacer(),

                      buildTitle('Target Kegiatan'),
                      titleSpacer(),
                      CustomTextField(controller: _targetKegiatanController),

                      const FieldSpacer(),

                      buildTitle('Total Pendanaan'),
                      titleSpacer(),
                      CustomTextField(controller: _totalPendanaanController),

                      const FieldSpacer(),

                      buildTitle('Keterangan'),
                      titleSpacer(),
                      CustomTextField(controller: _keteranganController),

                      const FieldSpacer(),

                      buildTitle('Tanda Tangan Ormawa'),
                      titleSpacer(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.upload,
                            size: 20,
                          ),
                        ),
                      ),

                      const FieldSpacer(),

                      Button(
                        navigation: () {
                          tempatKegiatan == false ?
                          Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2DKRoute) :
                          Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2LKRoute);
                        },
                        text: 'Berikutnya',
                      )
                    ],
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }

  SizedBox titleSpacer() => const SizedBox(height: 4.0);
}