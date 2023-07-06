import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const PenggunaDaftarPengajuanKegiatan({
    super.key,
  });

  @override
  State<PenggunaDaftarPengajuanKegiatan> createState() =>
      _PenggunaDaftarPengajuanKegiatanState();
}

class _PenggunaDaftarPengajuanKegiatanState
    extends State<PenggunaDaftarPengajuanKegiatan> {
  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
        builder: (context, state) {
          if (state is UsulanKegiatanLoading) {
            return const Text('Loading');
          } else if (state is AllUsulanKegiatanHasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomMobileTitle(
                      text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
                  const CustomFieldSpacer(),
                  CustomContentBox(
                    children: [
                      customBoxTitle('Status'),
                      const CustomFieldSpacer(height: 4.0),
                      MipokaCustomDropdown(
                        items: listStatus,
                        onValueChanged: (value) {
                          context.read<UsulanKegiatanBloc>().add(
                            ReadAllUsulanKegiatanEvent(filter: value!),
                          );
                        },
                      ),
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
                                  'Tanggal Mengirim Usulan Kegiatan',
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
                                  'Usulan Kegiatan',
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
                            rows: List<DataRow>.generate(
                                state.usulanKegiatanList.length, (int index) {
                              final usulanKegiatan =
                              state.usulanKegiatanList[index];

                              context.read<MipokaUserBloc>().add(
                                ReadMipokaUserEvent(idMipokaUser: usulanKegiatan.idUser),
                              );
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
                                      builder: (context, mipokaUserState) {
                                        if (mipokaUserState is MipokaUserLoading) {
                                          return const Text('Loading ...');
                                        } else if (mipokaUserState is MipokaUserHasData) {
                                          return Text(mipokaUserState.mipokaUser.namaLengkap);
                                        } else if (mipokaUserState is MipokaUserError) {
                                          return Text(mipokaUserState.message);
                                        } else {
                                          return const Text("MipokaUserBloc hasn't been triggered.");
                                        }
                                      },
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        usulanKegiatan.namaKegiatan,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/icons/word.png',
                                        width: 24,
                                      ),
                                    ),
                                    onTap: () => downloadFileWithDio(
                                      url: usulanKegiatan.fileUsulanKegiatan,
                                      fileName: "usulan_kegiatan_${toSnakeCase(usulanKegiatan.namaKegiatan)}.docx",
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        usulanKegiatan.validasiPembina,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        usulanKegiatan.statusUsulan,
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
                      
                      CustomMipokaButton(
                        onTap: () {
                          context.read<UsulanKegiatanBloc>().add(
                            CreateUsulanKegiatanEvent(
                              usulanKegiatan: UsulanKegiatan(
                                idUsulan: newId,
                                idUser: user?.uid ?? "unknown",
                                idOrmawa: 0,
                                pembiayaan: "",
                                namaKegiatan: "",
                                bentukKegiatan: "",
                                kategoriBentukKegiatan: "",
                                deskripsiKegiatan: "",
                                tanggalMulaiKegiatan: "",
                                tanggalSelesaiKegiatan: "",
                                waktuMulaiKegiatan: "",
                                waktuSelesaiKegiatan: "",
                                tempatKegiatan: "",
                                tanggalKeberangkatan: "",
                                tanggalKepulangan: "",
                                jumlahPartisipan: "",
                                kategoriJumlahPartisipan: "",
                                targetKegiatan: "",
                                totalPendanaan: "",
                                kategoriTotalPendanaan: "",
                                keterangan: "",
                                tandaTanganOrmawa: "",
                                partisipan: const [],
                                biayaKegiatan: const [],
                                totalBiaya: 0,
                                latarBelakang: "",
                                tujuanKegiatan: "",
                                manfaatKegiatan: "",
                                bentukPelaksanaanKegiatan: "",
                                targetPencapaianKegiatan: "",
                                waktuDanTempatPelaksanaan: "",
                                rencanaAnggaranKegiatan: "",
                                tertibAcara: const [],
                                perlengkapanDanPeralatan: "",
                                penutup: "",
                                fotoPostinganKegiatan: "",
                                fotoSuratUndanganKegiatan: "",
                                fotoLinimasaKegiatan: "",
                                fotoTempatKegiatan: "",
                                fileUsulanKegiatan: "",
                                validasiPembina: "",
                                tandaTanganPembina: "",
                                statusUsulan: "",
                                roles: "",
                                createdAt: currentDate,
                                updatedAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedBy: user?.email ?? "unknown",
                              ),
                            ),
                          );

                          Navigator.pushNamed(
                            context,
                            penggunaPengajuanUsulanKegiatanPage1Route,
                            arguments: newId,
                          );
                        },
                        text: 'Ajukan Kegiatan',
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is UsulanKegiatanError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}
