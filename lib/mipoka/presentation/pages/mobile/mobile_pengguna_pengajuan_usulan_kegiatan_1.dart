import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';

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
  DateTime? tanggalMulaiKegiatan;
  DateTime? tanggalSelesaiKegiatan;
  TimeOfDay? waktuMulaiKegiatan;
  TimeOfDay? waktuSelesaiKegiatan;
  bool tempatKegiatan = false;
  DateTime? tanggalKeberangkatan;
  DateTime? tanggalKepulangan;
  bool jenisPartisipan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

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
                                setState(() => tanggalMulaiKegiatan = value);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tanggalMulaiKegiatan != null
                                    ? DateFormat('dd / MM / yyyy').format(tanggalMulaiKegiatan!)
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
                                setState(() => tanggalSelesaiKegiatan = value);
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tanggalSelesaiKegiatan != null
                                    ? DateFormat('dd / MM / yyyy').format(tanggalSelesaiKegiatan!)
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
                              setState(() => waktuMulaiKegiatan = value);
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
                                waktuMulaiKegiatan != null
                                    ? '${waktuMulaiKegiatan!.hour.toString().padLeft(2, '0')} : ${waktuMulaiKegiatan!.minute.toString().padLeft(2, '0')}'
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
                              setState(() => waktuSelesaiKegiatan = value);
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
                                waktuSelesaiKegiatan != null
                                    ? '${waktuSelesaiKegiatan!.hour.toString().padLeft(2, '0')} : ${waktuSelesaiKegiatan!.minute.toString().padLeft(2, '0')}'
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
                                      setState(() => tanggalKeberangkatan = value);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tanggalKeberangkatan != null
                                          ? DateFormat('dd / MM / yyyy').format(tanggalKeberangkatan!)
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
                                      setState(() => tanggalKepulangan = value);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tanggalKepulangan != null
                                          ? DateFormat('dd / MM / yyyy').format(tanggalKepulangan!)
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
                            buildTitle('Orang'),
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
                        navigation: () {
                          tempatKegiatan == false ?
                          Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2DKRoute) :
                          Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan2LKRoute);
                        },
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
}