import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
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
  int? idRevisiLaporan;

  @override
  void initState() {
    Future.microtask(() {
      context.read<LaporanBloc>().add(
          ReadLaporanEvent(idLaporan: widget.idLaporan));
      context.read<MipokaUserBloc>().add(
          ReadMipokaUserEvent(idMipokaUser: user!.uid));
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
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
                builder: (context, state) {
                  if (state is LaporanLoading) {
                    return const Text("Loading ...");
                  } else if (state is LaporanHasData) {
                    final laporan = state.laporan;

                    idRevisiLaporan = laporan.idLaporan + newId ;
                    return CustomContentBox(
                      children: [
                        buildTitle('Nama Ormawa'),
                        customDisplayField(laporan.usulanKegiatan?.ormawa?.namaOrmawa ?? ""),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: "Nama Kegiatan",
                          mainText: laporan.usulanKegiatan?.namaKegiatan ?? "",
                          controller: _commentNamaKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Pencapaian',
                          mainText: laporan.pencapaian,
                          controller: _revisiPencapaianController,
                        ),
                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () => Future.microtask(() {
                                context.read<RevisiLaporanBloc>().add(DeleteRevisiLaporanEvent(idRevisiLaporan!));
                                Navigator.pop(context);
                              }),
                              text: "Batal",
                            ),

                            const SizedBox(width: 8.0),

                            BlocBuilder<MipokaUserBloc, MipokaUserState>(
                              builder: (context, state) {
                                if (state is MipokaUserLoading) {
                                  return const Text("Loading ...");
                                } else if (state is MipokaUserHasData) {
                                  return CustomMipokaButton(
                                    onTap: () {
                                      context.read<LaporanBloc>().add(
                                        UpdateLaporanEvent(
                                          laporan: laporan.copyWith(
                                            revisiLaporan: laporan.revisiLaporan?.copyWith(
                                              idRevisiLaporan: newId,
                                              mipokaUser: state.mipokaUser,
                                              revisiPencapaian: _revisiPencapaianController.text,
                                              updatedAt: currentDate,
                                              updatedBy: user?.email ?? "unknown",
                                            ),
                                          ),
                                        ),
                                      );
                                      Navigator.pushNamed(
                                        context,
                                        pemeriksaPengajuanLaporanKegiatan2PageRoute,
                                        arguments: widget.idLaporan,
                                      );
                                    },
                                    text: 'Berikutnya',
                                  );
                                } else if (state is MipokaUserError) {
                                  return Text(state.message);
                                } else {
                                  return const Text("MipokaUser hasn't been triggered yet.");
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  } else if (state is LaporanError) {
                    return Text(state.message);
                  } else {
                    return const Text("LaporanBloc hasn't triggered yet.");
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
