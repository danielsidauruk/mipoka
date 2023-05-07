import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
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
                    Text(
                      'Data Peserta',
                      style: mobileSubTitle,
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('NIM/NIP'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('Nama Lengkap'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('NIK'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('Tempat Lahir'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('Tanggal Lahir'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      // height: 35,
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1000),
                            lastDate: DateTime(2100),
                          ).then((value) {
                            if (value != null) {
                              setState(() => tanggalLahir = value);
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tanggalLahir != null
                                  ? DateFormat('dd / MM / yyyy').format(tanggalLahir!)
                                  : '',
                            ),

                            const Icon(
                              Icons.calendar_month_sharp,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('Peran'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    buildTitle('Dasar Pengiriman'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    Button(
                      navigation: () {
                        Navigator.pop(context);
                      },
                      text: 'Tambahkan Peserta',
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
