import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_check_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaPengajuanSaranaDanPrasarana extends StatefulWidget {
  const PenggunaPengajuanSaranaDanPrasarana({
    super.key
  });

  @override
  State<PenggunaPengajuanSaranaDanPrasarana> createState() =>
      _PenggunaPengajuanSaranaDanPrasaranaState();
}

class _PenggunaPengajuanSaranaDanPrasaranaState
    extends State<PenggunaPengajuanSaranaDanPrasarana> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // context.read<SessionBloc>().add(ReadSessionEvent(idSession: widget.idSession));
    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    context.read<MipokaUserBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _gedungController = TextEditingController();
  final TextEditingController _ruangController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  final TextEditingController _proyektorLcdController = TextEditingController();
  final TextEditingController _laptopController = TextEditingController();
  final TextEditingController _mikrofonController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _mejaController = TextEditingController();
  final TextEditingController _kursiController = TextEditingController();
  final TextEditingController _papanTulisController = TextEditingController();
  final TextEditingController _spidolController = TextEditingController();
  final TextEditingController _lainController = TextEditingController();

  final StreamController<String?> _gedungStream = StreamController<String?>.broadcast();

  List<Ormawa> _ormawaList = [];
  Ormawa? _ormawa;
  // ormawa ??= _ormawaList.first;

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print("page reloaded");
    }

    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
          context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Pengajuan - Sarana dan Prasarana'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocBuilder<MipokaUserBloc, MipokaUserState>(
                    builder: (context, state) {
                      if (state is MipokaUserHasData) {
                        final mipokaUser = state.mipokaUser;

                        if (mipokaUser.ormawa.isNotEmpty) {
                          _ormawaList = mipokaUser.ormawa;
                          List<String> namaOrmawaList = _ormawaList.map((ormawa) => ormawa.namaOrmawa).toList();

                          _ruangController.text = ruanganListA.first;
                          _gedungController.text = gedungList.first;

                          _ormawa ??= _ormawaList.first;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTitle('Nama Ormawa'),

                              MipokaCustomDropdown(
                                items: namaOrmawaList,
                                onValueChanged: (value) {
                                  int index = namaOrmawaList.indexOf(value!);
                                  _ormawa = _ormawaList[index];
                                },
                              ),

                              const CustomFieldSpacer(),
                              buildTitle('Tanggal Mulai Kegiatan'),
                              CustomDatePickerField(controller: _tanggalMulaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Tanggal Selesai Kegiatan'),
                              CustomDatePickerField(controller: _tanggalSelesaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Gedung'),

                              MipokaCustomDropdown(
                                items: gedungList,
                                // items: const ["A"],
                                onValueChanged: (value) {
                                  _gedungController.text = value ?? "";
                                  _gedungStream.add(value);
                                },
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Ruang'),

                              StreamBuilder<String?>(
                                initialData: gedungList.first,
                                stream: _gedungStream.stream,
                                builder: (context, snapshot) {
                                  final gedung = snapshot.data;

                                  // return MipokaCustomDropdown(
                                  //   items: ruanganListA,
                                  //   onValueChanged: (value) {
                                  //     _ruangController.text = value ?? "";
                                  //   },
                                  // );

                                  print(gedung);

                                  return
                                  gedung == "A" ?
                                  MipokaCustomDropdown(
                                    initialItem: ruanganListA[0],
                                    items: ruanganListA,
                                    onValueChanged: (value) {
                                      _ruangController.text = value ?? "";
                                    },
                                  ) :
                                  gedung == "B" ?
                                  MipokaCustomDropdown2(
                                    initialItem: ruanganListB[0],
                                    items: ruanganListB,
                                    onValueChanged: (value) {
                                      _ruangController.text = value ?? "";
                                    },
                                  ) :
                                  MipokaCustomDropdown3(
                                    initialItem: ruanganListC[0],
                                    items: ruanganListC,
                                    onValueChanged: (value) {
                                      _ruangController.text = value ?? "";
                                    },
                                  );

                                  // if (gedung == gedungList[0]) {
                                  //   return MipokaCustomDropdown(
                                  //     items: ruanganListA,
                                  //     onValueChanged: (value) {
                                  //       // _ruangController.text = value ?? "";
                                  //     },
                                  //   );
                                  // } else if (gedung == gedungList[1]) {
                                  //   return MipokaCustomDropdown(
                                  //     items: ruanganListB,
                                  //     onValueChanged: (value) {
                                  //       // _ruangController.text = value ?? "";
                                  //     },
                                  //   );
                                  // } else {
                                  //   return MipokaCustomDropdown(
                                  //     items: ruanganListC,
                                  //     onValueChanged: (value) {
                                  //       // _ruangController.text = value ?? "";
                                  //     },
                                  //   );
                                  // }
                                },
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Waktu Mulai Kegiatan'),
                              CustomTimePickerField(controller: _waktuMulaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Waktu Selesai Kegiatan'),
                              CustomTimePickerField(controller: _waktuSelesaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Kegiatan'),
                              CustomTextField(controller: _kegiatanController),

                              const CustomFieldSpacer(),

                              buildTitle('Perlengkapan yang dibutuhkan'),

                              const SizedBox(height: 4.0),

                              CustomCheckBox(
                                title: 'Proyektor/LCD',
                                controller: _proyektorLcdController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Laptop',
                                controller: _laptopController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Mikrofon',
                                controller: _mikrofonController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Speaker',
                                controller: _speakerController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Meja',
                                controller: _mejaController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Kursi',
                                controller: _kursiController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Papan Tulis',
                                controller: _papanTulisController,
                              ),
                              const SizedBox(height: 4.0),
                              CustomCheckBox(
                                title: 'Spidol',
                                controller: _spidolController,
                              ),
                              const CustomFieldSpacer(),
                              buildTitle('Lain - lain'),

                              CustomTextField(controller: _lainController),

                              const CustomFieldSpacer(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomMipokaButton(
                                    onTap: () => Navigator.pop(context),
                                    text: 'Batal',
                                  ),

                                  const SizedBox(width: 8.0),

                                  CustomMipokaButton(
                                    onTap: () async {
                                      final proyektorLcd = int.tryParse(_proyektorLcdController.text);
                                      final laptop = int.tryParse(_laptopController.text);
                                      final mikrofon = int.tryParse(_mikrofonController.text);
                                      final speaker = int.tryParse(_speakerController.text);
                                      final meja = int.tryParse(_mejaController.text);
                                      final kursi = int.tryParse(_kursiController.text);
                                      final papanTulis = int.tryParse(_papanTulisController.text);
                                      final spidol = int.tryParse(_spidolController.text);

                                      if (_ormawa == null) {
                                        mipokaCustomToast(emptyFieldPrompt("Ormawa"));
                                      } else if (_tanggalMulaiController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Tanggal Mulai"));
                                      } else if (_tanggalSelesaiController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Tanggal Selesai"));
                                      } else if (_gedungController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Gedung"));
                                      } else if (_ruangController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Ruangan"));
                                      } else if (_waktuMulaiController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Waktu Mulai"));
                                      } else if (_waktuSelesaiController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Waktu Selesai"));
                                      } else if (_kegiatanController.text.isEmpty) {
                                        mipokaCustomToast(emptyFieldPrompt("Kegiatan"));
                                      } else if (_proyektorLcdController.text.isNotEmpty && proyektorLcd == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Proyektor"));
                                      } else if (_laptopController.text.isNotEmpty && laptop == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Laptop"));
                                      } else if (_mikrofonController.text.isNotEmpty && mikrofon == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Mikrofon"));
                                      } else if (_speakerController.text.isNotEmpty && speaker == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Speaker"));
                                      } else if (_mejaController.text.isNotEmpty && meja == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Meja"));
                                      } else if (_kursiController.text.isNotEmpty && kursi == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Kursi"));
                                      } else if (_papanTulisController.text.isNotEmpty && papanTulis == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Papan Tulis"));
                                      } else if (_spidolController.text.isNotEmpty && spidol == null) {
                                        mipokaCustomToast(dataTypeFalsePrompt("Spidol"));
                                      }
                                      else {
                                        mipokaCustomToast("Pengajuan Peminjaman Sarana & Prasarana Telah Dikirim.");

                                        String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();

                                        if(_lainController.text == "") {
                                          _lainController.text = "-";
                                        }

                                        if(context.mounted) {
                                          context.read<NotifikasiBloc>().add(
                                            CreateNotifikasiEvent(
                                              notifikasi: Notifikasi(
                                                idNotifikasi: uniqueId,
                                                teksNotifikasi: "${mipokaUser.namaLengkap} telah melakukan pengajuan Sarana & Prasarana Kegiatan",
                                                tglNotifikasi: DateTime.now().toString(),
                                                createdAt: currentDate,
                                                createdBy: user?.email ?? "unknown",
                                                updatedAt: currentDate,
                                                updatedBy: user?.email ?? "unknown",
                                              ),
                                            ),
                                          );
                                        }

                                        await Future.delayed(const Duration(seconds: 1));

                                        if (context.mounted) {
                                          Navigator.pop(
                                            context,
                                            Session(
                                              idSession: uniqueId,
                                              ormawa: _ormawa,
                                              mipokaUser: mipokaUser,
                                              tanggalMulai: _tanggalMulaiController.text,
                                              tanggalSelesai: _tanggalSelesaiController.text,
                                              gedung: _gedungController.text,
                                              ruang: _ruangController.text,
                                              waktuMulaiPenggunaan: _waktuMulaiController.text,
                                              waktuSelesaiPenggunaan: _waktuSelesaiController.text,
                                              kegiatan: _kegiatanController.text,
                                              proyektor: proyektorLcd ?? 0,
                                              laptop: laptop ?? 0,
                                              mikrofon: mikrofon ?? 0,
                                              speaker: speaker ?? 0,
                                              meja: meja ?? 0,
                                              kursi: kursi ?? 0,
                                              papanTulis: papanTulis ?? 0,
                                              spidol: spidol ?? 0,
                                              status: tertunda,
                                              tandaTanganSA: "",
                                              fileSession: "",
                                              lainLain: _lainController.text,
                                              createdAt: currentDate,
                                              createdBy: user?.email ?? "unknown",
                                              updatedAt: currentDate,
                                              updatedBy: user?.email ?? "unknown",
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    text: 'Kirim',
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return const Text("User tidak terdaftar di ORMAWA manapun.");
                        }
                      } else {
                        return const SizedBox();
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
}

