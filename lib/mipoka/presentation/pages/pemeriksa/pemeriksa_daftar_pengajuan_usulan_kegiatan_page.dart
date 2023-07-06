import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PemeriksaDaftarPengajuanKegiatanPage extends StatefulWidget {
  const PemeriksaDaftarPengajuanKegiatanPage({super.key});

  @override
  State<PemeriksaDaftarPengajuanKegiatanPage> createState() => _PemeriksaDaftarPengajuanKegiatanPageState();
}

class _PemeriksaDaftarPengajuanKegiatanPageState extends State<PemeriksaDaftarPengajuanKegiatanPage> {
  String? filter;

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Verifikasi Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  customBoxTitle('Status'),

                  const CustomFieldSpacer(height: 4.0),

                  MipokaCustomDropdown(
                    items: listStatus,
                    onValueChanged: (value) {
                      filter = value;

                      context.read<UsulanKegiatanBloc>().add(
                          ReadAllUsulanKegiatanEvent(filter: value ?? "semua"));
                    },
                  ),

                  const CustomFieldSpacer(),

                  BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllUsulanKegiatanHasData) {
                        final usulanKegiatanList = state.usulanKegiatanList;

                        return Column(
                          children: [
                            MipokaCountText(total: usulanKegiatanList.length),

                            const CustomFieldSpacer(),

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
                                        'Tanggal Mengirim\nUsulan Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Pengusul',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'File Usulan Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Validasi Pembina',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(usulanKegiatanList.length, (int index) {
                                    final usulanKegiatan = usulanKegiatanList[index];

                                    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: usulanKegiatan.idUser));

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${index + 1}',
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.createdAt,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                            builder: (context, state) {
                                              if (state is MipokaUserLoading) {
                                                return const Text("Loading ....");
                                              } else if (state is MipokaUserHasData) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    state.mipokaUser.namaLengkap,
                                                  ),
                                                );
                                              } else if (state is MipokaUserError) {
                                                return Text(state.message);
                                              } else {
                                                return const Text("MipokaUserBloc hasn't triggered yet.");
                                              }
                                            },
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.namaKegiatan,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            int idUsulanUsulan = int.parse(
                                                usulanKegiatan.idUsulan.toString() +
                                                    newId.toString());

                                            Future.microtask(() {
                                              Navigator.pushNamed(
                                                context,
                                                pemeriksaPengajuanUsulanKegiatan1PageRoute,
                                                arguments: idUsulanUsulan,
                                              );
                                              
                                              context.read<RevisiUsulanBloc>().add(
                                                CreateRevisiUsulanEvent(
                                                  revisiUsulan: RevisiUsulan(
                                                    idRevisiUsulan: idUsulanUsulan,
                                                    idAdmin: user?.uid ?? "unknown",
                                                    idUsulan: usulanKegiatan.idUsulan,
                                                    revisiPembiayaan: "",
                                                    revisiNamaKegiatan: "",
                                                    revisiBentukKegiatan: "",
                                                    revisiKategoriBentukKegiatan: "",
                                                    revisiDeskripsiKegiatan: "",
                                                    revisiTempatKegiatan: "",
                                                    revisiTanggalMulaiKegiatan: "",
                                                    revisiTanggalSelesaiKegiatan: "",
                                                    revisiWaktuMulaiKegiatan: "",
                                                    revisiWaktuSelesaiKegiatan: "",
                                                    revisiTanggalKeberangkatan: "",
                                                    revisiTanggalKepulangan: "",
                                                    revisiJumlahPartisipan: "",
                                                    revisiKategoriJumlahPartisipan: "",
                                                    revisiTargetKegiatan: "",
                                                    revisiTotalPendanaan: "",
                                                    revisiKategoriTotalPendanaan: "",
                                                    revisiKeterangan: "",
                                                    revisiTandaTanganOrmawa: "",
                                                    revisiPartisipan: "",
                                                    revisiRincianBiayaKegiatan: "",
                                                    revisiLatarBelakang: "",
                                                    revisiTujuanKegiatan: "",
                                                    revisiManfaatKegiatan: "",
                                                    revisiBentukPelaksanaanKegiatan: "",
                                                    revisiTargetPencapaianKegiatan: "",
                                                    revisiWaktuDanTempatPelaksanaan: "",
                                                    revisiRencanaAnggaranKegiatan: "",
                                                    revisiIdTertibAcara: "",
                                                    revisiPerlengkapanDanPeralatan: "",
                                                    revisiPenutup: "",
                                                    revisiFotoPostinganKegiatan: "",
                                                    revisiFotoSuratUndanganKegiatan: "",
                                                    revisiFotoLinimasaKegiatan: "",
                                                    revisiFotoTempatKegiatan: "",
                                                    createdAt: currentDate,
                                                    createdBy: user?.email ?? "unknown",
                                                    updatedAt: currentDate,
                                                    updatedBy: user?.email ?? "unknown",
                                                  ),
                                                ),
                                              );
                                            });

                                          },
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/word.png',
                                              width: 24,
                                            ),
                                          ),
                                          onTap: () {
                                            downloadFileWithDio(
                                              url: usulanKegiatan.fileUsulanKegiatan,
                                              fileName: "usulan_kegiatan_${toSnakeCase(usulanKegiatan.namaKegiatan)}.docx",
                                            );
                                          },
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () => Future.microtask(() {
                                                    showPop(context, usulanKegiatan);
                                                    context.read<UsulanKegiatanBloc>().add(
                                                        ReadAllUsulanKegiatanEvent(filter: filter ?? "semua"));
                                                  }),
                                                  child: Image.asset(
                                                    'assets/icons/approve.png',
                                                    width: 24,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () => Future.microtask(() {
                                                    context.read<UsulanKegiatanBloc>().add(
                                                      UpdateUsulanKegiatanEvent(
                                                        usulanKegiatan: usulanKegiatan.copyWith(
                                                          validasiPembina: "ditolak",
                                                        ),
                                                      ),
                                                    );
                                                    context.read<UsulanKegiatanBloc>().add(
                                                        ReadAllUsulanKegiatanEvent(filter: filter ?? "semua"));
                                                    mipokaCustomToast("Usulan Kegiatan telah ditolak");
                                                  }),
                                                  child: Image.asset(
                                                    'assets/icons/close.png',
                                                    width: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(usulanKegiatan.statusUsulan),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),

                          ],
                        );
                      } else if (state is UsulanKegiatanError) {
                        return Text(state.message);
                      } else {
                        return const Text ("UsulanKegiatanBloc hasn't been triggered yet");
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showPop(BuildContext context, UsulanKegiatan usulanKegiatan) {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey<SfSignaturePadState>();
  String signatureUrl = "";

  Future<File> saveSignature() async {
    final image = await signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);
    final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/signature.png');
    await file.writeAsBytes(bytes!);

    return file;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Tanda Tangan Pembina"),
          content: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  const CustomFieldSpacer(height: 4.0),
                  SfSignaturePad(
                    key: signatureGlobalKey,
                    backgroundColor: Colors.white,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 1.0,
                    maximumStrokeWidth: 4.0,
                  ),
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          final file = await saveSignature();
                          signatureUrl = await uploadFileFromSignature(
                            file,
                            "signature_${user?.uid ?? "unknown"}_$newId",
                          );
                          Future.microtask(() {
                            context.read<UsulanKegiatanBloc>().add(
                              UpdateUsulanKegiatanEvent(
                                usulanKegiatan: usulanKegiatan.copyWith(
                                  tandaTanganPembina: signatureUrl,
                                  validasiPembina: "diterima",
                                ),
                              ),
                            );
                            mipokaCustomToast("Usulan Kegiatan telah diterima");
                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          signatureUrl = "";
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Batal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
  );
}
