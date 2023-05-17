import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta({Key? key}) : super(key: key);

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta> createState() => _MobilePenggunaPengajuanUsulanKegiatan2LKDataPesertaState();
}

class _MobilePenggunaPengajuanUsulanKegiatan2LKDataPesertaState extends State<MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta> {
  DateTime? tanggalLahir;
  final TextEditingController _nipNipController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();

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

                  customBoxTitle('Data Peserta'),

                  const CustomFieldSpacer(),

                  buildTitle('NIM/NIP'),
                  CustomTextField(
                    controller: _nipNipController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Lengkap'),
                  CustomTextField(controller: _namaLengkapController),

                  const CustomFieldSpacer(),

                  buildTitle('NIK'),
                  CustomTextField(controller: _nikController),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Lahir'),
                  CustomTextField(controller: _tempatLahirController),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Lahir'),
                  CustomDatePickerField(
                    selectedDate: tanggalLahir,
                    onDateSelected: (value) {
                      setState(() {
                        tanggalLahir = value;
                      });
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Peran'),
                  CustomTextField(controller: _peranController),

                  const CustomFieldSpacer(),

                  buildTitle('Dasar Pengiriman'),
                  CustomTextField(controller: _dasarPengirimanController),

                  const CustomFieldSpacer(),

                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Tambahkan Peserta',
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
