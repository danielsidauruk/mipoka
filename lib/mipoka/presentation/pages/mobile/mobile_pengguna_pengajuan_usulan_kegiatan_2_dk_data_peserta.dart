import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';

class MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta({Key? key}) : super(key: key);

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta> createState() => _MobilePenggunaPengajuanUsulanKegiatan2DKDataPesertaState();
}

class _MobilePenggunaPengajuanUsulanKegiatan2DKDataPesertaState extends State<MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta> {

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Pengajuan - Kegiatan - Usulan Kegiatan',
                      style: mobileTitle,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

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
