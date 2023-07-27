import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
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
    required this.idSession,
    super.key
  });

  final int idSession;
  @override
  State<PenggunaPengajuanSaranaDanPrasarana> createState() =>
      _PenggunaPengajuanSaranaDanPrasaranaState();
}

class _PenggunaPengajuanSaranaDanPrasaranaState
    extends State<PenggunaPengajuanSaranaDanPrasarana> {

  @override
  void initState() {
    context.read<SessionBloc>().add(ReadSessionEvent(idSession: widget.idSession));
    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<SessionBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _gedungController = TextEditingController();
  final TextEditingController _ruangController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();

  final TextEditingController _proyektorLcdController = TextEditingController();
  final TextEditingController _laptopController = TextEditingController();
  final TextEditingController _mikrofonController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _mejaController = TextEditingController();
  final TextEditingController _kursiController = TextEditingController();
  final TextEditingController _papanTulisController = TextEditingController();
  final TextEditingController _spidolController = TextEditingController();
  final TextEditingController _lainController = TextEditingController();

  Ormawa? _ormawa;

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print("page reloaded");
    }

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Sarana dan Prasarana'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  BlocConsumer<SessionBloc, SessionState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SentSessionSuccess) {
                        mipokaCustomToast('Pengajuan Sarana dan Prasarana telah dikirim.');

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          penggunaDaftarPengajuanSaranaDanPrasaranaPageRoute,
                              (route) => false,
                        );
                      } else if (state is DeleteSessionSuccess) {
                        Navigator.pop(context, true);
                      } else if (state is SessionError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is SessionLoading) {
                        return const Text('Loading');
                      } else if (state is SessionHasData) {
                        final session = state.session;

                        final ormawaList = session.mipokaUser.ormawa;
                        List<String> namaOrmawaList = ormawaList.map(
                                (ormawa) => ormawa.namaOrmawa).toList();

                        _ormawa = session.ormawa;
                        _ormawa ??= ormawaList.first;
                        _tanggalMulaiController.text = session.tanggalMulai;
                        _tanggalSelesaiController.text = session.tanggalSelesai;
                        _gedungController.text = session.gedung;
                        _gedungController.text = _gedungController.text == "" ? listGedung.first : _gedungController.text;
                        _ruangController.text = session.ruangan;
                        _ruangController.text = _ruangController.text == "" ? listRuangan.first : _ruangController.text;
                        _waktuMulaiController.text = session.waktuMulaiPenggunaan;
                        _waktuSelesaiController.text = session.waktuSelesaiPenggunaan;

                        _proyektorLcdController.text = session.proyektor.toString();
                        _laptopController.text = session.laptop.toString();
                        _mikrofonController.text = session.mikrofon.toString();
                        _speakerController.text = session.speaker.toString();
                        _mejaController.text = session.meja.toString();
                        _kursiController.text = session.kursi.toString();
                        _papanTulisController.text = session.papanTulis.toString();
                        _spidolController.text = session.spidol.toString();
                        _lainController.text = session.lainLain;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle('Nama Ormawa'),
                            // BlocBuilder<OrmawaBloc, OrmawaState>(
                            //   builder: (context, state) {
                            //     if (state is OrmawaLoading) {
                            //       return const Text("Loading ....");
                            //     } else if (state is AllOrmawaHasData) {
                            //
                            //       final ormawaList = session.mipokaUser.ormawa;
                            //
                            //       List<String> namaOrmawaList = state.ormawaList.map(
                            //               (ormawa) => ormawa.namaOrmawa).toList();
                            //
                            //       _ormawa ??= ormawaList.first;
                            //
                            //       return MipokaCustomDropdown(
                            //           items: namaOrmawaList,
                            //           initialItem: _ormawa?.namaOrmawa ?? "",
                            //           onValueChanged: (value) {
                            //             int index = namaOrmawaList.indexOf(value!);
                            //             _ormawa = state.ormawaList[index];
                            //           }
                            //       );
                            //     } else if (state is OrmawaError) {
                            //       return Text(state.message);
                            //     } else {
                            //       return const Text("OrmawaBloc hasn't been triggered yet.");
                            //     }
                            //   },
                            // ),

                            MipokaCustomDropdown(
                                items: namaOrmawaList,
                                initialItem: _ormawa?.namaOrmawa ?? "",
                                onValueChanged: (value) {
                                  int index = namaOrmawaList.indexOf(value!);
                                  _ormawa = ormawaList[index];
                                }
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
                              items: listGedung,
                              onValueChanged: (value) {
                                _gedungController.text = value ?? "";
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Ruang'),

                            MipokaCustomDropdown(
                              items: listGedung,
                              onValueChanged: (value) {
                                _ruangController.text = value ?? "";
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Mulai Kegiatan'),
                            CustomTimePickerField(controller: _waktuMulaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Selesai Kegiatan'),
                            CustomTimePickerField(controller: _waktuSelesaiController),

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
                                  onTap: () => context.read<SessionBloc>().add(
                                      DeleteSessionEvent(idSession: widget.idSession)),
                                  text: 'Batal',
                                ),
                                const SizedBox(width: 8.0),
                                CustomMipokaButton(
                                  onTap: () {
                                    if (_tanggalMulaiController.text.isNotEmpty &&
                                        _tanggalSelesaiController.text.isNotEmpty &&
                                        _gedungController.text.isNotEmpty &&
                                        _ruangController.text.isNotEmpty &&
                                        _waktuMulaiController.text.isNotEmpty &&
                                        _waktuSelesaiController.text.isNotEmpty) {
                                      try {

                                        final proyektorLcd = int.tryParse(_proyektorLcdController.text);
                                        final laptop = int.tryParse(_laptopController.text);
                                        final mikrofon = int.tryParse(_mikrofonController.text);
                                        final speaker = int.tryParse(_speakerController.text);
                                        final meja = int.tryParse(_mejaController.text);
                                        final kursi = int.tryParse(_kursiController.text);
                                        final papanTulis = int.tryParse(_papanTulisController.text);
                                        final spidol = int.tryParse(_spidolController.text);

                                        mipokaCustomToast(savingDataMessage);

                                        Navigator.pop(
                                          context,
                                          session.copyWith(
                                            ormawa: _ormawa,
                                            tanggalMulai: _tanggalMulaiController.text,
                                            tanggalSelesai: _tanggalSelesaiController.text,
                                            gedung: _gedungController.text,
                                            ruangan: _ruangController.text,
                                            waktuMulaiPenggunaan: _waktuMulaiController.text,
                                            waktuSelesaiPenggunaan: _waktuSelesaiController.text,
                                            proyektor: proyektorLcd,
                                            laptop: laptop,
                                            mikrofon: mikrofon,
                                            speaker: speaker,
                                            meja: meja,
                                            kursi: kursi,
                                            papanTulis: papanTulis,
                                            spidol: spidol,
                                            lainLain: _lainController.text,
                                            updatedBy: user?.email ?? "unknown",
                                            updatedAt: currentDate,
                                          ),
                                        );

                                      } catch (e) {
                                        mipokaCustomToast(dataTypeErrorMessage);
                                      }
                                    } else {
                                      mipokaCustomToast(emptyFieldMessage);
                                    }
                                  },
                                  text: 'Kirim',
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (state is SessionError) {
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
      )
    );
  }
}

