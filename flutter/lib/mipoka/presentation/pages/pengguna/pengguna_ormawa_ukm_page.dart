import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_drop_down_bloc/ormawa_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

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
  Ormawa? ormawa;

  final StreamController<Ormawa?> _ormawaStream = StreamController<Ormawa?>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<OrmawaDropDownBloc>().add(ReadOrmawaDropDownEvent());
        },
      ),

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

                  BlocBuilder<OrmawaDropDownBloc, OrmawaDropDownState>(
                    builder: (context, state) {
                      if (state is OrmawaDropDownLoading) {
                        return const Text("Loading ....");
                      } else if (state is OrmawaDropDownHasData) {

                        if(state.ormawaList.isEmpty) {
                          return const Center(
                            child: Text("Ormawa tidak ada"),
                          );
                        } else {
                          List<String> namaOrmawaList = state.ormawaList.map(
                                  (ormawa) => ormawa.namaOrmawa).toList();

                          return MipokaCustomDropdown(
                              items: namaOrmawaList,
                              onValueChanged: (value) {
                                int index = namaOrmawaList.indexOf(value!);
                                _ormawaStream.add(state.ormawaList[index]);
                              }
                          );
                        }
                      } else if (state is OrmawaDropDownError) {
                        return Text(state.message);
                      } else {
                        return const Text("OrmawaBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  StreamBuilder<Ormawa?>(
                    stream: _ormawaStream.stream,
                    builder: (context, snapshot) {
                      Ormawa? selectedOrmawa = snapshot.data;

                      print(selectedOrmawa?.namaOrmawa);

                      print(ormawa?.ketua);

                      return selectedOrmawa != null ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomFieldSpacer(),

                          Center(
                            child: Image.network(
                              selectedOrmawa.logoOrmawa ?? "",
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const CustomFieldSpacer(),

                          Center(
                            child: Text(
                              "${selectedOrmawa.namaOrmawa} (${selectedOrmawa.namaSingkatanOrmawa})",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          const CustomFieldSpacer(),

                          customBoxTitle('Pembina'),

                          const CustomFieldSpacer(height: 8.0),

                          buildTitle(
                            'Dosen',
                          ),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Image.network(
                                  selectedOrmawa.fotoPembina,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),

                                const CustomFieldSpacer(height: 4.0),

                                Text(selectedOrmawa.pembina ?? ""),
                              ],
                            ),
                          ),

                          const CustomFieldSpacer(),

                          customBoxTitle('Pengurus Inti'),

                          const CustomFieldSpacer(height: 8.0),

                          buildTitle('Ketua UKM',),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  selectedOrmawa.fotoKetua,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),

                                const CustomFieldSpacer(height: 4.0),

                                Text(selectedOrmawa.ketua),
                              ],
                            ),
                          ),

                          const CustomFieldSpacer(height: 4.0),

                          buildTitle(
                            'Wakil Ketua UKM',
                            titlePadding: 0.0,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  selectedOrmawa.fotoWakil,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),

                                const CustomFieldSpacer(height: 4.0),

                                Text(selectedOrmawa.wakil ?? ""),
                              ],
                            ),
                          ),

                          const CustomFieldSpacer(height: 4.0),

                          buildTitle(
                            'Sekretaris UKM',
                            titlePadding: 0.0,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  selectedOrmawa.fotoSekretaris,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),

                                const CustomFieldSpacer(height: 4.0),

                                Text(selectedOrmawa.sekretaris ?? ""),
                              ],
                            ),
                          ),

                          const CustomFieldSpacer(height: 4.0),

                          buildTitle(
                            'Bendahara UKM',
                            titlePadding: 0.0,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  selectedOrmawa.fotoBendahara,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),

                                const CustomFieldSpacer(height: 4.0,),

                                Text(selectedOrmawa.bendahara ?? ""),
                              ],
                            ),
                          ),

                        ],
                      ) :
                      const Center();
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
}