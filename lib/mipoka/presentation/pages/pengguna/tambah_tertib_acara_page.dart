import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class TambahTertibAcaraPage extends StatefulWidget {
  const TambahTertibAcaraPage({
    super.key,
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<TambahTertibAcaraPage> createState() => _TambahTertibAcaraPageState();
}

class _TambahTertibAcaraPageState extends State<TambahTertibAcaraPage> {

  @override
  void initState() {
    BlocProvider.of<UsulanKegiatanBloc>(context).add(
      ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan),
    );
    super.initState();
  }

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _aktivitasController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

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

              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                builder: (context, state) {
                  if (state is UsulanKegiatanLoading) {
                    return const Text('Loading ...');
                  } else if (state is UsulanKegiatanHasData) {
                    return CustomContentBox(
                      children: [

                        customBoxTitle('Tambah Tertib Acara'),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Mulai'),
                        CustomTimePickerField(controller: _waktuMulaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Selesai'),
                        CustomTimePickerField(
                            controller: _waktuSelesaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Aktivitas'),
                        CustomTextField(controller: _aktivitasController),

                        const CustomFieldSpacer(),

                        buildTitle('Keterangan'),
                        CustomTextField(controller: _keteranganController),

                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              text: 'Kembali',
                            ),

                            const SizedBox(width: 8.0),

                            // CustomMipokaButton(
                            //   onTap: () {
                            //
                            //     Navigator.pop(context);
                            //   },
                            //   text: 'Tambahkan Peserta',
                            // ),
                            CustomMipokaButton(
                              onTap: () => (_waktuMulaiController.text.isNotEmpty && _waktuSelesaiController.text.isNotEmpty
                                  && _aktivitasController.text.isNotEmpty && _keteranganController.text.isNotEmpty) ?
                              Future.microtask(() {
                                mipokaCustomToast("Tertib Acara telah diupdate.");
                                context.read<TertibAcaraBloc>().add(
                                  CreateTertibAcaraEvent(
                                    idUsulanKegiatan: widget.idUsulanKegiatan,
                                    tertibAcara: TertibAcara(
                                      idTertibAcara: newId,
                                      waktuMulai: _waktuMulaiController.text,
                                      waktuSelesai: _waktuSelesaiController.text,
                                      aktivitas: _aktivitasController.text,
                                      keterangan: _keteranganController.text,
                                      createdAt: currentDate,
                                      createdBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              }) :
                              mipokaCustomToast(emptyFieldMessage),
                              text: 'Tambahkan Peserta',
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is UsulanKegiatanError) {
                    return Text(state.message);
                  } else {
                    return const Text('IDK Tambah Tertib Acara');
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
