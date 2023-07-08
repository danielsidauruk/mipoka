import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

const listStatus = ['Semua', 'Menunggu', 'Berlansung', 'Ditolak'];
const listNamaOrmawa = ['Ormawa A', 'Ormawa B', 'Ormawa C', 'Ormawa D', 'Ormawa E'];

const listNamaOrmawa2 = ['Semua', 'Ormawa A', 'Ormawa B', 'Ormawa C', 'Ormawa D', 'Ormawa E'];


const listGedung = ['A', 'B', 'C', 'D'];
const listPembiayaan = ['Mandiri', 'Didanai'];
const listBentukKegiatan = ['Bakti Sosial', 'Festival', 'Kebaktian', 'Kompetisi', 'Latihan',
  'Loka Karya', 'Pelantikan', 'Perkumpulan', 'Pertunjukan', 'Rapat', 'Seminar', 'Turnamen'];

const listNamaKegiatan = [
  'Chou Starlight Tournament',
  'Vexana Starlight Tournament - MEL Mar 2023 Vexana Starlight Tournament - MEL Mar 2023 Vexana Starlight Tournament - MEL Mar 2023',
  'Yuzhong Starlight Tournament - MEL Mar 2023',
  'Lancelot Starlight Tournament - MEL Mar 2023',
];

const pesertaKegiatanTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/peserta_kegiatan_template.xlsx?alt=media&token=7d0b701b-e387-494b-99e6-31e5a8743efe";
const mhsPerPeriodeTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/mhs_per_periode_template.xlsx?alt=media&token=8430b6e0-4500-41a1-84d6-a88b8c868d31";
const riwayatKegiatanTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/riwayat_kegiatan_template.xlsx?alt=media&token=1628cb15-f8b1-4d68-9390-5a50ef98e72f";

const String emptyFieldMessage = "Mohon lengkapi semua field.";
const String dataTypeErrorMessage = "Harap lengkapi data dengan tipe yang sesuai.";

const listTingkat = ['Desa/Kelurahan', 'Kecamatan', 'Kabupaten/Kota', 'Provinsi', 'Nasional', 'Internasional'];

const listTingkat2 = ['Semua', 'Desa/Kelurahan', 'Kecamatan', 'Kabupaten/Kota', 'Provinsi', 'Nasional', 'Internasional'];

const years2 = ['Semua', "2023", "2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014"];
const periodeYears = ["2030", "2029", "2028", "2027", "2026", "2025", "2024", "2023", "2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014"];

final List<String> years = List.generate(10, (index) =>
    (DateTime.now().year - index).toString(),
);

const listProdi = ['semua', 'Teknik Informatika', 'Manajemen', 'Akuntansi', 'Sistem Informatika'];

int newId = DateTime.now().microsecondsSinceEpoch;
User? user = FirebaseAuth.instance.currentUser;
String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
int randomId = Random().nextInt(9999999);