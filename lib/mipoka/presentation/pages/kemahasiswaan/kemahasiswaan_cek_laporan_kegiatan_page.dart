import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanCekLaporanKegiatanPage extends StatefulWidget {
  const KemahasiswaanCekLaporanKegiatanPage({super.key});

  @override
  State<KemahasiswaanCekLaporanKegiatanPage> createState() => _KemahasiswaanCekLaporanKegiatanPageState();
}

class _KemahasiswaanCekLaporanKegiatanPageState extends State<KemahasiswaanCekLaporanKegiatanPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LaporanBloc>(context, listen: false)
        .add(ReadAllLaporanEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: BlocBuilder<LaporanBloc, LaporanState>(
        builder: (context, state) {
          if (state is LaporanLoading) {
            return const Text('Loading');
          } else if (state is AllLaporanHasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomMobileTitle(
                      text: 'Pengajuan - Cek Laporan Kegiatan'),
                  const CustomFieldSpacer(),
                  Expanded(
                    child: CustomContentBox(
                      children: [
                        buildTitle('Status'),

                        MipokaCustomDropdown(
                          items: listStatus,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Total Laporan Kegiatan : 2'),

                        const CustomFieldSpacer(height: 4.0),

                        Expanded(
                          child: SingleChildScrollView(
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
                                      'Nama Kegiatan',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'File Proposal',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Validasi Pengguna',
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
                                rows: List<DataRow>.generate(12, (int index) {
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
                                          child: Text('${index + 1}2 Mei 2023',),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text('Kegiatan - ${index + 1}',),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/icons/pdf.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: index % 2 == 0 ?
                                          Image.asset(
                                            'assets/icons/approve.png',
                                            width: 24,
                                          ) :
                                          Image.asset(
                                            'assets/icons/close.png',
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 8.0,),

                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                'assets/icons/close.png',
                                                width: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LaporanError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}
