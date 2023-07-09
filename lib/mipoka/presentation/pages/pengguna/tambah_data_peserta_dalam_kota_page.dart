import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class TambahDataPesertaDalamKota extends StatefulWidget {
  const TambahDataPesertaDalamKota({
    super.key,
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<TambahDataPesertaDalamKota> createState() => _TambahDataPesertaDalamKotaState();
}

class _TambahDataPesertaDalamKotaState extends State<TambahDataPesertaDalamKota> {
  final TextEditingController _noIndukController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();

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
                        onTap: () => (_noIndukController.text.isNotEmpty && _namaLengkapController.text.isNotEmpty
                            && _peranController.text.isNotEmpty && _dasarPengirimanController.text.isNotEmpty) ?
                        Future.microtask(() {
                          context.read<PartisipanBloc>().add(
                              CreatePartisipanEvent(
                                idUsulanKegiatan: widget.idUsulanKegiatan,
                                partisipan: Partisipan(
                                  idPartisipan: newId,
                                  noInduk: _noIndukController.text,
                                  namaPartisipan: _namaLengkapController.text,
                                  nik: "",
                                  tempatLahir: "",
                                  tglLahir: "",
                                  peranPartisipan: _peranController.text,
                                  dasarPengiriman: _dasarPengirimanController.text,
                                  createdAt: currentDate,
                                  createdBy: user?.email ?? "unknown",
                                  updatedAt: currentDate,
                                  updatedBy: user?.email ?? "unknown",
                                ),
                              )
                          );
                          mipokaCustomToast("Data Peserta telah ditambahkan");
                          Navigator.pop(context);
                        }) :
                        mipokaCustomToast(emptyFieldMessage),
                        text: 'Tambahkan Peserta',
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
