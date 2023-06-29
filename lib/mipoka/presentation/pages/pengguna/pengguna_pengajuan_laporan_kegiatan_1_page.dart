import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';

class PenggunaPengajuanLaporanKegiatan1 extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan1({
    required this.idLaporan,
    super.key,
  });

  final int idLaporan;

  @override
  State<PenggunaPengajuanLaporanKegiatan1> createState() =>
      _PenggunaPengajuanLaporanKegiatan1State();
}

class _PenggunaPengajuanLaporanKegiatan1State
    extends State<PenggunaPengajuanLaporanKegiatan1> {

  @override
  void initState() {
    BlocProvider.of<LaporanBloc>(context, listen: false).add(
      const ReadAllLaporanEvent(),
    );
    BlocProvider.of<UsulanKegiatanBloc>(context, listen: false).add(
      const ReadAllUsulanKegiatanEvent();
    );
    super.initState();
  }

  final QuillController _pencapaianController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  buildTitle('Mikroskil Esport'),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),

                  MipokaCustomDropdown(
                    items: listNamaKegiatan,
                    onValueChanged: (value) {

                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Pencapaian'),
                  CustomRichTextField(controller: _pencapaianController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Batal',
                      ),

                      const SizedBox(width: 8),

                      CustomMipokaButton(
                        onTap: () => Navigator.pushNamed(
                          context,
                          penggunaPengajuanLaporanKegiatan2PageRoute,
                          arguments: widget.idLaporan,
                        ),
                        text: 'Berikutnya',
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
