import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaOrmawaUKMPage extends StatefulWidget {
  const PenggunaOrmawaUKMPage({super.key});

  @override
  State<PenggunaOrmawaUKMPage> createState() => _PenggunaOrmawaUKMPageState();
}

class _PenggunaOrmawaUKMPageState extends State<PenggunaOrmawaUKMPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrmawaBloc>(context, listen: false)
        .add(ReadOrmawaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: BlocBuilder<OrmawaBloc, OrmawaState>(
          builder: (context, state) {
            if (state is OrmawaLoading) {
              return const Text('Loading');
            } else if (state is OrmawaHasData) {
              return Padding(
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
                          onValueChanged: (value) {
                            print(value);
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
                        const CustomFieldSpacer(height: 4.0),

                        buildTitle(
                          'Dosen',
                          titlePadding: 0.0,
                        ),
                        Text('Sio Jurnalis Pipin, S.Kom., M.Kom.'),

                        const CustomFieldSpacer(),

                        customBoxTitle('Pengurus Inti'),
                        const CustomFieldSpacer(height: 4.0),

                        buildTitle(
                          'Ketua UKM',
                          titlePadding: 0.0,
                        ),
                        Text('Stefani Gisella'),

                        const CustomFieldSpacer(height: 4.0),

                        buildTitle(
                          'Wakil Ketua UKM',
                          titlePadding: 0.0,
                        ),
                        Text('Jhonsen Antoni Jingga'),

                        const CustomFieldSpacer(height: 4.0),

                        buildTitle(
                          'Sekretaris UKM',
                          titlePadding: 0.0,
                        ),
                        Text('Adventus Totti Mariano Simbolon'),

                        const CustomFieldSpacer(height: 4.0),

                        buildTitle(
                          'Bendahara UKM',
                          titlePadding: 0.0,
                        ),
                        Text('Muhammad Azraqi Syahriza'),

                      ],
                    ),
                  ],
                ),
              );
            } else if (state is OrmawaError) {
              return Text(state.message);
            } else {
              return const Text('IDK');
            }
          },
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