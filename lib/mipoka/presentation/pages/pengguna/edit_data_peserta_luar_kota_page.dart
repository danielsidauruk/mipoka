import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class EditDataPesertaLuarKotaPage extends StatefulWidget {
  const EditDataPesertaLuarKotaPage({
    super.key,
    required this.partisipanArgs,
  });

  final PartisipanArgs partisipanArgs;

  @override
  State<EditDataPesertaLuarKotaPage> createState() => _EditDataPesertaLuarKotaPageState();
}

class _EditDataPesertaLuarKotaPageState extends State<EditDataPesertaLuarKotaPage> {
  final TextEditingController _nimNipController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void initState() {
    _nimNipController.text = widget.partisipanArgs.partisipan.nim;
    _namaLengkapController.text = widget.partisipanArgs.partisipan.namaLengkap;
    _nikController.text = widget.partisipanArgs.partisipan.nik;
    _tempatLahirController.text = widget.partisipanArgs.partisipan.tempatLahir;
    _peranController.text = widget.partisipanArgs.partisipan.peran;
    _dasarPengirimanController.text = widget.partisipanArgs.partisipan.dasarKirim;
    _tanggalLahirController.text = widget.partisipanArgs.partisipan.tglLahir;
    super.initState();
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

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  customBoxTitle('Data Peserta'),

                  const CustomFieldSpacer(),

                  buildTitle('NIM/NIP'),
                  CustomTextField(
                    controller: _nimNipController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Lengkap'),
                  CustomTextField(controller: _namaLengkapController),

                  const CustomFieldSpacer(),

                  buildTitle('NIK'),
                  CustomTextField(controller: _nikController),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Lahir'),
                  CustomTextField(controller: _tempatLahirController),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Lahir'),
                  CustomDatePickerField(
                    controller: _tanggalLahirController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Peran'),
                  CustomTextField(controller: _peranController),

                  const CustomFieldSpacer(),

                  buildTitle('Dasar Pengiriman'),
                  CustomTextField(controller: _dasarPengirimanController),

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
                        onTap: () {
                          BlocProvider.of<PartisipanBloc>(context, listen: false).add(
                            UpdatePartisipanEvent(
                              widget.partisipanArgs.partisipan.copyWith(
                                nim: _nimNipController.text,
                                namaLengkap: _namaLengkapController.text,
                                nik: _nikController.text,
                                tempatLahir: _tempatLahirController.text,
                                tglLahir: _tanggalLahirController.text,
                                peran: _peranController.text,
                                dasarKirim: _dasarPengirimanController.text,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        },
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
