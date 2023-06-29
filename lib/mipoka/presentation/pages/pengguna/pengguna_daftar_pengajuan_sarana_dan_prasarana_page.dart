import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaDaftarPengajuanSaranaDanPrasarana extends StatefulWidget {
  const PenggunaDaftarPengajuanSaranaDanPrasarana({super.key});

  @override
  State<PenggunaDaftarPengajuanSaranaDanPrasarana> createState() => _PenggunaDaftarPengajuanSaranaDanPrasaranaState();
}

class _PenggunaDaftarPengajuanSaranaDanPrasaranaState extends State<PenggunaDaftarPengajuanSaranaDanPrasarana> {

  @override
  void initState() {
    BlocProvider.of<SessionBloc>(context, listen: false)
        .add(const ReadAllSessionEvent());
    super.initState();
  }
  
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
                                        session.idUser,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        session.idOrmawa.toString(),
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
                                    InkWell(
                                      onTap: () => {},
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/icons/word.png',
                                          width: 24,
                                        ),
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

                      // CustomButton(
                      //   navigation: () => Navigator.pushNamed(
                      //     context,
                      //     penggunaPengajuanUsulanKegiatanPage1Route,
                      //   ),
                      //   text: 'Ajukan Peminjaman Sarana dan Prasarana',
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              int newId = DateTime.now().microsecondsSinceEpoch;
                              User? user = FirebaseAuth.instance.currentUser;
                              String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                              context.read<SessionBloc>().add(
                                CreateSessionEvent(
                                  session: Session(
                                    idSession: newId,
                                    idUser: user?.uid ?? "unknown",
                                    idOrmawa: 0,
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
                                    updatedAt: currentDate,
                                    createdAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                    createdBy: user?.email ?? "unknown",
                                  ),
                                ),
                              );

                              Navigator.pushNamed(
                                context,
                                penggunaPengajuanSaranaDanPrasaranaPageRoute,
                                arguments: newId,
                              );
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
                  return const Text('IDK');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
