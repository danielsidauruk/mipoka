import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanUsulanKegiatan1Page extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan1Page({
    super.key,
    required this.idUsulan,
  });

  final int idUsulan;

  @override
  State<PemeriksaPengajuanUsulanKegiatan1Page> createState() =>
      _PemeriksaPengajuanUsulanKegiatan1PageState();
}

class _PemeriksaPengajuanUsulanKegiatan1PageState
    extends State<PemeriksaPengajuanUsulanKegiatan1Page> {

  final TextEditingController _commentNamaOrmawaController =
  TextEditingController();
  final TextEditingController _revisiPembiayaanController =
  TextEditingController();
  final TextEditingController _revisiNamaKegiatanController =
  TextEditingController();
  final TextEditingController _revisiBentukKegiatanController =
  TextEditingController();
  final TextEditingController _revisiDeskripsiKegiatanController =
  TextEditingController();
  final TextEditingController _revisiTanggalMulaiKegiatanController =
  TextEditingController();
  final TextEditingController _revisiTanggalSelesaiKegiatanController =
  TextEditingController();
  final TextEditingController _revisiWaktuMulaiKegiatanController =
  TextEditingController();
  final TextEditingController _revisiWaktuSelesaiKegiatanController =
  TextEditingController();
  final TextEditingController _revisiTempatKegiatanController =
  TextEditingController();
  final TextEditingController _revisiTanggalKeberangkatanController =
  TextEditingController();
  final TextEditingController _revisiTanggalKepulanganController =
  TextEditingController();
  final TextEditingController _revisiJumlahParsitipanController =
  TextEditingController();
  final TextEditingController _revisiTargetKegiatanController =
  TextEditingController();
  final TextEditingController _revisiTotalPendanaanController =
  TextEditingController();
  final TextEditingController _revisiKeteranganController =
  TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  bool? isLuarKota;

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
      ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<UsulanKegiatanBloc>().add(
              ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan));
        },
      ),

      drawer: const MobileCustomPemeriksaDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SaveReviseFirstPageSuccess) {

                        isLuarKota == true ?
                        Navigator.pushNamed(
                          context,
                          pemeriksaPengajuanUsulanKegiatan2LKPageRoute,
                          arguments: widget.idUsulan,
                        ).then((_) => context.read<UsulanKegiatanBloc>().add(
                            ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan))) :

                        Navigator.pushNamed(
                          context,
                          pemeriksaPengajuanUsulanKegiatan2DKPageRoute,
                          arguments: widget.idUsulan,
                        ).then((_) => context.read<UsulanKegiatanBloc>().add(
                            ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan)));

                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text("Loading ....");
                      } else if (state is UsulanKegiatanHasData) {
                        final usulanKegiatan = state.usulanKegiatan;

                        if(usulanKegiatan.tanggalKeberangkatan == ""
                            || usulanKegiatan.tanggalKeberangkatan == "-") {

                          isLuarKota = false;
                        } else {
                          isLuarKota = true;
                        }

                        print(isLuarKota);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CustomCommentWidget(
                              title: 'Nama Ormawa',
                              mainText: usulanKegiatan.ormawa?.namaOrmawa ?? "",
                              controller: _commentNamaOrmawaController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Pembiayaan',
                              mainText: usulanKegiatan.pembiayaan,
                              controller: _revisiPembiayaanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Nama Kegiatan',
                              mainText: usulanKegiatan.namaKegiatan,
                              controller: _revisiNamaKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Bentuk Kegiatan',
                              mainText: "${usulanKegiatan.kategoriBentukKegiatan}, ${usulanKegiatan.bentukKegiatan}",
                              controller: _revisiBentukKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Deskripsi Kegiatan',
                              mainText: usulanKegiatan.deskripsiKegiatan,
                              controller: _revisiDeskripsiKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Tanggal Mulai Kegiatan',
                              mainText: usulanKegiatan.tanggalMulaiKegiatan,
                              controller: _revisiTanggalMulaiKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Tanggal Selesai Kegiatan',
                              mainText: usulanKegiatan.tanggalSelesaiKegiatan,
                              controller: _revisiTanggalSelesaiKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Waktu Mulai Kegiatan',
                              mainText: usulanKegiatan.waktuMulaiKegiatan,
                              controller: _revisiWaktuMulaiKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Waktu Selesai Kegiatan',
                              mainText: usulanKegiatan.waktuSelesaiKegiatan,
                              controller: _revisiWaktuSelesaiKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Tempat Kegiatan',
                              mainText: usulanKegiatan.tempatKegiatan,
                              controller: _revisiTempatKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Tanggal Keberangkatan',
                              mainText: usulanKegiatan.tanggalKeberangkatan,
                              controller: _revisiTanggalKeberangkatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Tanggal Kepulangan',
                              mainText: usulanKegiatan.tanggalKepulangan,
                              controller: _revisiTanggalKepulanganController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Jumlah Parsitipan',
                              // mainText: '15 Orang',
                              mainText: "${usulanKegiatan.jumlahPartisipan} ${usulanKegiatan.kategoriJumlahPartisipan}",
                              controller: _revisiJumlahParsitipanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Target Kegiatan',
                              mainText: usulanKegiatan.targetKegiatan,
                              controller: _revisiTargetKegiatanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Total Pendanaan',
                              mainText: "${usulanKegiatan.totalPendanaan} ${usulanKegiatan.kategoriTotalPendanaan}",
                              controller: _revisiTotalPendanaanController,
                            ),

                            const CustomFieldSpacer(),

                            CustomCommentWidget(
                              title: 'Keterangan',
                              mainText: usulanKegiatan.keterangan,
                              controller: _revisiKeteranganController,
                            ),
                            const CustomFieldSpacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomMipokaButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'Batal',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () {
                                    String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                                    context.read<UsulanKegiatanBloc>().add(
                                      SaveReviseFirstPageEvent(
                                        usulanKegiatan: usulanKegiatan.copyWith(
                                          revisiUsulan: usulanKegiatan.revisiUsulan?.copyWith(
                                            revisiPembiayaan: _revisiPembiayaanController.text,
                                            revisiNamaKegiatan: _revisiNamaKegiatanController.text,
                                            revisiBentukKegiatan: _revisiBentukKegiatanController.text,
                                            revisiTempatKegiatan: _revisiTempatKegiatanController.text,
                                            revisiDeskripsiKegiatan: _revisiDeskripsiKegiatanController.text,
                                            revisiTanggalMulaiKegiatan: _revisiTanggalMulaiKegiatanController.text,
                                            revisiTanggalSelesaiKegiatan: _revisiTanggalSelesaiKegiatanController.text,
                                            revisiWaktuMulaiKegiatan: _revisiWaktuMulaiKegiatanController.text,
                                            revisiWaktuSelesaiKegiatan: _revisiWaktuSelesaiKegiatanController.text,
                                            revisiTanggalKeberangkatan: _revisiTanggalKeberangkatanController.text,
                                            revisiTanggalKepulangan: _revisiTanggalKepulanganController.text,
                                            revisiJumlahPartisipan: _revisiJumlahParsitipanController.text,
                                            revisiTargetKegiatan: _revisiTargetKegiatanController.text,
                                            revisiTotalPendanaan: _revisiTotalPendanaanController.text,
                                            revisiKeterangan: _revisiKeteranganController.text,
                                            revisiTandaTanganOrmawa: "",
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  text: 'Berikutnya',
                                ),
                              ],
                            ),
                          ],
                        );

                      } else if (state is UsulanKegiatanError) {
                        return Text(state.message);
                      } else {
                        print("UsulanKegiatanBloc hasn't been triggered yet");
                        return const SizedBox();
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
