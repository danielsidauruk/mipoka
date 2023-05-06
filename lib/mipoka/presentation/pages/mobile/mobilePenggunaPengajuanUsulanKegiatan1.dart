import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';

import '../../widgets/button.dart';

class MobilePenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan1({super.key});

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan1> createState() => _MobilePenggunaPengajuanUsulanKegiatan1State();
}

class _MobilePenggunaPengajuanUsulanKegiatan1State extends State<MobilePenggunaPengajuanUsulanKegiatan1> {

  String ormawaDropDownValue = listNamaOrmawa[0];
  String pembiayaanDropDownValue = listPembiayaan[0];
  bool bentukKegiatanValue = false;
  String bentukKegiatanDropDownValue = listBentukKegiatan[0];
  DateTime? selectedTanggalMulaiKegiatan;
  DateTime? selectedTanggalSelesaiKegiatan;
  TimeOfDay? selectedWaktuMulaiKegiatan;
  TimeOfDay? selectedWaktuSelesaiKegiatan;
  bool tempatKegiatan = false;
  DateTime? selectedTanggalKeberangkatan;
  DateTime? selectedTanggalKepulangan;
  bool jenisPartisipan = false;

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

      body: SingleChildScrollView(
        child: Padding(
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

                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Nama Ormawa'),

                      const SizedBox(height: 4.0),

                      Container(
                        width: double.infinity,
                        height: 35,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.white)
                        ),
                        child: DropdownButton(
                          value: ormawaDropDownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          underline: const Center(),
                          onChanged: (String? value) {
                            setState(() => ormawaDropDownValue = value!);
                          },
                          items: listNamaOrmawa
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Pembiayaan'),

                      const SizedBox(height: 4.0),

                      Container(
                        width: double.infinity,
                        height: 35,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.white)
                        ),
                        child: DropdownButton(
                          value: pembiayaanDropDownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          underline: const Center(),
                          onChanged: (String? value) {
                            setState(() => pembiayaanDropDownValue = value!);
                          },
                          items: listPembiayaan
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Nama Kegiatan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      Row(
                        children: [
                          buildTitle('Bentuk Kegiatan'),
                          
                          const SizedBox(width: 4.0),

                          Switch(
                            value: bentukKegiatanValue,
                            onChanged: (bool newValue) {
                              setState(() => bentukKegiatanValue = newValue);
                            },
                          ),

                          const SizedBox(width: 4.0),

                          bentukKegiatanValue == false ?
                          buildTitle('Daring') :
                          buildTitle('Luring'),
                        ],
                      ),

                      Container(
                        width: double.infinity,
                        height: 35,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.white)
                        ),
                        child: DropdownButton(
                          value: bentukKegiatanDropDownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          underline: const Center(),
                          onChanged: (String? value) {
                            setState(() => bentukKegiatanDropDownValue = value!);
                          },
                          items: listBentukKegiatan
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 8.0),
                      
                      buildTitle('Deskripsi Kegiatan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Tanggal Mulai Kegiatan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        // height: 35,
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1000),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              if (value != null) {
                                setState(() => selectedTanggalMulaiKegiatan = value);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedTanggalMulaiKegiatan != null
                                    ? DateFormat('dd / MM / yyyy').format(selectedTanggalMulaiKegiatan!)
                                    : '',
                              ),

                              const Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Tanggal Selesai Kegiatan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        // height: 35,
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1000),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              if (value != null) {
                                setState(() => selectedTanggalSelesaiKegiatan = value);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedTanggalSelesaiKegiatan != null
                                    ? DateFormat('dd / MM / yyyy').format(selectedTanggalSelesaiKegiatan!)
                                    : '',
                              ),

                              const Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Waktu Mulai Kegiatan'),

                      const SizedBox(height: 4.0),

                      InkWell(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            if (value != null) {
                              setState(() => selectedWaktuMulaiKegiatan = value);
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          constraints: const BoxConstraints(minHeight: 35.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedWaktuMulaiKegiatan != null
                                    ? '${selectedWaktuMulaiKegiatan!.hour.toString().padLeft(2, '0')} : ${selectedWaktuMulaiKegiatan!.minute.toString().padLeft(2, '0')}'
                                    : '',
                              ),

                              const Icon(
                                Icons.access_time,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Waktu Selesai Kegiatan'),

                      const SizedBox(height: 4.0),

                      InkWell(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            if (value != null) {
                              setState(() => selectedWaktuSelesaiKegiatan = value);
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          constraints: const BoxConstraints(minHeight: 35.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedWaktuSelesaiKegiatan != null
                                    ? '${selectedWaktuSelesaiKegiatan!.hour.toString().padLeft(2, '0')} : ${selectedWaktuSelesaiKegiatan!.minute.toString().padLeft(2, '0')}'
                                    : '',
                              ),

                              const Icon(
                                Icons.access_time,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          buildTitle('Tempat Kegiatan Kegiatan'),

                          const SizedBox(width: 4.0),

                          Switch(
                            value: tempatKegiatan,
                            onChanged: (bool newValue) {
                              setState(() => tempatKegiatan = newValue);
                            },
                          ),

                          const SizedBox(width: 4.0),

                          Expanded(
                            child: tempatKegiatan == false ?
                              buildTitle('Dalam Kota') :
                              buildTitle('Luar Kota'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      tempatKegiatan != false ?
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle('Tanggal Keberangkatan'),

                            const SizedBox(height: 4.0),

                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8.0),
                              // height: 35,
                              constraints: const BoxConstraints(minHeight: 35.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.white),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1000),
                                    lastDate: DateTime(2100),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() => selectedTanggalKeberangkatan = value);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedTanggalKeberangkatan != null
                                          ? DateFormat('dd / MM / yyyy').format(selectedTanggalKeberangkatan!)
                                          : '',
                                    ),

                                    const Icon(
                                      Icons.calendar_month_sharp,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            buildTitle('Tanggal Kepulangan'),

                            const SizedBox(height: 4.0),

                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8.0),
                              // height: 35,
                              constraints: const BoxConstraints(minHeight: 35.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.white),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1000),
                                    lastDate: DateTime(2100),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() => selectedTanggalKepulangan = value);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedTanggalKepulangan != null
                                          ? DateFormat('dd / MM / yyyy').format(selectedTanggalKepulangan!)
                                          : '',
                                    ),

                                    const Icon(
                                      Icons.calendar_month_sharp,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) :

                      const Center(),

                      const SizedBox(height: 8.0),

                      Row(
                        children: [
                          buildTitle('Jumlah Parsitipan'),

                          const SizedBox(width: 4.0),

                          Switch(
                            value: jenisPartisipan,
                            onChanged: (bool newValue) {
                              setState(() => jenisPartisipan = newValue);
                            },
                          ),

                          const SizedBox(width: 4.0),

                          Expanded(
                            child: jenisPartisipan == false ?
                            buildTitle('Tim') :
                            buildTitle('Perorangan'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Target Kegiatan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Total Pendanaan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Keterangan'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          maxLines: null,
                          onChanged: (query) {},
                          style: const TextStyle(),
                          decoration: null,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      buildTitle('Tanda Tangan Ormawa'),

                      const SizedBox(height: 4.0),

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(minHeight: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.upload,
                            size: 20,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      Button(
                        navigation: () {},
                        text: 'Berikutnya',
                      )
                    ],
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }

  Text buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
