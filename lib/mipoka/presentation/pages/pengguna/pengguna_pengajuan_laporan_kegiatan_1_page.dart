import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaPengajuanLaporanKegiatan1 extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan1({
    required this.laporanArgs,
    super.key,
  });

  final LaporanArgs laporanArgs;

  @override
  State<PenggunaPengajuanLaporanKegiatan1> createState() =>
      _PenggunaPengajuanLaporanKegiatan1State();
}

class _PenggunaPengajuanLaporanKegiatan1State
    extends State<PenggunaPengajuanLaporanKegiatan1> {

  @override
  void initState() {
    Future.microtask(() {
      context.read<LaporanBloc>().add(
          ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
      context.read<UsulanKegiatanBloc>().add(
          const ReadAllUsulanKegiatanEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  late QuillController _pencapaianController;
  late String _namaKegiatanController;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<LaporanBloc, LaporanState>(
        builder: (context, laporanState) {
          return BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
            builder: (context, usulanState) {
              if (laporanState is LaporanLoading && usulanState is UsulanKegiatanLoading) {
                return const Text('Loading ...');
              } else if (laporanState is LaporanHasData &&
                  usulanState is AllUsulanKegiatanHasData){
                final laporan = laporanState.laporan;
                final usulan = usulanState.usulanKegiatanList;

                List<String> namaKegiatanList = usulan.map(
                        (usulanKegiatan) => usulanKegiatan.namaKegiatan).toList();

                _pencapaianController =  QuillController(
                  document: Document()..insert(0, laporan.pencapaian),
                  selection: const TextSelection.collapsed(offset: 0),
                );

                _namaKegiatanController = usulan[selectedIndex ?? 0].namaKegiatan;

                return SingleChildScrollView(
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
                            // buildTitle('Nama Ormawa'),
                            // buildTitle(namaOrmawa ?? ""),

                            // const CustomFieldSpacer(),

                            buildTitle('Nama Kegiatan'),

                            MipokaCustomDropdown(
                              items: namaKegiatanList,
                              initialItem: _namaKegiatanController,
                              onValueChanged: (value) {
                                setState(() {
                                  _namaKegiatanController = value!;
                                  selectedIndex = namaKegiatanList.indexOf(_namaKegiatanController);
                                });
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Pencapaian'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan.revisiPencapaian != "")
                              buildRevisiText(laporan.revisiLaporan.revisiPencapaian),

                            CustomRichTextField(
                                controller: _pencapaianController),

                            const CustomFieldSpacer(),

                            TextButton(onPressed: () {
                              print(_pencapaianController.document.toPlainText());
                              print(_pencapaianController.document.toDelta().toList());

                            },
                              child: Text("Print RichText Format"),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                widget.laporanArgs.isRevisiLaporan == true ?
                                CustomMipokaButton(
                                  onTap: () => Navigator.pop(context),
                                  text: 'Batal',
                                ) :
                                CustomMipokaButton(
                                  onTap: () {
                                    context.read<LaporanBloc>().add(
                                        DeleteLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
                                    mipokaCustomToast("Laporan telah dihapus.");
                                    Navigator.pop(context);
                                  },
                                  text: 'Batal',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () {
                                    if (_pencapaianController.document.toPlainText().isNotEmpty) {
                                      Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanLaporanKegiatan2PageRoute,
                                        arguments: widget.laporanArgs,
                                      ).then((_) => context.read<LaporanBloc>().add(
                                          ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan)));

                                      context.read<LaporanBloc>().add(
                                        UpdateLaporanEvent(
                                          laporan: laporan.copyWith(
                                            usulanKegiatan: usulan[selectedIndex ?? 0],
                                            pencapaian: _pencapaianController.document.toPlainText(),
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          ),
                                        ),
                                      );
                                    } else {
                                      mipokaCustomToast(emptyFieldMessage);
                                    }
                                  },
                                  text: 'Berikutnya',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );

              } else if (laporanState is LaporanError) {
                return Text(laporanState.message);
              } else if (usulanState is UsulanKegiatanError) {
                return Text(usulanState.message);
              } else {
                if (kDebugMode) {
                  print("Bloc hasn't been trigerred.");
                }
                return const Center();
              }
            },
          );
        },
      ),
    );
  }
}
