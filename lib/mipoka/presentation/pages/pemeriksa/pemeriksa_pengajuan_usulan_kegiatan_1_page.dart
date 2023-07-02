import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanUsulanKegiatan1Page extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan1Page({
    super.key,
    required this.idRevisiUsulan,
  });

  final int idRevisiUsulan;

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


  @override
  void initState() {
    context.read<RevisiUsulanBloc>().add(
      ReadRevisiUsulanEvent(idRevisiUsulan: widget.idRevisiUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    context.read<RevisiUsulanBloc>().close();
    context.read<OrmawaBloc>().close();
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              BlocBuilder<RevisiUsulanBloc, RevisiUsulanState>(
                builder: (context, state) {
                  if (state is RevisiUsulanLoading) {
                    return const Text("Loading ...");
                   } else if (state is RevisiUsulanHasData) {
                    final revisiUsulan = state.revisiUsulan;
                    context.read<UsulanKegiatanBloc>().add(
                        ReadUsulanKegiatanEvent(idUsulanKegiatan: revisiUsulan.idUsulan));

                    return BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                      builder: (context, state) {
                        if (state is UsulanKegiatanLoading) {
                          return const Text("Loading ....");
                        } else if (state is UsulanKegiatanHasData) {
                          final usulanKegiatan = state.usulanKegiatan;

                          context.read<OrmawaBloc>().add(
                              ReadOrmawaEvent(idOrmawa: usulanKegiatan.idOrmawa));

                          return CustomContentBox(
                            children: [
                              BlocBuilder<OrmawaBloc, OrmawaState>(
                                builder: (context, state) {
                                  if (state is OrmawaLoading) {
                                    return const Text("Loading ....");
                                  } else if (state is OrmawaHasData) {
                                    return CustomCommentWidget(
                                      title: 'Nama Ormawa',
                                      mainText: state.ormawa.namaOrmawa,
                                      controller: _commentNamaOrmawaController,
                                    );
                                  } else if (state is OrmawaError) {
                                    return Text(state.message);
                                  } else {
                                    return const Text("OrmawaBloc hasn't been triggered yet.");
                                  }
                                },
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
                                // mainText: 'Daring, Bakti Sosial',
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
                                // mainText: 'Luar Kota, Planet Mars',
                                // mainText: "${usulanKegiatan.kategoriTempatKegiatan}",
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
                                  // CustomButton(
                                  //   navigation: () => Navigator.pop(context),
                                  //   text: 'Kembali',
                                  // ),

                                  CustomMipokaButton(
                                    onTap: () {
                                      context.read<RevisiUsulanBloc>().add(
                                          DeleteRevisiUsulanEvent(idRevisiUsulan: widget.idRevisiUsulan));
                                      Navigator.pop(context);
                                    },
                                    text: 'Batal',
                                  ),

                                  const SizedBox(width: 8.0),

                                  CustomMipokaButton(
                                    onTap: () {
                                      context.read<RevisiUsulanBloc>().add(
                                        UpdateRevisiUsulanEvent(
                                          revisiUsulan: revisiUsulan.copyWith(
                                            revisiPembiayaan: _revisiPembiayaanController.text,
                                            revisiNamaKegiatan: _revisiNamaKegiatanController.text,
                                            revisiBentukKegiatan: _revisiBentukKegiatanController.text,
                                            // revisiKategoriBentukKegiatan: ,
                                            revisiTempatKegiatan: _revisiTempatKegiatanController.text,
                                            revisiDeskripsiKegiatan: _revisiDeskripsiKegiatanController.text,
                                            revisiTanggalMulaiKegiatan: _revisiTanggalMulaiKegiatanController.text,
                                            revisiTanggalSelesaiKegiatan: _revisiTanggalSelesaiKegiatanController.text,
                                            revisiWaktuMulaiKegiatan: _revisiWaktuMulaiKegiatanController.text,
                                            revisiWaktuSelesaiKegiatan: _revisiWaktuSelesaiKegiatanController.text,
                                            revisiTanggalKeberangkatan: _revisiTanggalKeberangkatanController.text,
                                            revisiTanggalKepulangan: _revisiTanggalKepulanganController.text,
                                            revisiJumlahPartisipan: _revisiJumlahParsitipanController.text,
                                            // revisiKategoriJumlahPartisipan: "",
                                            revisiTargetKegiatan: _revisiTargetKegiatanController.text,
                                            revisiTotalPendanaan: _revisiTotalPendanaanController.text,
                                            // revisiKategoriTotalPendanaan: ,
                                            revisiKeterangan: _revisiKeteranganController.text,
                                            // revisiTandaTanganOrmawa: "",
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          ),
                                        ),
                                      );

                                      // usulanKegiatan.tanggalKeberangkatan == "" ?
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   pemeriksaPengajuanUsulanKegiatan2DKPageRoute,
                                      //   arguments: widget.idRevisiUsulan,
                                      // ) :
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   pemeriksaPengajuanUsulanKegiatan2LKPageRoute,
                                      //   arguments: widget.idRevisiUsulan,
                                      // );

                                      Navigator.pushNamed(
                                        context,
                                        pemeriksaPengajuanUsulanKegiatan2DKPageRoute,
                                        arguments: widget.idRevisiUsulan,
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
                          return const Text(
                              "UsulanKegiatanBloc hasn't been triggered yet");
                        }
                      },
                    );
                  } else if (state is RevisiUsulanError) {
                    return Text("Revisi Usulan Error :${state.message}");
                  } else {
                    return const Text("RevisiUsulanBloc hasn't been triggered.");
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
