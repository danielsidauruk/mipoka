import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_load_image.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanLaporanKegiatan3Page extends StatefulWidget {
  const PemeriksaPengajuanLaporanKegiatan3Page({
    super.key,
    required this.idLaporan
  });
  
  final int idLaporan;

  @override
  State<PemeriksaPengajuanLaporanKegiatan3Page> createState() =>
      _PemeriksaPengajuanLaporanKegiatan3PageState();
}

class _PemeriksaPengajuanLaporanKegiatan3PageState
    extends State<PemeriksaPengajuanLaporanKegiatan3Page> {
  final TextEditingController _revisiLatarBelakangController =
      TextEditingController();
  final TextEditingController _revisiHasilKegiatanController =
      TextEditingController();
  final TextEditingController _revisiPenutupController = TextEditingController();

  final TextEditingController _revisiFotoDokumenasiKegiatanController =
      TextEditingController();
  final TextEditingController _revisiFotoPostinganKegiatanController =
      TextEditingController();
  final TextEditingController _revisiFotoTabulasiHasilController =
      TextEditingController();
  final TextEditingController _revisiFotofakturpembayaranController =
      TextEditingController();

  final StreamController<bool> _fotoDokumentasiStream = StreamController<bool>.broadcast();
  final StreamController<bool> _fotoPostinganStream = StreamController<bool>.broadcast();
  final StreamController<bool> _fotoTabulasiHasilStream = StreamController<bool>.broadcast();
  final StreamController<bool> _fotoFakturPembayaranStream = StreamController<bool>.broadcast();

  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  void initState() {
    context.read<LaporanBloc>().add(
      ReadLaporanEvent(idLaporan: widget.idLaporan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<RevisiLaporanBloc>().close();
    context.read<LaporanBloc>().close();
    _fotoDokumentasiStream.close();
    _fotoPostinganStream.close();
    _fotoTabulasiHasilStream.close();
    _fotoFakturPembayaranStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                    return CustomContentBox(
                      children: [
                        CustomCommentWidget(
                          title: 'Latar Belakang',
                          mainText:
                          laporan.latarBelakang,
                          controller: _revisiLatarBelakangController,
                        ),
                        const CustomFieldSpacer(),
                        CustomCommentWidget(
                          title: 'Tujuan Kegiatan',
                          mainText: laporan.hasilKegiatan,
                          controller: _revisiHasilKegiatanController,
                        ),
                        const CustomFieldSpacer(),
                        CustomCommentWidget(
                          title: 'Penutup',
                          mainText: laporan.penutup,
                          controller: _revisiPenutupController,
                        ),
                        const CustomFieldSpacer(),
                        CustomCommentForTable(
                          title: 'Postingan Kegiatan',
                          description: 'Catatan (Berisi file yang harus direvisi)',
                          controller: _revisiFotoDokumenasiKegiatanController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _fotoDokumentasiStream,
                          imageUrl: laporan.fotoDokumentasiKegiatan[0],
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: 'Dokumentasi Kegiatan',
                          description: 'Catatan (Berisi file yang harus direvisi)',
                          controller: _revisiFotoPostinganKegiatanController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _fotoPostinganStream,
                          imageUrl: laporan.fotoPostinganKegiatan,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: 'Tabulasi Hasil',
                          description: 'Catatan (Berisi file yang harus direvisi)',
                          controller: _revisiFotoTabulasiHasilController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _fotoTabulasiHasilStream,
                          imageUrl: laporan.fotoTabulasiHasil,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: 'Faktur Pembayaran',
                          description: 'Catatan (Berisi file yang harus direvisi)',
                          controller: _revisiFotofakturpembayaranController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _fotoFakturPembayaranStream,
                          imageUrl: laporan.fotoFakturPembayaran,
                        ),

                        const CustomFieldSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () {
                                context.read<LaporanBloc>().add(
                                  UpdateLaporanFirstPageEvent(
                                    laporan: laporan.copyWith(
                                      revisiLaporan: laporan.revisiLaporan?.copyWith(
                                        revisiLatarBelakang: _revisiLatarBelakangController.text,
                                        revisiHasilKegiatan: _revisiHasilKegiatanController.text,
                                        revisiPenutup: _revisiPenutupController.text,
                                        revisiFotoDokumentasiKegiatan: _revisiFotoDokumenasiKegiatanController.text,
                                        revisiFotoPostinganKegiatan: _revisiFotoPostinganKegiatanController.text,
                                        revisiFotoTabulasiHasil: _revisiFotoTabulasiHasilController.text,
                                        revisiFotoFakturPembayaran: _revisiFotofakturpembayaranController.text,
                                        updatedAt: currentDate,
                                        updatedBy: user?.email ?? "unknown",
                                      ),
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Sebelumnya',
                            ),

                            const SizedBox(width: 4.0),

                            CustomMipokaButton(
                              onTap: () {
                                context.read<LaporanBloc>().add(
                                  UpdateLaporanFirstPageEvent(
                                    laporan: laporan.copyWith(
                                      revisiLaporan: laporan.revisiLaporan?.copyWith(
                                        revisiLatarBelakang: _revisiLatarBelakangController.text,
                                        revisiHasilKegiatan: _revisiHasilKegiatanController.text,
                                        revisiPenutup: _revisiPenutupController.text,
                                        revisiFotoDokumentasiKegiatan: _revisiFotoDokumenasiKegiatanController.text,
                                        revisiFotoPostinganKegiatan: _revisiFotoPostinganKegiatanController.text,
                                        revisiFotoTabulasiHasil: _revisiFotoTabulasiHasilController.text,
                                        revisiFotoFakturPembayaran: _revisiFotofakturpembayaranController.text,
                                        updatedAt: currentDate,
                                        updatedBy: user?.email ?? "unknown",
                                      ),
                                    ),
                                  ),
                                );
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  pemeriksaDaftarLaporanKegiatanPageRoute,
                                      (route) => false,
                                );
                              },
                              text: 'Tolak',
                            ),

                            const SizedBox(width: 4.0),

                            CustomMipokaButton(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  pemeriksaDaftarLaporanKegiatanPageRoute,
                                      (route) => false,
                                );

                                context.read<LaporanBloc>().add(
                                  UpdateLaporanFirstPageEvent(
                                    laporan: laporan.copyWith(
                                      validasiPembina: disetujui,
                                    ),
                                  ),
                                );
                                mipokaCustomToast("Laporan diterima.");
                              },
                              text: 'Terima',
                            ),
                          ],
                        )
                      ],
                    );
                  } else if (state is LaporanError) {
                    return Text(state.message);
                  } else {
                    return const Text("LaporanBLoC hasn't been triggered yet.");
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
