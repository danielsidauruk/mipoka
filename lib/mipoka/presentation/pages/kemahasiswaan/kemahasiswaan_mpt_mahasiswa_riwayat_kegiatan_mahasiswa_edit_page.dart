import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class MahasiswaRiwayatKegiatanMahasiswaEditPage extends StatefulWidget {
  const MahasiswaRiwayatKegiatanMahasiswaEditPage({
    super.key,
    required this.riwayatKegiatanMpt,
  });

  final RiwayatKegiatanMpt riwayatKegiatanMpt;

  @override
  State<MahasiswaRiwayatKegiatanMahasiswaEditPage> createState() => _MahasiswaRiwayatKegiatanMahasiswaEditPageState();
}

class _MahasiswaRiwayatKegiatanMahasiswaEditPageState extends State<MahasiswaRiwayatKegiatanMahasiswaEditPage> {
  final TextEditingController _idperiodeController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaMahasiswaController = TextEditingController();
  final TextEditingController _jenisKegiatanController = TextEditingController();
  final TextEditingController _keteranganMahasiswaController = TextEditingController();
  final TextEditingController _poinController = TextEditingController();
  bool jenisPartisipan = false;

  @override
  void initState() {
    _idperiodeController.text = widget.riwayatKegiatanMpt.kegiatanPerPeriodeMpt.toString();
    super.initState();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Edit Riwayat Kegiatan Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Periode'),
                  CustomTextField(controller: _idperiodeController),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  BlocBuilder<MipokaUserBloc, MipokaUserState>(
                    builder: (context, state) {
                      if (state is MipokaUserLoading) {
                        return const Text("Loading ....");
                      } else if (state is MipokaUserHasData) {
                        _triggerNim(state.mipokaUser.nim);
                        _nimController.text = state.mipokaUser.nim;

                        return CustomTextFieldForNim(
                          textInputType: TextInputType.number,
                          controller: _nimController,
                          onSubmitted: (value) => _triggerNim(value),
                        );
                      } else if (state is MipokaUserError) {
                        return Text(state.message);
                      } else {
                        return const Text("MipokaUserBloc hasn't been triggered.");
                      }
                    },
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

                  buildTitle('Jenis Kegiatan'),
                  CustomTextField(controller: _jenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Mahasiswa'),
                  CustomTextField(controller: _jenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('File Unggahan'),
                  CustomIconButton(
                    text: 'loremipsum.pdf',
                    onTap: () {},
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Kemahasiswaan'),
                  CustomTextField(controller: _keteranganMahasiswaController),

                  const CustomFieldSpacer(),

                  buildTitle('Poin'),
                  CustomTextField(
                    controller: _poinController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    children: [
                      buildTitle('Status Verifikasi'),
                      const SizedBox(width: 4.0),
                      Switch(
                        value: jenisPartisipan,
                        onChanged: (bool newValue) {
                          setState(() => jenisPartisipan = newValue);
                        },
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: jenisPartisipan == false
                            ? buildTitle('Ditolak')
                            : buildTitle('Disetujui'),
                      ),
                    ],
                  ),

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