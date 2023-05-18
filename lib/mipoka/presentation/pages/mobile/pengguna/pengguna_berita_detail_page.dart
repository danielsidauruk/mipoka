import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaBerandaDetailPage extends StatefulWidget {
  const MobilePenggunaBerandaDetailPage({super.key});

  @override
  State<MobilePenggunaBerandaDetailPage> createState() => _MobilePenggunaBerandaDetailPageState();
}

class _MobilePenggunaBerandaDetailPageState extends State<MobilePenggunaBerandaDetailPage> {

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

              const CustomMobileTitle(text: 'Berita Kemahasiswaan - Detail'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildDetailBeritaTitle('MENJADI ACARA PERDANA! SEMINAR PASAR MODAL UKM'
                      'MIKROSKIL INVESTMENT CLUB SUKSES TERSELENGGARAKAN'
                      'BERSAMA PENGUKUHAN KSPM',
                  ),

                  const CustomFieldSpacer(height: 4),

                  const Text(
                    'Diterbitkan: 14 April 2023 | Oleh: Andrew Husada',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const CustomFieldSpacer(),

                  Container(
                    height: 200,
                    color: Colors.grey,
                  ),

                  const CustomFieldSpacer(),

                  const Text('          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua. At quis risus sed vulputate odio ut enim. Orci dapibus ultrices in iaculis. Quis ipsum suspendisse'
                    'ultrices gravida dictum fusce ut. Duis ut diam quam nulla. Porttitor lacus luctus accumsan tortor posuere ac.'
                    '\n          Sagittis id consectetur purus ut faucibus pulvinar elementum integer enim. Etiam sit amet nisl purus in mollis nunc'
                    'sed id. Nisl vel pretium lectus quam id. Mattis pellentesque id nibh tortor. Montes nascetur ridiculus mus mauris'
                    'vitae ultricies leo. Quis risus sed vulputate odio.\n           Lobortis elementum nibh tellus molestie nunc non blandit massa'
                    'enim. Mattis pellentesque id nibh tortor id aliquet. Elementum integer enim neque volutpat ac.'
                      '\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore'
                      'magna aliqua. At quis risus sed vulputate odio ut enim. Orci dapibus ultrices in iaculis. Quis ipsum suspendisse'
                      'ultrices gravida dictum fusce ut. Duis ut diam quam nulla. Porttitor lacus luctus accumsan tortor posuere ac.'
                      '\n          Sagittis id consectetur purus ut faucibus pulvinar elementum integer enim. Etiam sit amet nisl purus in mollis nunc'
                      'sed id. Nisl vel pretium lectus quam id. Mattis pellentesque id nibh tortor. Montes nascetur ridiculus mus mauris'
                      'vitae ultricies leo. Quis risus sed vulputate odio.\n           Lobortis elementum nibh tellus molestie nunc non blandit massa'
                      'enim. Mattis pellentesque id nibh tortor id aliquet. Elementum integer enim neque volutpat ac.'
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