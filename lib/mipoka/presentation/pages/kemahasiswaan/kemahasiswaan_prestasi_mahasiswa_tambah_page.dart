import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanPrestasiMahasiswaTambahPage extends StatefulWidget {
  const KemahasiswaanPrestasiMahasiswaTambahPage({super.key});

  @override
  State<KemahasiswaanPrestasiMahasiswaTambahPage> createState() => _KemahasiswaanPrestasiMahasiswaTambahPageState();
}

class _KemahasiswaanPrestasiMahasiswaTambahPageState extends State<KemahasiswaanPrestasiMahasiswaTambahPage> {
  String namaOrmawaValue = listNamaOrmawa[0];
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _prestasiYangDicapaiController = TextEditingController();
  String? _tingkat;
  Ormawa? _ormawa;
  MipokaUser? _mipokaUser;
  String? _tahun;

  User? user = FirebaseAuth.instance.currentUser;

  void _triggerNim(String value) {
    context.read<MipokaUserByNimBloc>().add(
      ReadMipokaUserByNimEvent(nim: value),
    );
  }

  @override
  void initState() {
    _tingkat = listTingkat[0];
    _tahun = years[0];

    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    super.initState();
  }


  @override
  void dispose() {
    context.read<OrmawaBloc>().close();
    context.read<MipokaUserByNimBloc>().close();
    super.dispose();
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
                        final ormawaList = state.ormawaList;

                        List<String> ormawaDropDownList = [];
                        state.ormawaList != []
                            ? ormawaDropDownList = state.ormawaList.map(
                                (ormawa) => ormawa.namaOrmawa).toList()
                            : ormawaDropDownList.add("");


                        _ormawa = ormawaList[0];

                        return MipokaCustomDropdown(
                            items: ormawaDropDownList,
                            onValueChanged: (value) {
                              int index = ormawaDropDownList.indexOf(value!);
                              _ormawa = ormawaList[index];
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
                      if(_nimController.text.isNotEmpty
                          && state is MipokaUserByNimByNimHasData) {
                        _mipokaUser = state.mipokaUser;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.mipokaUser.namaLengkap,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );

                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 16),
                          ),
                        );
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
                    onValueChanged: (value) => _tingkat = value,
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
                        text: 'Simpan',
                        onTap: () {
                          if (_ormawa != null && _nimController.text.isNotEmpty
                              && _namaKegiatanController.text.isNotEmpty && _tahun != null
                              && _tingkat != null && _mipokaUser != null
                              && _prestasiYangDicapaiController.text.isNotEmpty)
                          {
                            mipokaCustomToast(savingDataMessage);

                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            Navigator.pop(
                              context,
                              Prestasi(
                                idPrestasi: uniqueId,
                                ormawa: _ormawa!,
                                mipokaUser: _mipokaUser!,
                                namaKegiatan: _namaKegiatanController.text,
                                waktuPenyelenggaraan: _tahun ?? "",
                                tingkat: _tingkat ?? "",
                                prestasiDicapai: _prestasiYangDicapaiController.text,
                                unggahSertifikat: "",
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            );
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
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
