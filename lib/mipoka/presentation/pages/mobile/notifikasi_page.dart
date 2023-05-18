import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_notifikasi_tile.dart';

class MobileNotifikasiPage extends StatefulWidget {
  const MobileNotifikasiPage({super.key});

  @override
  State<MobileNotifikasiPage> createState() => _MobileNotifikasiPageState();
}

class _MobileNotifikasiPageState extends State<MobileNotifikasiPage> {

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
            children: const [

              CustomMobileTitle(text: 'Notifikasi'),

              CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  CustomNotifikasiTile(
                    text: 'Tommy Christian Siregar telah melakukan pengajuan Usulan Kegiatan',
                    time: 'Senin',
                  ),

                  CustomFieldSpacer(),

                  CustomNotifikasiTile(
                    text: 'Sio Jurnalis Pipin telah memberikan validasi mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                    time: '11.00 AM',
                  ),

                  CustomFieldSpacer(),

                  CustomNotifikasiTile(
                    text: 'Tashia Taslim telah memberikan persetujuan mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                    time: '03.00 PM',
                  ),

                  CustomFieldSpacer(),

                  CustomNotifikasiTile(
                    text: 'Tommy Christian Siregar telah melakukan pengajuan Usulan Kegiatan',
                    time: 'Senin',
                  ),

                  CustomFieldSpacer(),

                  CustomNotifikasiTile(
                    text: 'Sio Jurnalis Pipin telah memberikan validasi mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                    time: '11.00 AM',
                  ),

                  CustomFieldSpacer(),

                  CustomNotifikasiTile(
                    text: 'Tashia Taslim telah memberikan persetujuan mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                    time: '03.00 PM',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildDetailBeritaTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}