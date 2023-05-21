import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class MobileKemahasiswaanBerandaPage extends StatefulWidget {
  const MobileKemahasiswaanBerandaPage({super.key});

  @override
  State<MobileKemahasiswaanBerandaPage> createState() =>
      _MobileKemahasiswaanBerandaPageState();
}

class _MobileKemahasiswaanBerandaPageState
    extends State<MobileKemahasiswaanBerandaPage> {
  String dropDownValue = listStatus[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Placeholder(
                fallbackHeight: 170,
              ),
              const CustomFieldSpacer(height: 4.0),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const CustomFieldSpacer(),
              const CustomMobileTitle(text: 'Kemahasiswaan - Edit Beranda'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Total Berita : 2'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(
                        context, kemahasiswaanEditBerandaTambahPageRoute),
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Penulis'),
                  CustomDropdownButton(
                    items: listStatus,
                    onValueChanged: (value) {},
                  ),
                  const CustomFieldSpacer(),
                  Container(
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
                                'Tanggal Diterbitkan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Judul Berita',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Penulis',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              tooltip: 'Aksi yang akan dilakukan',
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
                                    child: Text(
                                      '${index + 1} maret 2023',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Berita ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Penulis ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit,
                                            color: Colors.yellow),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
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
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildBeritaTile() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, penggunaBerandaDetailPageRoute),
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 4.0),
            const Expanded(
              flex: 3,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur '
                'adipiscing elit, sed do eiusmod tempor incididunt '
                'ut labore et dolore ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
