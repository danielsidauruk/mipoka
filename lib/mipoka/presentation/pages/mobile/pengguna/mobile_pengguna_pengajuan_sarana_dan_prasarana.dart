import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/Method/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
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

  final QuillController _kegiatanController = QuillController.basic();
  final QuillController _lainController = QuillController.basic();

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
                  CustomTimePickerField(
                    selectedTime: waktuSelesaiKegiatan,
                    onTimeSelected: (TimeOfDay time) {
                      waktuSelesaiKegiatan = time;
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Kegiatan'),
                  CustomRichTextField(controller: _kegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Perlengkapan yang dibutuhkan'),

                  const CustomFieldSpacer(),

                  buildTitle('Lain - lain'),
                  CustomRichTextField(controller: _lainController),

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
