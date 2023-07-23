import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
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
    required this.partisipanArgs,
  });

  final PartisipanArgs partisipanArgs;

  @override
  State<EditDataPesertaDalamKota> createState() => _EditDataPesertaDalamKotaState();
}

class _EditDataPesertaDalamKotaState extends State<EditDataPesertaDalamKota> {
  final TextEditingController _noIndukController = TextEditingController();
  final TextEditingController _namaPartisipanController = TextEditingController();
  final TextEditingController _peranPartisipanController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();

  @override
  void initState() {
    _noIndukController.text = widget.partisipanArgs.usulanKegiatan.partisipan[widget.partisipanArgs.index].noInduk;
    _namaPartisipanController.text = widget.partisipanArgs.usulanKegiatan.partisipan[widget.partisipanArgs.index].namaPartisipan;
    _peranPartisipanController.text = widget.partisipanArgs.usulanKegiatan.partisipan[widget.partisipanArgs.index].peranPartisipan;
    _dasarPengirimanController.text = widget.partisipanArgs.usulanKegiatan.partisipan[widget.partisipanArgs.index].dasarPengiriman;
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

                          if (_noIndukController.text.isNotEmpty && _namaPartisipanController.text.isNotEmpty &&
                              _peranPartisipanController.text.isNotEmpty && _dasarPengirimanController.text.isNotEmpty) {

                            final usulanKegiatan = widget.partisipanArgs.usulanKegiatan;
                            final partisipan = usulanKegiatan.partisipan[widget.partisipanArgs.index];

                            final newPartisipan = partisipan.copyWith(
                              noInduk: _noIndukController.text,
                              namaPartisipan: _namaPartisipanController.text,
                              peranPartisipan: _peranPartisipanController.text,
                              dasarPengiriman: _dasarPengirimanController.text,
                            );

                            usulanKegiatan.partisipan[widget.partisipanArgs.index] = PartisipanModel.fromEntity(newPartisipan);

                            Navigator.pop(
                              context,
                              usulanKegiatan.copyWith(
                                partisipan: usulanKegiatan.partisipan,
                              ),
                            );
                          }
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
