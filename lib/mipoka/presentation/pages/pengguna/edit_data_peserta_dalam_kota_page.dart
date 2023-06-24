import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class EditDataPesertaDalamKota extends StatefulWidget {
  const EditDataPesertaDalamKota({
    super.key,
    required this.multipleArgs,
  });

  final MultipleArgs multipleArgs;

  @override
  State<EditDataPesertaDalamKota> createState() => _EditDataPesertaDalamKotaState();
}

class _EditDataPesertaDalamKotaState extends State<EditDataPesertaDalamKota> {
  final TextEditingController _nimNipController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();

  @override
  void initState() {
    _nimNipController.text = widget.multipleArgs.object.partisipan.nim;
    _namaLengkapController.text = widget.multipleArgs.object.partisipan.namaLengkap;
    _peranController.text = widget.multipleArgs.object.partisipan.peran;
    _dasarPengirimanController.text = widget.multipleArgs.object.partisipan.dasarKirim;
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
                              widget.multipleArgs.object.partisipan.copyWith(
                                nim: _nimNipController.text,
                                namaLengkap: _namaLengkapController.text,
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
