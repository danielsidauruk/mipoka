import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/mobile_kemahasiswaan_custom_drawer.dart';

class MobileKemahasiswaanMPTMahasiswaTambahPeriodePage extends StatefulWidget {
  const MobileKemahasiswaanMPTMahasiswaTambahPeriodePage({super.key});

  @override
  State<MobileKemahasiswaanMPTMahasiswaTambahPeriodePage> createState() => _MobileKemahasiswaanMPTMahasiswaTambahPeriodePageState();
}

class _MobileKemahasiswaanMPTMahasiswaTambahPeriodePageState extends State<MobileKemahasiswaanMPTMahasiswaTambahPeriodePage> {

  String yearValue = DateTime.now().year.toString();
  bool isChecked = false;
  DateTime? tanggalMulai;
  DateTime? tanggalSelesai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  
                  buildTitle('Tahun'),

                  CustomDropdownButton(
                    value: yearValue,
                    items: years,
                    onChanged: (String? value) {
                      setState(() => yearValue = value!);
                    },
                  ),

                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),

                      const Text('Tahun mengulang'),
                    ],
                  ),

                  buildTitle('Tanggal mulai'),

                  CustomDatePickerField(
                    selectedDate: tanggalMulai,
                    onDateSelected: (value) {
                      setState(() => tanggalMulai = value);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal selesai'),

                  CustomDatePickerField(
                    selectedDate: tanggalSelesai,
                    onDateSelected: (value) {
                      setState(() => tanggalSelesai = value);
                    },
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Simpan',
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
