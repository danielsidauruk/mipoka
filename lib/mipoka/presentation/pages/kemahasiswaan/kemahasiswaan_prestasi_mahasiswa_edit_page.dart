import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanPrestasiMahasiswaEditPage extends StatefulWidget {
  const KemahasiswaanPrestasiMahasiswaEditPage({
    super.key,
    required this.prestasi
  });

  final Prestasi prestasi;

  @override
  State<KemahasiswaanPrestasiMahasiswaEditPage> createState() => _KemahasiswaanPrestasiMahasiswaEditPageState();
}

class _KemahasiswaanPrestasiMahasiswaEditPageState extends State<KemahasiswaanPrestasiMahasiswaEditPage> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaMahasiswaController = TextEditingController();
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _prestasiYangDicapaiController = TextEditingController();
  final TextEditingController _waktuPenyelenggaraanController = TextEditingController();

  int? _idOrmawaController;
  String? _yearController;
  String? _tingkatController;

  void _triggerNim(String value) {
    context.read<MipokaUserByNimBloc>().add(
      ReadMipokaUserByNimEvent(nim: value),
    );
  }

  @override
  void initState() {
    // _nimController.text = widget.prestasi.nim;
    _idOrmawaController = widget.prestasi.idOrmawa;
    _tingkatController = widget.prestasi.tingkat;
    _namaKegiatanController.text = widget.prestasi.namaKegiatan;
    _prestasiYangDicapaiController.text = widget.prestasi.prestasiDicapai;
    _waktuPenyelenggaraanController.text = widget.prestasi.waktuPenyelenggaraan;

    context.read<MipokaUserBloc>().add(
      ReadMipokaUserEvent(idMipokaUser: widget.prestasi.idUser));
    super.initState();
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

              BlocBuilder<MipokaUserBloc, MipokaUserState>(
                builder: (context, state) {
                  if (state is MipokaUserLoading) {
                    return const Text("Loading ....");
                  } else if (state is MipokaUserHasData) {

                    _nimController.text = state.mipokaUser.nim;
                    Future.microtask(() {
                      context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
                      _triggerNim(state.mipokaUser.nim);
                    });

                    return CustomContentBox(
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

                              int selectedIndex = idOrmawaList.indexOf(_idOrmawaController!);

                              return MipokaCustomDropdown(
                                  items: ormawaList,
                                  initialItem: ormawaList[selectedIndex],
                                  onValueChanged: (value) {
                                    int index = ormawaList.indexOf(value!);
                                    int idOrmawa = idOrmawaList[index];

                                    _idOrmawaController = idOrmawa;
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
                              return const Text("MipokaUserBlocByNimEvent hasn't been triggered yet");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Nama Kegiatan'),
                        CustomTextField(controller: _namaKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Penyelenggaraan'),

                        CustomDatePickerField(controller: _waktuPenyelenggaraanController),

                        const CustomFieldSpacer(),

                        buildTitle('Tingkat'),
                        MipokaCustomDropdown(
                          items: listTingkat,
                          initialItem: _tingkatController,
                          onValueChanged: (value) {
                            _tingkatController = value;
                          },
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
                              onTap: () {
                                context.read<PrestasiBloc>().add(
                                  UpdatePrestasiEvent(
                                    prestasi: widget.prestasi.copyWith(
                                      idOrmawa: _idOrmawaController,
                                      tingkat: _tingkatController,
                                      waktuPenyelenggaraan: _yearController,
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ),
                                );
                                context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());

                                Navigator.pop(context);
                              },
                              text: 'Simpan',
                            ),
                          ],
                        ),
                      ],
                    );

                  } else if (state is MipokaUserError) {
                    return Text(state.message);
                  } else {
                    return const Text("MipokaUserBlocEvent hasn't been triggered");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
