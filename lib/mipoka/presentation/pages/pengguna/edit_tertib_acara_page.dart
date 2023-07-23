import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
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

class EditTertibAcaraPage extends StatefulWidget {
  const EditTertibAcaraPage({
    super.key,
    required this.tertibAcaraArgs,
  });

  final TertibAcaraArgs tertibAcaraArgs;

  @override
  State<EditTertibAcaraPage> createState() => _EditTertibAcaraPageState();
}

class _EditTertibAcaraPageState extends State<EditTertibAcaraPage> {

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _aktivitasController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    _waktuMulaiController.text = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].waktuMulai;
    _waktuSelesaiController.text =widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].waktuSelesai;
    _aktivitasController.text  = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].aktivitas;
    _keteranganController.text = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].keterangan;
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

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

              CustomContentBox(
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

                      CustomMipokaButton(
                        onTap: () {
                          if (_waktuMulaiController.text.isNotEmpty && _waktuSelesaiController.text.isNotEmpty
                              && _aktivitasController.text.isNotEmpty && _keteranganController.text.isNotEmpty)
                          {
                            int uniqueId = UniqueIdGenerator.generateUniqueId();

                            final usulanKegiatan = widget.tertibAcaraArgs.usulanKegiatan;
                            final tertibAcara = usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index];

                            final newTertibAcara = tertibAcara.copyWith(
                              waktuMulai: _waktuMulaiController.text,
                              waktuSelesai: _waktuSelesaiController.text,
                              aktivitas: _aktivitasController.text,
                              keterangan: _keteranganController.text,
                              updatedAt: currentDate,
                              updatedBy: user?.email ?? "unknown",
                            );

                            usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index] = TertibAcaraModel.fromEntity(newTertibAcara);

                            context.read<UsulanKegiatanBloc>().add(
                              UpdateUsulanKegiatanEvent(
                                usulanKegiatan: widget.tertibAcaraArgs.usulanKegiatan.copyWith(
                                  tertibAcara: usulanKegiatan.tertibAcara,
                                ),
                              ),
                            );

                            Navigator.pop(context);
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Simpan',
                      ),

                      BlocListener<UsulanKegiatanBloc, UsulanKegiatanState>(
                        listenWhen: (prev, current) =>
                        prev.runtimeType != current.runtimeType,
                        listener: (context, state) {
                          if (state is UsulanKegiatanSuccess) {
                            mipokaCustomToast("Tertib Acara telah diedit");
                            Navigator.pop(context);
                          }
                          else if (state is UsulanKegiatanError) {
                            mipokaCustomToast(state.message);
                          }
                        },
                        child: const SizedBox(),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
