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
  final TextEditingController _noIndukController = TextEditingController();
  final TextEditingController _namaPartisipanController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _peranPartisipanController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();
  final TextEditingController _tglLahirController = TextEditingController();

  @override
  void initState() {
    _noIndukController.text = widget.partisipanArgs.partisipan.noInduk;
    _namaPartisipanController.text = widget.partisipanArgs.partisipan.namaPartisipan;
    _nikController.text = widget.partisipanArgs.partisipan.nik;
    _tempatLahirController.text = widget.partisipanArgs.partisipan.tempatLahir;
    _peranPartisipanController.text = widget.partisipanArgs.partisipan.peranPartisipan;
    _dasarPengirimanController.text = widget.partisipanArgs.partisipan.dasarPengiriman;
    _tglLahirController.text = widget.partisipanArgs.partisipan.tglLahir;
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
                    controller: _noIndukController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Lengkap'),
                  CustomTextField(controller: _namaPartisipanController),

                  const CustomFieldSpacer(),

                  buildTitle('NIK'),
                  CustomTextField(controller: _nikController),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Lahir'),
                  CustomTextField(controller: _tempatLahirController),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Lahir'),
                  CustomDatePickerField(
                    controller: _tglLahirController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Peran'),
                  CustomTextField(controller: _peranPartisipanController),

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
                                noInduk: _noIndukController.text,
                                namaPartisipan: _namaPartisipanController.text,
                                nik: _nikController.text,
                                tempatLahir: _tempatLahirController.text,
                                tglLahir: _tglLahirController.text,
                                peranPartisipan: _peranPartisipanController.text,
                                dasarPengiriman: _dasarPengirimanController.text,
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
