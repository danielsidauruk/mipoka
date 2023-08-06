import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:intl/date_symbol_data_local.dart';

class PenggunaDaftarPengajuanSaranaDanPrasarana extends StatefulWidget {
  const PenggunaDaftarPengajuanSaranaDanPrasarana({super.key});

  @override
  State<PenggunaDaftarPengajuanSaranaDanPrasarana> createState() => _PenggunaDaftarPengajuanSaranaDanPrasaranaState();
}

class _PenggunaDaftarPengajuanSaranaDanPrasaranaState extends State<PenggunaDaftarPengajuanSaranaDanPrasarana> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    initializeDateFormatting('id_ID', null);

    context.read<SessionBloc>().add(const ReadAllSessionEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    context.read<SessionBloc>().close();
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<SessionBloc>().add(const ReadAllSessionEvent());
          context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(text: 'Pengajuan - Sarana & Prasarana'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocConsumer<SessionBloc, SessionState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SessionSuccess) {
                        context.read<SessionBloc>().add(
                            const ReadAllSessionEvent());
                      } else if (state is SessionError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is SessionLoading) {
                        return const Text('Loading');
                      } else if (state is AllSessionHasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                            child: Text("${DateFormat('EEEE', 'id_ID').format(DateFormat("dd-MM-yyyy")
                                                .parse(session.tanggalMulai))} / ${formatDateIndonesia(session.tanggalMulai)}"),
                                          ),
                                        ),

                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text("${session.gedung} / ${session.ruang}"),
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
                                            fileName: getFileNameFromUrl(session.fileSession),
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
                                          session.status == disetujui ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ),
                                          )
                                              :
                                          session.status == ditolak ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ),
                                          ) :
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/time.png',
                                              width: 24,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final result = await Navigator.pushNamed(
                                      context,
                                      penggunaPengajuanSaranaDanPrasaranaPageRoute,
                                    );

                                    if (result is Session && context.mounted) {
                                      context.read<SessionBloc>().add(
                                          CreateSessionEvent(session: result));
                                    }
                                  },
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
                              ],
                            ),
                          ],
                        );
                      } else if (state is SessionError) {
                        return const Text('Error');
                      } else {
                        print("AllSessionBLoC event hasnt been triggered yet.");
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



