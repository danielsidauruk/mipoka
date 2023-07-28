import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/domain/utils/signature_dialog_utils.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_load_image.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaPengajuanUsulanKegiatan3Page extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan3Page({
    required this.idUsulan,
    super.key,
  });

  final int idUsulan;

  @override
  State<PemeriksaPengajuanUsulanKegiatan3Page> createState() =>
      _PemeriksaPengajuanUsulanKegiatan3PageState();
}

class _PemeriksaPengajuanUsulanKegiatan3PageState
    extends State<PemeriksaPengajuanUsulanKegiatan3Page> {

  @override
  void initState() {

    context.read<UsulanKegiatanBloc>().add(
      ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    _postinganKegiatanStream.close();
    _suratUndanganStream.close();
    _linimasaKegiatanStream.close();
    _fotoTempatKegiatanStream.close();

    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  final TextEditingController _latarBelakangController = TextEditingController();
  final TextEditingController _tujuanKegiatanController = TextEditingController();
  final TextEditingController _manfaatKegiatanController = TextEditingController();
  final TextEditingController _bentukPelaksanaanKegiatanController = TextEditingController();
  final TextEditingController _targetPencapaianKegiatanController = TextEditingController();
  final TextEditingController _waktuDanTempatPelaksanaanKegiatanController = TextEditingController();
  final TextEditingController _rencanaAnggaranKegiatanController = TextEditingController();
  final TextEditingController _perlengkapanDanPeralatanController = TextEditingController();
  final TextEditingController _penutupController = TextEditingController();
  final TextEditingController _tertibAcaraController = TextEditingController();
  final TextEditingController _postingKegiatanController = TextEditingController();
  final TextEditingController _suratUndanganController = TextEditingController();
  final TextEditingController _linimasaKegiatanController = TextEditingController();
  final TextEditingController _tempatKegiatanController = TextEditingController();

  final StreamController<bool> _postinganKegiatanStream = StreamController<bool>.broadcast();
  final StreamController<bool> _suratUndanganStream = StreamController<bool>.broadcast();
  final StreamController<bool> _linimasaKegiatanStream = StreamController<bool>.broadcast();
  final StreamController<bool> _fotoTempatKegiatanStream = StreamController<bool>.broadcast();

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

              BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                listenWhen: (prev, current) =>
                prev.runtimeType != current.runtimeType,
                listener: (context, state) async {
                  if (state is SaveReviseLastPageSuccess) {

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      pemeriksaDaftarUsulanKegiatanPageRoute,
                          (route) => false,
                    );

                  } else if (state is UsulanKegiatanError) {
                    mipokaCustomToast(state.message);
                  }
                },

                builder: (context, state) {
                  if (state is UsulanKegiatanLoading) {
                    return const Text("Loading ....");
                  } else if (state is UsulanKegiatanHasData) {
                    final usulanKegiatan = state.usulanKegiatan;

                    _latarBelakangController.text = usulanKegiatan.revisiUsulan?.revisiLatarBelakang ?? "";
                    _tujuanKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiTujuanKegiatan ?? "";
                    _manfaatKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiManfaatKegiatan ?? "";
                    _bentukPelaksanaanKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiBentukPelaksanaanKegiatan ?? "";
                    _targetPencapaianKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiTargetPencapaianKegiatan ?? "";
                    _waktuDanTempatPelaksanaanKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiWaktuDanTempatPelaksanaan ?? "";
                    _rencanaAnggaranKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiRencanaAnggaranKegiatan ?? "";
                    _perlengkapanDanPeralatanController.text = usulanKegiatan.revisiUsulan?.revisiPerlengkapanDanPeralatan ?? "";
                    _penutupController.text = usulanKegiatan.revisiUsulan?.revisiPenutup ?? "";
                    _tertibAcaraController.text = usulanKegiatan.revisiUsulan?.revisiIdTertibAcara ?? "";

                    return CustomContentBox(
                      children: [
                        CustomCommentWidget(
                          title: 'Latar Belakang',
                          mainText: usulanKegiatan.latarBelakang,
                          controller: _latarBelakangController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Tujuan Kegiatan',
                          mainText: usulanKegiatan.tujuanKegiatan,
                          controller: _tujuanKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Manfaat Kegiatan',
                          mainText: usulanKegiatan.manfaatKegiatan,
                          controller: _manfaatKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Bentuk Pelaksanaan Kegiatan',
                          mainText: usulanKegiatan.bentukPelaksanaanKegiatan,
                          controller: _bentukPelaksanaanKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Bentuk Pelaksanaan Kegiatan',
                          mainText: usulanKegiatan.bentukPelaksanaanKegiatan,
                          controller: _targetPencapaianKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Waktu dan Tempat Pelaksanaan',
                          mainText: usulanKegiatan.waktuDanTempatPelaksanaan,
                          controller: _waktuDanTempatPelaksanaanKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Rencana Anggaran Kegiatan',
                          mainText: usulanKegiatan.rencanaAnggaranKegiatan,
                          controller: _rencanaAnggaranKegiatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: "TertibAcara",
                          controller: _tertibAcaraController,
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columnSpacing: 40,
                              border: TableBorder.all(color: Colors.white),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'No.',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Aktivitas',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Waktu Mulai',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Waktu Selesai',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Keterangan',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(usulanKegiatan.tertibAcara.length, (int index) {
                                final tertibAcara = usulanKegiatan.tertibAcara[index];
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${index + 1}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            editTertibAcaraPageRoute,
                                            // arguments: usulanKegiatan,
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            tertibAcara.aktivitas,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          tertibAcara.waktuMulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          tertibAcara.waktuSelesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          tertibAcara.keterangan,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Perlengkapan dan Peralatan',
                          mainText:
                          usulanKegiatan.perlengkapanDanPeralatan,
                          controller: _perlengkapanDanPeralatanController,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentWidget(
                          title: 'Penutup',
                          mainText:
                          usulanKegiatan.penutup,
                          controller: _penutupController,
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(height: 4.0),

                        CustomCommentForTable(
                          title: "Postingan Kegiatan",
                          controller: _postingKegiatanController,
                        ),

                        MipokaCustomLoadImage(
                          stream: _postinganKegiatanStream,
                          imageUrl: usulanKegiatan.fotoPostinganKegiatan,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: "Surat Undangan Kegiatan",
                          controller: _suratUndanganController,
                        ),

                        MipokaCustomLoadImage(
                          stream: _suratUndanganStream,
                          imageUrl: usulanKegiatan.fotoSuratUndanganKegiatan,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: "Linimasa Kegiatan",
                          controller: _linimasaKegiatanController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _linimasaKegiatanStream,
                          imageUrl: usulanKegiatan.fotoLinimasaKegiatan,
                        ),

                        const CustomFieldSpacer(),

                        CustomCommentForTable(
                          title: "Tempat Kegiatan",
                          controller: _tempatKegiatanController,
                        ),
                        MipokaCustomLoadImage(
                          stream: _fotoTempatKegiatanStream,
                          imageUrl: usulanKegiatan.fotoTempatKegiatan,
                        ),

                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () {
                                // context.read<UsulanKegiatanBloc>().add(
                                //   SaveAndGoBackLastPageEvent(
                                //     usulanKegiatan: usulanKegiatan.copyWith(
                                //       revisiUsulan: usulanKegiatan.revisiUsulan?.copyWith(
                                //         revisiLatarBelakang: _latarBelakangController.text,
                                //         revisiTujuanKegiatan: _tujuanKegiatanController.text,
                                //         revisiManfaatKegiatan: _manfaatKegiatanController.text,
                                //         revisiBentukPelaksanaanKegiatan: _bentukPelaksanaanKegiatanController.text,
                                //         revisiTargetPencapaianKegiatan: _targetPencapaianKegiatanController.text,
                                //         revisiWaktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.text,
                                //         revisiRencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.text,
                                //         revisiPerlengkapanDanPeralatan: _perlengkapanDanPeralatanController.text,
                                //         revisiPenutup: _penutupController.text,
                                //         revisiIdTertibAcara: _tertibAcaraController.text,
                                //         updatedBy: user?.email ?? "unknown",
                                //         updatedAt: currentDate,
                                //       ),
                                //     ),
                                //   ),
                                // );
                                Navigator.pop(context);
                              },
                              text: "Kembali",
                            ),

                            const SizedBox(width: 8),

                            CustomMipokaButton(
                              onTap: () {
                                context.read<UsulanKegiatanBloc>().add(
                                  SaveReviseLastPageEvent(
                                    usulanKegiatan: usulanKegiatan.copyWith(
                                      revisiUsulan: usulanKegiatan.revisiUsulan?.copyWith(
                                        revisiLatarBelakang: _latarBelakangController.text,
                                        revisiTujuanKegiatan: _tujuanKegiatanController.text,
                                        revisiManfaatKegiatan: _manfaatKegiatanController.text,
                                        revisiBentukPelaksanaanKegiatan: _bentukPelaksanaanKegiatanController.text,
                                        revisiTargetPencapaianKegiatan: _targetPencapaianKegiatanController.text,
                                        revisiWaktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.text,
                                        revisiRencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.text,
                                        revisiPerlengkapanDanPeralatan: _perlengkapanDanPeralatanController.text,
                                        revisiPenutup: _penutupController.text,
                                        revisiIdTertibAcara: _tertibAcaraController.text,
                                        updatedBy: user?.email ?? "unknown",
                                        updatedAt: currentDate,
                                      ),
                                      statusUsulan: ditolak,
                                      validasiPembina: ditolak,
                                    ),
                                  ),
                                );

                                mipokaCustomToast("Revisi telah ditamnbahkan.");
                              },
                              text: 'Kirim Revisi',
                            ),
                          ],
                        ),

                        const CustomFieldSpacer(),

                        CustomMipokaButton(
                          onTap: () {
                            SignatureDialogUtils.showPopup(context, usulanKegiatan, isPop: false);
                          },
                          text: 'Terima',
                        ),
                      ],
                    );
                  } else if (state is UsulanKegiatanError) {
                    return Text(state.message);
                  } else {
                    return const Text("UsulanKegiatanBloc Page 3 hasn't been triggered yet.");
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
