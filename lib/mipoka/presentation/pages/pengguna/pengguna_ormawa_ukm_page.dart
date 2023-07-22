import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_drop_down_bloc/ormawa_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
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
    context.read<OrmawaDropDownBloc>().add(ReadOrmawaDropDownEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<OrmawaDropDownBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  int? _idOrmawaController;

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

              const CustomMobileTitle(text: 'Ormawa - UKM'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Nama Ormawa'),

                  // MipokaCustomDropdown(
                  //   items: listNamaOrmawa,
                  //   onValueChanged: (value) {
                  //     context.read<OrmawaBloc>().add(
                  //       const ReadOrmawaEvent(idOrmawa: 1111),
                  //     );
                  //   },
                  // ),
                  BlocBuilder<OrmawaDropDownBloc, OrmawaDropDownState>(
                    builder: (context, state) {
                      if (state is OrmawaDropDownLoading) {
                        return const Text("Loading ....");
                      } else if (state is OrmawaDropDownHasData) {

                        List<String> ormawaList = state.ormawaList.map(
                                (ormawa) => ormawa.namaOrmawa).toList();

                        List<int> idOrmawaList = state.ormawaList.map(
                                (ormawa) => ormawa.idOrmawa).toList();

                        if (_idOrmawaController == null) {
                          context.read<OrmawaBloc>().add(ReadOrmawaEvent(idOrmawa: _idOrmawaController ?? idOrmawaList[0]));
                          _idOrmawaController ??= idOrmawaList[0];
                        }

                        return MipokaCustomDropdown(
                            items: ormawaList,
                            onValueChanged: (value) {
                              int index = ormawaList.indexOf(value!);
                              int idOrmawa = idOrmawaList[index];

                              _idOrmawaController = idOrmawa;

                              context.read<OrmawaBloc>().add(ReadOrmawaEvent(idOrmawa: _idOrmawaController ?? idOrmawaList[0]));
                            }
                        );
                      } else if (state is OrmawaDropDownError) {
                        return Text(state.message);
                      } else {
                        return const Text("OrmawaBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  BlocBuilder<OrmawaBloc, OrmawaState>(
                    builder: (context, state) {
                      if (state is OrmawaLoading) {
                        return const Text('Loading');
                      } else if (state is OrmawaHasData) {
                        final ormawa = state.ormawa;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomFieldSpacer(),

                            Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                color: Colors.grey,
                              ),
                            ),

                            const CustomFieldSpacer(),

                            customBoxTitle("${ormawa.namaOrmawa} (${ormawa.namaSingkatanOrmawa})"),
                            Text('Berdiri         : "ormawa.tanggalBerdiri"'),
                            Text('Pendiri         : ${ormawa.ketua}'),
                            Text('Jumlah Anggota  : ${ormawa.listAnggota.length}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),

                            const CustomFieldSpacer(),

                            customBoxTitle('Pembina'),
                            const CustomFieldSpacer(height: 4.0),

                            buildTitle(
                              'Dosen',
                              titlePadding: 0.0,
                            ),
                            Text(ormawa.pembina),

                            const CustomFieldSpacer(),

                            customBoxTitle('Pengurus Inti'),
                            const CustomFieldSpacer(height: 4.0),

                            buildTitle(
                              'Ketua UKM',
                              titlePadding: 0.0,
                            ),
                            Text(ormawa.ketua),

                            const CustomFieldSpacer(height: 4.0),

                            buildTitle(
                              'Wakil Ketua UKM',
                              titlePadding: 0.0,
                            ),
                            Text(ormawa.wakil),

                            const CustomFieldSpacer(height: 4.0),

                            buildTitle(
                              'Sekretaris UKM',
                              titlePadding: 0.0,
                            ),
                            Text(ormawa.sekretaris),

                            const CustomFieldSpacer(height: 4.0),

                            buildTitle(
                              'Bendahara UKM',
                              titlePadding: 0.0,
                            ),
                            Text(ormawa.bendahara),
                          ],
                        );
                      } else if (state is OrmawaError) {
                        return Text(state.message);
                      } else {
                        return const Text('IDK');
                      }
                    },
                  ),
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