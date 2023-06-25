import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaPengajuanUsulanKegiatan3TertibAcara
    extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan3TertibAcara({
    super.key,
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<PenggunaPengajuanUsulanKegiatan3TertibAcara> createState() => _PenggunaPengajuanUsulanKegiatan3TertibAcaraState();
}

class _PenggunaPengajuanUsulanKegiatan3TertibAcaraState extends State<PenggunaPengajuanUsulanKegiatan3TertibAcara> {

  @override
  void initState() {
    BlocProvider.of<TertibAcaraBloc>(context).add(
      ReadTertibAcaraEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
            const CustomFieldSpacer(),
            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Tertib Acara'),
                  buildDescription(
                      'Rincikan alur dari kegiatan yang akan dilaksanakan'),
                  CustomAddButton(
                    buttonText: 'Tertib Acara',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      penggunaPengajuanUsulanKegiatan3TertibAcaraTambahPageRoute,
                      arguments: widget.idUsulanKegiatan,
                    ),
                  ),
                  const CustomFieldSpacer(),

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
                        text: 'Tambahkan',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildDescription(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4.0),
      ],
    );
  }
}
