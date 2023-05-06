import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';

class MobilePenggunaPengajuanUsulanKegiatan2LK extends StatelessWidget {
  const MobilePenggunaPengajuanUsulanKegiatan2LK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'MIPOKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 0.5,
            color: Colors.white,
          ),
        ),
      ),

      drawer: const MobilePenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Pengajuan - Kegiatan - Usulan Kegiatan',
                      style: mobileTitle,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Data Peserta Kegiatan (Luar Kota)'),

                      const SizedBox(height: 4.0),

                      InkWell(
                        onTap: () => Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(minHeight: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  'Data Partisipan',
                                  style: TextStyle(
                                      color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
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
                                      'NIM/NIP',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Nama Lengkap',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'NIK',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Tempat/Tanggal Lahir',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Peran',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Dasar Pengiriman',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],

                                rows: List<DataRow>.generate(12, (int index) {
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '${index + 1}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          'Age $index',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(Text('City $index')),
                                      DataCell(Text('Country $index')),
                                      DataCell(Text('Salary $index')),
                                      DataCell(Text('Position $index')),
                                      DataCell(Text('Department $index')),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Rincian Biaya Kegiatan'),

                      const SizedBox(height: 4.0),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(minHeight: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  'Biaya Kegiatan',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
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
                                            'Nama Biaya',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Qty',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Harga Satuan',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Total',
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

                                      rows: List.generate(12, (int index) {
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                '${index + 1}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                'Age $index sahjksadfkjh ajdshkjahdf hdjkashjkhad ajkdshfkja fadfk ah',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            DataCell(Text('City $index')),
                                            DataCell(Text('Country $index')),
                                            DataCell(Text('Salary $index')),
                                            DataCell(Text('Position $index')),
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
                      ),

                      const SizedBox(height: 8.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Button(
                            navigation: () => Navigator.pop(context),
                            text: 'Sebelumnya',
                          ),

                          const SizedBox(width: 8.0),

                          Button(
                            navigation: () {},
                            text: 'Berikutnya',
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}