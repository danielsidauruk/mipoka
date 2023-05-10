import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaOrmawaUKMPage extends StatefulWidget {
  const MobilePenggunaOrmawaUKMPage({super.key});

  @override
  State<MobilePenggunaOrmawaUKMPage> createState() => _MobilePenggunaOrmawaUKMPageState();
}

class _MobilePenggunaOrmawaUKMPageState extends State<MobilePenggunaOrmawaUKMPage> {

  String namaOrmawaValue = listNamaOrmawa[0];
  final Map<String, String> biodata = {
    'Nama': 'Daniel Sidauruk',
    'Tanggal Lahir': '11 Juli 2022',
    // Tambahkan entri biodata lainnya sesuai kebutuhan
  };

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

              const CustomMobileTitle(text: 'Ormawa - UKM'),

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

                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey,
                    ),
                  ),

                  const CustomFieldSpacer(),

                  customBoxTitle('Mikroskil Esport'),
                  Text('Berdiri         : 16 Juli 2021'),
                  Text('Pendiri         : Tommy Christian Hasibuan'),
                  Text(
                    'Jumlah Anggota  : 206',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const CustomFieldSpacer(),

                  customBoxTitle('Pembina'),
                  const CustomFieldSpacer(spacerHeight: 4.0),

                  buildTitle(
                    'Dosen',
                    titlePadding: 0.0,
                  ),
                  Text('Sio Jurnalis Pipin, S.Kom., M.Kom.'),

                  const CustomFieldSpacer(),

                  customBoxTitle('Pengurus Inti'),
                  const CustomFieldSpacer(spacerHeight: 4.0),

                  buildTitle(
                    'Ketua UKM',
                    titlePadding: 0.0,
                  ),
                  Text('Stefani Gisella'),

                  const CustomFieldSpacer(spacerHeight: 4.0),

                  buildTitle(
                    'Wakil Ketua UKM',
                    titlePadding: 0.0,
                  ),
                  Text('Jhonsen Antoni Jingga'),

                  const CustomFieldSpacer(spacerHeight: 4.0),

                  buildTitle(
                    'Sekretaris UKM',
                    titlePadding: 0.0,
                  ),
                  Text('Adventus Totti Mariano Simbolon'),

                  const CustomFieldSpacer(spacerHeight: 4.0),

                  buildTitle(
                    'Bendahara UKM',
                    titlePadding: 0.0,
                  ),
                  Text('Muhammad Azraqi Syahriza'),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBeritaTile() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white)
      ),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey,
            ),
          ),

          const SizedBox(width: 4.0),

          const Expanded(
            flex: 3,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
                  'adipiscing elit, sed do eiusmod tempor incididunt '
                  'ut labore et dolore ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}