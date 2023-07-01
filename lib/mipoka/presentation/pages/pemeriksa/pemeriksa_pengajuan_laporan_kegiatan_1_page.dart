import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanLaporanKegiatan1Page extends StatefulWidget {
  const PemeriksaPengajuanLaporanKegiatan1Page({
    super.key,
    required this.idLaporan,
  });

  final int idLaporan;

  @override
  State<PemeriksaPengajuanLaporanKegiatan1Page> createState() =>
      _PemeriksaPengajuanLaporanKegiatan1PageState();
}

class _PemeriksaPengajuanLaporanKegiatan1PageState
    extends State<PemeriksaPengajuanLaporanKegiatan1Page> {
  final TextEditingController _commentNamaKegiatanController =
  TextEditingController();
  final TextEditingController _revisiPencapaianController =
  TextEditingController();

  @override
  void initState() {
    context.read<LaporanBloc>().add(
        ReadLaporanEvent(idLaporan: widget.idLaporan));
    context.read<RevisiLaporanBloc>().add(
        ReadRevisiLaporanEvent(idRevisiLaporan: widget.idLaporan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    context.read<RevisiLaporanBloc>().close();
    context.read<OrmawaBloc>().close();
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Page revisi laporan reloaded");
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Kegiatan - Laporan Kegiatan'),
              const CustomFieldSpacer(),
              BlocBuilder<LaporanBloc, LaporanState>(
                builder: (context, laporanState) {
                  if (laporanState is LaporanLoading) {
                    return const Text("Loading ...");
                  } else if (laporanState is LaporanHasData) {
                    final laporan = laporanState.laporan;

                    context.read<UsulanKegiatanBloc>().add(
                        ReadUsulanKegiatanEvent(
                            idUsulanKegiatan: laporan.idUsulan));
                    context.read<OrmawaBloc>().add(ReadOrmawaEvent(
                        idOrmawa: laporan.idOrmawa));

                    return CustomContentBox(
                      children: [
                        buildTitle('Nama Ormawa'),
                        BlocBuilder<OrmawaBloc, OrmawaState>(
                          builder: (context, state) {
                            if (state is OrmawaLoading) {
                              return const Text("Loading ...");
                            } else if (state is OrmawaHasData) {
                              return customDisplayField(
                                  state.ormawa.namaOrmawa);
                            } else if (state is OrmawaError) {
                              return Text(state.message);
                            } else {
                              return const Text(
                                  "OrmawaBloc hasn't triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                          builder: (context, state) {
                            if (state is UsulanKegiatanLoading) {
                              return const Text("Loading ...");
                            } else if (state is UsulanKegiatanHasData) {
                              return CustomCommentWidget(
                                title: "Nama Kegiatan",
                                mainText: state.usulanKegiatan.namaKegiatan,
                                controller: _commentNamaKegiatanController,
                              );
                            } else if (state is UsulanKegiatanError) {
                              return Text(state.message);
                            } else {
                              return const Text("UsulanKegiatanBloc hasn't been triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Pencapaian',
                          mainText:
                          laporan.pencapaian,
                          controller: _revisiPencapaianController,
                        ),
                        const CustomFieldSpacer(),
                        CustomMipokaButton(
                          onTap: () {
                            int idRevisiLaporan = laporan.idLaporan + newId;

                            context.read<RevisiLaporanBloc>().add(
                              CreateRevisiLaporanEvent(
                                revisiLaporan: RevisiLaporan(
                                    idRevisiLaporan: idRevisiLaporan,
                                    idAdmin: user?.uid ?? "unknown",
                                    idLaporan: laporan.idLaporan,
                                    idUsulan: laporan.idUsulan,
                                    revisiPencapaian: _revisiPencapaianController.text,
                                    revisiIdPesertaKegiatanLaporan: [],
                                    revisiIdBiayaKegiatan: [],
                                    revisiLatarBelakang: "",
                                    revisiHasilKegiatan: "",
                                    revisiPenutup: "",
                                    revisiFotoPostinganKegiatan: "",
                                    revisiFotoDokumentasiKegiatan: "",
                                    revisiFotoTabulasiHasil: "",
                                    revisiFotoFakturPembayaran: "",
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                ),
                              ),
                            );
                            Navigator.pushNamed(
                              context,
                              pemeriksaPengajuanLaporanKegiatan2PageRoute,
                              arguments: idRevisiLaporan,
                            );
                          },
                          text: 'Berikutnya',
                        ),
                      ],
                    );
                  } else if (laporanState is LaporanError) {
                    return Text(laporanState.message);
                  } else {
                    return const Text("Bloc hasn't triggered yet.");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
