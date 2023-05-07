import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_textfield.dart';
import 'package:mipoka/mipoka/presentation/widgets/date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';

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

      drawer: const MobilePenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const FieldSpacer(),

              ContentBox(
                children: [
                  Text(
                    'Data Peserta',
                    style: mobileSubTitle,
                  ),

                  const FieldSpacer(),

                  buildTitle('NIM/NIP'),
                  CustomTextField(
                    controller: _nipNipController,
                    textInputType: TextInputType.number,
                  ),

                  const FieldSpacer(),

                  buildTitle('Nama Lengkap'),
                  CustomTextField(controller: _namaLengkapController),

                  const FieldSpacer(),

                  buildTitle('NIK'),
                  CustomTextField(controller: _nikController),

                  const FieldSpacer(),

                  buildTitle('Tempat Lahir'),
                  CustomTextField(controller: _tempatLahirController),

                  const FieldSpacer(),

                  buildTitle('Tanggal Lahir'),
                  DatePickerField(
                    selectedDate: tanggalLahir,
                    onDateSelected: (value) {
                      setState(() {
                        tanggalLahir = value;
                      });
                    },
                  ),

                  const FieldSpacer(),

                  buildTitle('Peran'),
                  CustomTextField(controller: _peranController),

                  const FieldSpacer(),

                  buildTitle('Dasar Pengiriman'),
                  CustomTextField(controller: _dasarPengirimanController),

                  const FieldSpacer(),

                  CustomButton(
                    navigation: () {
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
