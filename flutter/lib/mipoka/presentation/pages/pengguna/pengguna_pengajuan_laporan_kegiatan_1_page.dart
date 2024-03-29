import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
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

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<LaporanBloc>().add(
        ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
    context.read<UsulanKegiatanBloc>().add(
        const ReadAllUsulanKegiatanEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  final TextEditingController _pencapaianController = TextEditingController();
  UsulanKegiatan? _usulanKegiatan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<LaporanBloc>().add(
              ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
        },
      ),

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

                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is UpdateLaporanFirstPageSuccess) {
                        await Navigator.pushNamed(
                          context,
                          penggunaPengajuanLaporanKegiatan2PageRoute,
                          arguments: widget.laporanArgs,
                        ).then((_) => context.read<LaporanBloc>().add(
                            ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan)));

                      } else if (state is DeleteLaporanSuccess) {
                        Navigator.pop(context, true);
                      }

                    },
                    builder: (context, laporanState) {
                      if (laporanState is LaporanLoading) {
                        return const Text('Loading ...');
                      } else if (laporanState is LaporanHasData){

                        final laporan = laporanState.laporan;
                        _pencapaianController.text = laporan.pencapaian;
                        _usulanKegiatan = laporan.usulanKegiatan;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle('Nama Kegiatan'),

                            BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                              builder: (context, state) {
                                if (state is UsulanKegiatanLoading) {
                                  return const Text("Loading ...");
                                } else if (state is AllUsulanKegiatanHasData) {

                                  final usulanKegiatanList = state.usulanKegiatanList;

                                  List<String> namaUsulanKegiatan = usulanKegiatanList
                                      .map((usulanKegiatan) => usulanKegiatan.namaKegiatan)
                                      .toList();

                                  if (usulanKegiatanList.isNotEmpty) {
                                    _usulanKegiatan ??= usulanKegiatanList[0];
                                    return MipokaCustomDropdown(
                                      items: namaUsulanKegiatan,
                                      initialItem: _usulanKegiatan?.namaKegiatan,
                                      onValueChanged: (value) {
                                        int index = namaUsulanKegiatan.indexOf(value ?? _usulanKegiatan!.namaKegiatan);
                                        _usulanKegiatan = usulanKegiatanList[index];
                                      },
                                    );
                                  } else {
                                    return const Text("Tidak ada Usulan Kegiatan.");
                                  }

                                } else if (state is UsulanKegiatanError) {
                                  print("Error ${state.message}");
                                  return const SizedBox();
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Pencapaian'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan?.revisiPencapaian != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiPencapaian ?? ""),

                            CustomTextField(controller: _pencapaianController),

                            const CustomFieldSpacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomMipokaButton(
                                  onTap: () => Navigator.pop(context, true),
                                  text: 'Batal',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () {
                                    if (_pencapaianController.text.isEmpty) {
                                      mipokaCustomToast(emptyFieldPrompt("Pencapaian"));
                                    } else if (_usulanKegiatan == null) {
                                      mipokaCustomToast(emptyFieldPrompt("Nama Kegiatan"));
                                    } else {
                                      String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                                      final biayaKegiatan = _usulanKegiatan?.biayaKegiatan;
                                      List<RincianBiayaKegiatan> rincianBiayaKegiatan = [];

                                      if (biayaKegiatan != [] && laporan.rincianBiayaKegiatan == []) {
                                        biayaKegiatan?.forEach((selectedBiaya) {
                                          int uniqueId = UniqueIdGenerator.generateUniqueId();

                                          RincianBiayaKegiatan rincian = RincianBiayaKegiatan(
                                            idRincianBiayaKegiatan: uniqueId,
                                            namaBiaya: selectedBiaya.namaBiayaKegiatan,
                                            keterangan: selectedBiaya.keterangan,
                                            laporan: "",
                                            kuantitas: selectedBiaya.kuantiti,
                                            hargaSatuan: selectedBiaya.hargaSatuan,
                                            usulanAnggaran: selectedBiaya.total,
                                            realisasiAnggaran: 0,
                                            selisih: 0,
                                            createdAt: currentDate,
                                            createdBy: user?.email ?? "unknown",
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          );

                                          rincianBiayaKegiatan.add(rincian);
                                        });
                                      } else {
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();

                                        RincianBiayaKegiatan rincian = RincianBiayaKegiatan(
                                          idRincianBiayaKegiatan: uniqueId,
                                          namaBiaya: "-",
                                          keterangan: "-",
                                          laporan: "",
                                          kuantitas: 0,
                                          hargaSatuan: 0,
                                          usulanAnggaran: 0,
                                          realisasiAnggaran: 0,
                                          selisih: 0,
                                          createdAt: currentDate,
                                          createdBy: user?.email ?? "unknown",
                                          updatedAt: currentDate,
                                          updatedBy: user?.email ?? "unknown",
                                        );

                                        rincianBiayaKegiatan.add(rincian);
                                      }

                                      context.read<LaporanBloc>().add(
                                        UpdateLaporanFirstPageEvent(
                                          laporan: laporan.copyWith(
                                            usulanKegiatan: _usulanKegiatan,
                                            pencapaian: _pencapaianController.text,
                                            rincianBiayaKegiatan: rincianBiayaKegiatan,
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          ),
                                        ),
                                      );
                                    }

                                  },
                                  text: 'Berikutnya',
                                ),
                              ],
                            ),
                          ],
                        );

                      } else if (laporanState is LaporanError) {
                        return Text(laporanState.message);
                      } else {
                        if (kDebugMode) {
                          print("Bloc hasn't been trigerred.");
                        }
                        return const Center();
                      }
                    },
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