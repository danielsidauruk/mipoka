import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/signature_dialog_session_utils.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanCekSaranaDanPrasaranaPage extends StatefulWidget {
  const KemahasiswaanCekSaranaDanPrasaranaPage({super.key});

  @override
  State<KemahasiswaanCekSaranaDanPrasaranaPage> createState() => _KemahasiswaanCekSaranaDanPrasaranaPageState();
}

class _KemahasiswaanCekSaranaDanPrasaranaPageState extends State<KemahasiswaanCekSaranaDanPrasaranaPage> {

  late String filter;

  @override
  void initState() {
    initializeDateFormatting('id_ID', null);

    context.read<SessionBloc>().add(const ReadAllSessionEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<SessionBloc>().close();
    context.read<MipokaUserBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<SessionBloc>().add(const ReadAllSessionEvent());
        },
      ),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Cek Sarana dan Prasarana'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  // buildTitle('Status'),
                  //
                  // MipokaCustomDropdown(
                  //   items: listStatus,
                  //   onValueChanged: (value) {
                  //     filter = value ?? filter;
                  //     context.read<SessionBloc>().add(ReadAllSessionEvent(filter: filter));
                  //   },
                  // ),
                  //
                  // const CustomFieldSpacer(),

                  BlocConsumer<SessionBloc, SessionState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is SessionSuccess ) {
                        context.read<SessionBloc>().add(const ReadAllSessionEvent());

                      } else if (state is SessionError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is SessionLoading) {
                        return const Text('Loading');
                      } else if (state is AllSessionHasData) {

                        final sessionList = state.sessionList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: sessionList.length),

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
                                        'Tanggal',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Pengajuan',
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
                                        'Hari/Tanggal',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Gedung/Ruang',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Lain-lain',
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
                                        'Aksi',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(sessionList.length, (int index) {
                                    final session = sessionList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('${index + 1}',),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(formatDateIndonesia(session.tanggalMulai)),
                                          ),
                                        ),
                                        DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(session.mipokaUser.namaLengkap),
                                            )
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(session.ormawa?.namaOrmawa ?? ""),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text("${DateFormat('EEEE', 'id_ID').format(DateFormat("dd-MM-yyyy")
                                                .parse(session.tanggalMulai))} / ${session.tanggalMulai}"),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text("${session.gedung}/${session.ruang}"),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(session.lainLain),
                                          ),
                                        ),

                                        DataCell(
                                          onTap: () => downloadFileWithDio(
                                            url: session.fileSession,
                                            fileName: getFileNameFromUrl(session.fileSession),
                                          ),
                                          session.fileSession.contains(".pdf") ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/pdf.png',
                                              width: 24,
                                            ),
                                          ) :
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/word.png',
                                              width: 24,
                                            ),
                                          )
                                        ),

                                        DataCell(
                                          session.status == tertunda ?
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  SignatureDialogUtils.showPopup(context, session);
                                                },
                                                child: Image.asset(
                                                  'assets/icons/approve.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0,),

                                              InkWell(
                                                onTap: () async {
                                                  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                                  User? user = FirebaseAuth.instance.currentUser;

                                                  if (context.mounted) {
                                                    int uniqueId = UniqueIdGenerator.generateUniqueId();
                                                    context.read<NotifikasiBloc>().add(
                                                      CreateNotifikasiEvent(
                                                        notifikasi: Notifikasi(
                                                          idNotifikasi: uniqueId,
                                                          teksNotifikasi: "Kemahasiswaan telah menolak Pengajuan Peminjaman Sarana & Prasarana yang diajukan oleh ${session.mipokaUser.namaLengkap}",
                                                          tglNotifikasi: DateTime.now().toString(),
                                                          createdAt: currentDate,
                                                          createdBy: user?.email ?? "unknown",
                                                          updatedAt: currentDate,
                                                          updatedBy: user?.email ?? "unknown",
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  await Future.delayed(const Duration(milliseconds: 500));
                                                  if (context.mounted) {
                                                    context.read<SessionBloc>().add(
                                                      UpdateSessionEvent(
                                                        session: session.copyWith(
                                                          status: ditolak,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  mipokaCustomToast("Sarana dan Prasarana ditolak.");
                                                },
                                                child: Image.asset(
                                                  'assets/icons/close.png',
                                                  width: 24,
                                                ),
                                              ),
                                            ],
                                          ) :
                                          session.status == disetujui ?
                                          Center(
                                            child: Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ),
                                          ) :
                                          Center(
                                            child: Image.asset(
                                              'assets/icons/close.png',
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
                          ],
                        );
                      } else if (state is SessionError) {
                        return Text(state.message);
                      } else {
                        print ("sessionBLoC hasn't been triggered yet.");
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
