import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

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
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _prestasiYangDicapaiController = TextEditingController();
  final TextEditingController _waktuPenyelenggaraanController = TextEditingController();

  Ormawa? _ormawa;
  String? _yearController;
  String? _tingkatController;
  MipokaUser? _mipokaUser;

  void _triggerNim(String value) {
    context.read<MipokaUserByNimBloc>().add(
      ReadMipokaUserByNimEvent(nim: value),
    );
  }

  @override
  void initState() {
    _ormawa = widget.prestasi.ormawa;
    _yearController = widget.prestasi.waktuPenyelenggaraan;
    _tingkatController = widget.prestasi.tingkat;
    _mipokaUser = widget.prestasi.mipokaUser;
    _namaKegiatanController.text = widget.prestasi.namaKegiatan;
    _prestasiYangDicapaiController.text = widget.prestasi.prestasiDicapai;
    _waktuPenyelenggaraanController.text = widget.prestasi.waktuPenyelenggaraan;
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
                    // Future.microtask(() {
                    //   context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
                    //   _triggerNim(state.mipokaUser.nim);
                    // });

                    return CustomContentBox(
                      children: [
                        buildTitle('Nama Ormawa'),

                        BlocBuilder<OrmawaBloc, OrmawaState>(
                          builder: (context, state) {
                            if (state is OrmawaLoading) {
                              return const Text("Loading ....");
                            } else if (state is AllOrmawaHasData) {
                              final ormawaList = state.ormawaList;

                              List<String> ormawaDropDownList = ormawaList.map(
                                      (ormawa) => ormawa.namaOrmawa).toList();

                              int selectedIndex = ormawaList.indexOf(_ormawa!);
                              String initialItem = selectedIndex > 0
                                  ? ormawaDropDownList[selectedIndex]
                                  : ormawaDropDownList[0];

                              return MipokaCustomDropdown(
                                  items: ormawaDropDownList,
                                  initialItem: initialItem,
                                  onValueChanged: (value) {
                                    int index = ormawaDropDownList.indexOf(value!);
                                    initialItem = ormawaDropDownList[index];
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
                            if (state is MipokaUserByNimByNimHasData) {
                              _mipokaUser = state.mipokaUser;

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _mipokaUser?.namaLengkap ?? "",
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
                          onValueChanged: (value) => _tingkatController = value,
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
                              onTap: () => (_ormawa != null && _nimController.text.isNotEmpty
                                  && _namaKegiatanController.text.isNotEmpty && _yearController != null
                                  && _tingkatController != null && _prestasiYangDicapaiController.text.isNotEmpty
                                  && _mipokaUser?.idUser != "") ?
                              Future.microtask(() {
                                context.read<PrestasiBloc>().add(
                                  UpdatePrestasiEvent(
                                    prestasi: widget.prestasi.copyWith(
                                      ormawa: _ormawa,
                                      mipokaUser: _mipokaUser,
                                      namaKegiatan: _namaKegiatanController.text,
                                      tingkat: _tingkatController,
                                      waktuPenyelenggaraan: _yearController,
                                      prestasiDicapai: _prestasiYangDicapaiController.text,
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ),
                                );
                                mipokaCustomToast("Prestasi telah diupdate.");
                                context.read<PrestasiBloc>().add(const ReadAllPrestasiEvent());
                                Navigator.pop(context);
                              }) :
                              mipokaCustomToast(emptyFieldMessage),
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
