import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class LaporanKegiatanTambahBiayaKegiatanPage extends StatefulWidget {
  const LaporanKegiatanTambahBiayaKegiatanPage({
    required this.laporan,
    super.key,
  });
  
  final Laporan laporan;

  @override
  State<LaporanKegiatanTambahBiayaKegiatanPage> createState() => _LaporanKegiatanTambahBiayaKegiatanPageState();
}

class _LaporanKegiatanTambahBiayaKegiatanPageState extends State<LaporanKegiatanTambahBiayaKegiatanPage> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitasController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _usulanAnggaranController = TextEditingController();
  final TextEditingController _realisasiAnggaranController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  customBoxTitle('Biaya Kegiatan'),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Biaya Kegiatan'),
                  CustomTextField(controller: _namaBiayaKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Kuantitas'),
                  CustomTextField(
                    controller: _kuantitasController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Harga Satuan'),
                  CustomTextField(
                    controller: _hargaSatuanController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Usulan Anggaran'),
                  CustomTextField(
                    controller: _usulanAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Realisasi Anggaran'),
                  CustomTextField(
                    controller: _realisasiAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),

                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: "Kembali",
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          if (_usulanAnggaranController.text.isNotEmpty && _realisasiAnggaranController.text.isNotEmpty &&
                              _namaBiayaKegiatanController.text.isNotEmpty && _keteranganController.text.isNotEmpty &&
                              _kuantitasController.text.isNotEmpty && _hargaSatuanController.text.isNotEmpty) {

                            try {
                              final usulanAnggaran = int.tryParse(_usulanAnggaranController.text);
                              final realisasiAnggaran = int.tryParse(_realisasiAnggaranController.text);
                              final kuantitas = int.tryParse(_kuantitasController.text);
                              final hargaSatuan = int.tryParse(_hargaSatuanController.text);

                              int? selisih;

                              if (usulanAnggaran != null && realisasiAnggaran != null
                                  && kuantitas != null && hargaSatuan != null) {

                                selisih = usulanAnggaran > realisasiAnggaran
                                    ? usulanAnggaran - realisasiAnggaran
                                    : realisasiAnggaran - usulanAnggaran;

                                String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                int uniqueId = UniqueIdGenerator.generateUniqueId();

                                print (
                                  RincianBiayaKegiatanModel.fromEntity(RincianBiayaKegiatan(
                                    idRincianBiayaKegiatan: uniqueId,
                                    // idRincianBiayaKegiatan: 23321,
                                    namaBiaya: _namaBiayaKegiatanController.text,
                                    keterangan: _keteranganController.text,
                                    kuantitas: kuantitas,
                                    hargaSatuan: hargaSatuan,
                                    usulanAnggaran: usulanAnggaran,
                                    realisasiAnggaran: realisasiAnggaran,
                                    selisih: selisih,
                                    laporan: "",
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                  )),
                                );

                                context.read<LaporanBloc>().add(
                                  UpdateRincianBiayaEvent(
                                    laporan: widget.laporan.copyWith(
                                      rincianBiayaKegiatan: [
                                        ...widget.laporan.rincianBiayaKegiatan,
                                        RincianBiayaKegiatan(
                                          idRincianBiayaKegiatan: uniqueId,
                                          // idRincianBiayaKegiatan: 2332132,
                                          namaBiaya: _namaBiayaKegiatanController.text,
                                          keterangan: _keteranganController.text,
                                          laporan: "-",
                                          kuantitas: kuantitas,
                                          hargaSatuan: hargaSatuan,
                                          usulanAnggaran: usulanAnggaran,
                                          realisasiAnggaran: realisasiAnggaran,
                                          selisih: selisih,
                                          createdAt: currentDate,
                                          createdBy: user?.email ?? "unknown",
                                          updatedAt: currentDate,
                                          updatedBy: user?.email ?? "unknown",
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                                // Navigator.pop(
                                //   context,
                                //   widget.laporan.copyWith(
                                //     rincianBiayaKegiatan: [
                                //       ...widget.laporan.rincianBiayaKegiatan,
                                //       RincianBiayaKegiatan(
                                //         idRincianBiayaKegiatan: uniqueId,
                                //         // idRincianBiayaKegiatan: 2332132,
                                //         namaBiaya: _namaBiayaKegiatanController.text,
                                //         keterangan: _keteranganController.text,
                                //         laporan: "-",
                                //         kuantitas: kuantitas,
                                //         hargaSatuan: hargaSatuan,
                                //         usulanAnggaran: usulanAnggaran,
                                //         realisasiAnggaran: realisasiAnggaran,
                                //         selisih: selisih,
                                //         createdAt: currentDate,
                                //         createdBy: user?.email ?? "unknown",
                                //         updatedAt: currentDate,
                                //         updatedBy: user?.email ?? "unknown",
                                //       ),
                                //     ],
                                //   ),
                                // );
                              }
                            } catch (e) {
                              mipokaCustomToast(dataTypeErrorMessage);
                            }
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Tambahkan Peserta',
                      ),

                      BlocListener<LaporanBloc, LaporanState>(
                        listenWhen: (prev, current) =>
                        prev.runtimeType != current.runtimeType,
                        listener: (context, state) {
                          if (state is UpdateRincianBiayaSuccess) {
                            Navigator.pop(context);
                          }
                        },
                        child: const SizedBox(),
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
