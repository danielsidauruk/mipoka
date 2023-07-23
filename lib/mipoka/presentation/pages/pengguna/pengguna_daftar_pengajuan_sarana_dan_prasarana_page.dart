import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaDaftarPengajuanSaranaDanPrasarana extends StatefulWidget {
  const PenggunaDaftarPengajuanSaranaDanPrasarana({super.key});

  @override
  State<PenggunaDaftarPengajuanSaranaDanPrasarana> createState() => _PenggunaDaftarPengajuanSaranaDanPrasaranaState();
}

class _PenggunaDaftarPengajuanSaranaDanPrasaranaState extends State<PenggunaDaftarPengajuanSaranaDanPrasarana> {

  @override
  void initState() {
    context.read<SessionBloc>().add(const ReadAllSessionEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? "")
    );
    super.initState();
  }

  @override
  void dispose() {
    context.read<SessionBloc>().close();
    context.read<MipokaUserBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  int uniqueId = UniqueIdGenerator.generateUniqueId();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomMobileTitle(text: 'Pengajuan - Sarana & Prasarana'),
            const CustomFieldSpacer(),
            BlocBuilder<SessionBloc, SessionState>(
              builder: (context, state) {
                if (state is SessionLoading) {
                  return const Text('Loading');
                } else if (state is AllSessionHasData) {
                  return CustomContentBox(
                    children: [
                      customBoxTitle('Status'),

                      const CustomFieldSpacer(height: 4.0),

                      MipokaCustomDropdown(
                        items: listStatus,
                        onValueChanged: (value) {
                          context.read<SessionBloc>().add(
                            ReadAllSessionEvent(filter: value!)
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
                                  'Tanggal Pengajuan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nama Pengaju',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nama Ormawa',
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
                                  'Hari/tanggal',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Ruang/Gedung',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Lain - lain',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Pengajuan',
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
                            rows: List<DataRow>.generate(state.sessionList.length, (int index) {
                              final session = state.sessionList[index];
                              
                              // context.read<MipokaUserBloc>().add(
                              //   ReadMipokaUserEvent(idMipokaUser: session.idUser)
                              // );
                              // context.read<OrmawaBloc>().add(
                              //     ReadOrmawaEvent(idOrmawa: session.idOrmawa));
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
                                        session.createdAt,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.mipokaUser.namaLengkap,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.ormawa?.namaOrmawa ?? "",
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.kegiatan,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          session.tanggalMulai
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.gedung,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.lainLain
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    onTap: () => downloadFileWithDio(
                                      url: session.fileSession,
                                      fileName: "session_${session.idSession}",
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/icons/word.png',
                                        width: 24,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.status,
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

                      BlocBuilder<MipokaUserBloc, MipokaUserState>(
                        builder: (context, mipokaUserState) {
                          if (mipokaUserState is MipokaUserLoading) {
                            return const Text('Loading ...');
                          } else if (mipokaUserState is MipokaUserHasData) {
                            MipokaUser mipokaUser = mipokaUserState.mipokaUser;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () => context.read<SessionBloc>().add(
                                    CreateSessionEvent(
                                      session: Session(
                                        idSession: uniqueId,
                                        mipokaUser: mipokaUser,
                                        ormawa: mipokaUser.ormawa[0],
                                        tanggalMulai: "",
                                        tanggalSelesai: "",
                                        ruangan: "",
                                        gedung: "",
                                        waktuMulaiPenggunaan: "",
                                        waktuSelesaiPenggunaan: "",
                                        kegiatan: "",
                                        proyektor: 0,
                                        laptop: 0,
                                        mikrofon: 0,
                                        speaker: 0,
                                        meja: 0,
                                        kursi: 0,
                                        papanTulis: 0,
                                        spidol: 0,
                                        lainLain: "",
                                        status: "",
                                        keterangan: "",
                                        fileSession: "",
                                        updatedAt: currentDate,
                                        createdAt: currentDate,
                                        updatedBy: mipokaUser.email,
                                        createdBy: mipokaUser.email,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 24),
                                    constraints: BoxConstraints(
                                      minHeight: 35.0,
                                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Text(
                                      'Ajukan Peminjaman Sarana dan Prasarana',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                  ),
                                ),

                                // BlocListener<SessionBloc, SessionState>(
                                //   listenWhen: (prev, current) =>
                                //   prev.runtimeType != current.runtimeType,
                                //   listener: (context, state) {
                                //     if (state is SessionSuccess) {
                                //
                                //     } else if (state is SessionError) {
                                //       mipokaCustomToast(state.message);
                                //     }
                                //   },
                                //   child: const SizedBox(),
                                // ),
                              ],
                            );
                          }
                          else if (mipokaUserState is MipokaUserError) {
                            return Text(mipokaUserState.message);
                          } else {
                            return const Text("MipokaUserBloc hasn't been triggered.");
                          }
                        },
                      ),
                    ],
                  );
                } else if (state is SessionSuccess) {
                  Navigator.pushNamed(
                    context,
                    penggunaPengajuanSaranaDanPrasaranaPageRoute,
                    arguments: uniqueId,
                  ).then((_) => context.read<SessionBloc>().add(const ReadAllSessionEvent()));

                  return const SizedBox();
                } else if (state is SessionError) {
                  return const Text('Error');
                } else {
                  return const Text('');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}



