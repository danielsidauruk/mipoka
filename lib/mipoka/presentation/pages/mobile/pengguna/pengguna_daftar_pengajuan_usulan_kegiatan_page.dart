import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_web_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_web_dropdown_button.dart';

class MobilePenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const MobilePenggunaDaftarPengajuanKegiatan({super.key});

  @override
  State<MobilePenggunaDaftarPengajuanKegiatan> createState() =>
      _MobilePenggunaDaftarPengajuanKegiatanState();
}

class _MobilePenggunaDaftarPengajuanKegiatanState
    extends State<MobilePenggunaDaftarPengajuanKegiatan> {

  String dropDownValue = listStatus[0];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1024) {
      return buildWebPage(context);
    } else {
      return buildMobilePage(context);
    }
  }

  Scaffold buildWebPage(BuildContext context) {
    return Scaffold(
    appBar: const CustomMipokaWebAppBar(),
    drawer: const MobileCustomPenggunaDrawerWidget(),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomMobileTitle(
              text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
          const CustomFieldSpacer(),
          Expanded(
            child: CustomContentBox(
              children: [
                Row(
                  children: [
                    buildTitle(
                      'Status',
                      titlePadding: 0,
                    ),

                    const SizedBox(width: 8.0),

                    CustomWebDropdownButton(
                      items: listStatus,
                      value: dropDownValue,
                      onChanged: (String? value) {
                        setState(() => dropDownValue = value!);
                      },
                    ),
                  ],
                ),
                const CustomFieldSpacer(),
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
              ],
            ),
          ),
          const CustomFieldSpacer(),
          CustomButton(
            onTap: () => Navigator.pushNamed(
              context,
              penggunaPengajuanUsulanKegiatanPage1Route,
            ),
            text: 'Ajukan Kegiatan',
          ),
        ],
      ),
    ),
  );
  }

  Scaffold buildMobilePage(BuildContext context) {
    return Scaffold(
    appBar: const MipokaMobileAppBar(),
    drawer: const MobileCustomPenggunaDrawerWidget(),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomMobileTitle(
              text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
          const CustomFieldSpacer(),
          Expanded(
            child: CustomContentBox(
              children: [
                customBoxTitle('Status'),
                const SizedBox(height: 4.0),
                CustomDropdownButton(
                  items: listStatus,
                  value: dropDownValue,
                  onChanged: (String? value) {
                    setState(() => dropDownValue = value!);
                  },
                ),
                const CustomFieldSpacer(),
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
              ],
            ),
          ),
          const CustomFieldSpacer(),
          CustomButton(
            onTap: () => Navigator.pushNamed(
              context,
              penggunaPengajuanUsulanKegiatanPage1Route,
            ),
            text: 'Ajukan Kegiatan',
          ),
        ],
      ),
    ),
  );
  }
}
