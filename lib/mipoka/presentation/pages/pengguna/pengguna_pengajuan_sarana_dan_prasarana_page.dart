import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
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
    super.initState();
  }

  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _gedungController = TextEditingController();
  final TextEditingController _ruangController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  int? _idOrmawaController;

  final TextEditingController _proyektorLcdController = TextEditingController();
  final TextEditingController _laptopController = TextEditingController();
  final TextEditingController _mikrofonController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _mejaController = TextEditingController();
  final TextEditingController _kursiController = TextEditingController();
  final TextEditingController _papanTulisController = TextEditingController();
  final TextEditingController _spidolController = TextEditingController();
  final TextEditingController _lainController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print("page reloaded");
    }

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          if (state is SessionLoading) {
            return const Text('Loading');
          } else if (state is SessionHasData) {
            final session = state.session;

            context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());

            _idOrmawaController  = session.idOrmawa;
            _tanggalMulaiController.text = session.tanggalMulai;
            _tanggalSelesaiController.text = session.tanggalSelesai;
            _gedungController.text = session.gedung;
            _ruangController.text = session.ruangan;
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

            return SingleChildScrollView(
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

                              _idOrmawaController = idOrmawaList[0];

                              return MipokaCustomDropdown(
                                  items: ormawaList,
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
                        buildTitle('Tanggal Mulai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalMulaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Tanggal Selesai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalSelesaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Gedung'),
                        MipokaCustomDropdown(
                          items: listGedung,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Ruang'),

                        MipokaCustomDropdown(
                          items: listGedung,
                          onValueChanged: (value) {},
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
                              onTap: () {
                                context.read<SessionBloc>().add(
                                  DeleteSessionEvent(idSession: widget.idSession),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Batal',
                            ),
                            const SizedBox(width: 8.0),
                            CustomMipokaButton(
                              onTap: () {
                                context.read<SessionBloc>().add(
                                  UpdateSessionEvent(
                                    session: session.copyWith(
                                      idOrmawa: _idOrmawaController,
                                      tanggalMulai: _tanggalMulaiController.text,
                                      tanggalSelesai: _tanggalSelesaiController.text,
                                      gedung: _gedungController.text,
                                      ruangan: _ruangController.text,
                                      waktuMulaiPenggunaan: _waktuMulaiController.text,
                                      waktuSelesaiPenggunaan: _waktuSelesaiController.text,
                                      proyektor: int.parse(_proyektorLcdController.text),
                                      laptop: int.parse(_laptopController.text),
                                      mikrofon: int.parse(_mikrofonController.text),
                                      speaker: int.parse(_speakerController.text),
                                      meja: int.parse(_mejaController.text),
                                      kursi: int.parse(_kursiController.text),
                                      papanTulis: int.parse(_papanTulisController.text),
                                      spidol: int.parse(_spidolController.text),
                                      lainLain: _lainController.text,
                                      updatedBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                    ),
                                  )
                                );
                                Navigator.pushNamed(
                                  context,
                                  penggunaDaftarPengajuanSaranaDanPrasaranaPageRoute,
                                );
                              },
                              text: 'Kirim',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SessionError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}
