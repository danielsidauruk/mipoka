import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanPrestasiMahasiswaTambahPage extends StatefulWidget {
  const KemahasiswaanPrestasiMahasiswaTambahPage({super.key});

  @override
  State<KemahasiswaanPrestasiMahasiswaTambahPage> createState() => _KemahasiswaanPrestasiMahasiswaTambahPageState();
}

class _KemahasiswaanPrestasiMahasiswaTambahPageState extends State<KemahasiswaanPrestasiMahasiswaTambahPage> {
  String namaOrmawaValue = listNamaOrmawa[0];
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaMahasiswaController = TextEditingController();
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _prestasiYangDicapaiController = TextEditingController();
  String? _tingkatValue;
  int? _idOrmawa;
  String? _tahun;

  @override
  void initState() {
    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<OrmawaBloc>().close();
    context.read<MipokaUserByNimBloc>().close();
    super.dispose();
  }

  void _triggerNim(String value) {
    context.read<MipokaUserByNimBloc>().add(
      ReadMipokaUserByNimEvent(nim: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - Tambah Prestasi Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Nama Ormawa'),
                  BlocBuilder<OrmawaBloc, OrmawaState>(
                    builder: (context, state) {
                      if (state is OrmawaLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllOrmawaHasData) {

                        List<String> ormawaList = state.ormawaList.map(
                                (ormawa) => ormawa.namaOrmawa).toList();

                        List<int> idOrmawaList = state.ormawaList.map(
                                (ormawa) => ormawa.idOrmawa).toList();

                        return MipokaCustomDropdown(
                            items: ormawaList,
                            onValueChanged: (value) {
                              int index = ormawaList.indexOf(value!);
                              int idOrmawa = idOrmawaList[index];

                              // print("$idPeriodeMpt, $value");
                              _idOrmawa = idOrmawa;
                            }
                        );
                      } else if (state is OrmawaError) {
                        return Text(state.message);
                      } else {
                        return const Text("OrmawaBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextFieldForNim(
                    textInputType: TextInputType.number,
                    controller: _nimController,
                    onSubmitted: (value) => _triggerNim(value),
                  ),


                  const CustomFieldSpacer(),

                  buildTitle('Nama Mahasiswa'),
                  BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                    builder: (context, state) {
                      if (state is MipokaUserByNimByNimHasData) {

                        // return buildTitle(state.mipokaUser.namaLengkap);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.mipokaUser.namaLengkap,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      } else {
                        return const Text("-");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),
                  CustomTextField(controller: _namaKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu Penyelenggaraan'),
                  MipokaCustomDropdown(
                    items: years,
                    onValueChanged: (value) => _tahun = value,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tingkat'),
                  MipokaCustomDropdown(
                    items: listTingkat,
                    onValueChanged: (value) => _tingkatValue = value,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Prestasi yang dicapai'),
                  CustomTextField(controller: _prestasiYangDicapaiController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Simpan',
                      ),
                    ],
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
