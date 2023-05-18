import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_check_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';

class MobilePenggunaPengajuanSaranaDanPrasarana extends StatefulWidget {
  const MobilePenggunaPengajuanSaranaDanPrasarana({super.key});

  @override
  State<MobilePenggunaPengajuanSaranaDanPrasarana> createState() =>
      _MobilePenggunaPengajuanSaranaDanPrasaranaState();
}

class _MobilePenggunaPengajuanSaranaDanPrasaranaState
    extends State<MobilePenggunaPengajuanSaranaDanPrasarana> {
  String namaOrmawaValue = listNamaOrmawa[0];
  String gedungValue = listGedung[0];
  String ruangValue = listGedung[0];
  DateTime? tanggalMulaiKegiatan;
  DateTime? tanggalSelesaiKegiatan;
  TimeOfDay? waktuMulaiKegiatan;
  TimeOfDay? waktuSelesaiKegiatan;
  bool isChecked = false;

  final TextEditingController _proyektorLcdController = TextEditingController();
  final TextEditingController _laptopController = TextEditingController();
  final TextEditingController _mikrofonController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _tvController = TextEditingController();
  final TextEditingController _lampuController = TextEditingController();

  final QuillController _kegiatanController = QuillController.basic();
  final QuillController _lainController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Pengajuan - Sarana dan Prasarana'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  CustomDropdownButton(
                    items: listNamaOrmawa,
                    value: namaOrmawaValue,
                    onChanged: (String? value) {
                      setState(() => namaOrmawaValue = value!);
                    },
                  ),
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
                  buildTitle('Gedung'),
                  CustomDropdownButton(
                    items: listGedung,
                    value: gedungValue,
                    onChanged: (String? value) {
                      setState(() => gedungValue = value!);
                    },
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Ruang'),
                  CustomDropdownButton(
                    items: listGedung,
                    value: ruangValue,
                    onChanged: (String? value) {
                      setState(() => ruangValue = value!);
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
                  CustomRichTextField(controller: _kegiatanController),
                  const CustomFieldSpacer(),
                  buildTitle('Perlengkapan yang dibutuhkan'),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'Proyektor/LCD',
                    controller: _proyektorLcdController,
                  ),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'Laptop',
                    controller: _laptopController,
                  ),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'Mikrofon',
                    controller: _mikrofonController,
                  ),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'Speaker',
                    controller: _speakerController,
                  ),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'TV',
                    controller: _tvController,
                  ),
                  const SizedBox(height: 4.0),
                  CustomCheckBox(
                    title: 'Lampu',
                    controller: _lampuController,
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Lain - lain'),
                  CustomRichTextField(controller: _lainController),
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Batal',
                      ),
                      const SizedBox(width: 8.0),
                      CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context,
                              penggunaDaftarPengajuanKegiatanPageRoute);
                        },
                        text: 'Kirim',
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
