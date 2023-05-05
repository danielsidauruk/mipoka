import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';

class MobilePenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const MobilePenggunaDaftarPengajuanKegiatan({Key? key}) : super(key: key);

  @override
  State<MobilePenggunaDaftarPengajuanKegiatan> createState() => _MobilePenggunaDaftarPengajuanKegiatanState();
}

class _MobilePenggunaDaftarPengajuanKegiatanState extends State<MobilePenggunaDaftarPengajuanKegiatan> {
  @override
  Widget build(BuildContext context) {

    const List<String> dropdownItem = ['Semua', 'Menunggu', 'Berlansung', 'Ditolak'];
    String dropDownValue = dropdownItem[0];

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

            const SizedBox(height: 4.0),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text(
                          'Status',
                          style: mobileSubTitle,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4.0),

                    Container(
                      width: double.infinity,
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: DropdownButton(
                        value: dropDownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        underline: const Center(),
                        onChanged: (String? value) {
                          setState(() => dropDownValue = value!);
                        },
                        items: dropdownItem
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            border: TableBorder.all(color: Colors.white),
                            //   columnWidths: {
                            //     0: FixedColumnWidth(40.0),
                            //     // 1: FixedColumnWidth(50.0),
                            //     // 2: FixedColumnWidth(50.0),
                            //   },
                            columns: const [
                              DataColumn(
                                label: Text('No.'),
                              ),
                              DataColumn(
                                label: Text('Tanggal Mengirim Usulan Kegiatan'),
                              ),
                              DataColumn(
                                label: Text('Nama Pengusul'),
                              ),
                              DataColumn(
                                label: Text('Nama Kegiatan'),
                              ),
                              DataColumn(
                                label: Text('Usulan Kegiatan'),
                              ),
                              DataColumn(
                                label: Text('Validasi Pembina'),
                              ),
                              DataColumn(
                                label: Text('Status'),
                              ),
                            ],

                            rows: List<DataRow>.generate(
                              12, (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('${index + 1}')),
                                  DataCell(Text('Age $index')),
                                  DataCell(Text('City $index')),
                                  DataCell(Text('Country $index')),
                                  DataCell(Text('Salary $index')),
                                  DataCell(Text('Position $index')),
                                  DataCell(Text('Department $index')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
