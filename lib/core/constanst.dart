import 'dart:ui';
import 'package:flutter/material.dart';

const listStatus = ['Semua', 'Menunggu', 'Berlansung', 'Ditolak'];
const listNamaOrmawa = ['Ormawa A', 'Ormawa B', 'Ormawa C', 'Ormawa D', 'Ormawa E'];

const listNamaOrmawa2 = ['Semua', 'Ormawa A', 'Ormawa B', 'Ormawa C', 'Ormawa D', 'Ormawa E'];


const roleList = [kemahasiswaan, pembina, mahasiswa, mipokaAdmin];

const String kemahasiswaan = "Kemahasiswaan";
const String pembina = "Pembina";
const String mahasiswa = "Mahasiswa";
const String mipokaAdmin = "Admin";

const disetujui = "Disetujui";
const ditolak = "Ditolak";
const tertunda = "Tertunda";

const gedungList = ["A", "B", "C"];
const ruanganListA = ["P1.L2", "P2.L2", "P3.L2", "P1.L3", "P2.L3", "P3.L3", "P1.L4", "P2.L4", "P3.L4", "P4.L4", "Diklat.L5", "Kantin.L6"];
const ruanganListB = ["T1.L2", "T2.L2", "T3.L2", "T4.L2", "T5.L2", "T6.L2", "T1.L3", "T2.L3", "T3.L3", "T4.L3", "T5.L3", "T6.L3", "T1.L4",
  "T2.L4", "T3.L4", "T4.L4", "T5.L4", "T6.L4", "T1.L5", "T2.L5", "T3.L5", "T4.L5", "T5.L5", "T6.L5", "Rapat.L5", "Kantin.L6"];
const ruanganListC = ["T2.L2", "T3.L2", "T4.L2", "T5.L2", "T1.L3", "T2.L3", "T3.L3", "T4.L3", "T5.L3", "T6.L3", "T7.L3", "T8.L3", "T1.L4",
  "T2.L4", "T3.L4", "T4.L4", "T5.L4", "T6.L4", "T7.L4", "T8.L4", "Hall.L5", "UKM.L5"];


const listPembiayaan = ['Mandiri', 'Didanai'];
const listBentukKegiatan = ['Bakti Sosial', 'Festival', 'Kebaktian', 'Kompetisi', 'Latihan',
  'Loka Karya', 'Pelantikan', 'Perkumpulan', 'Pertunjukan', 'Rapat', 'Seminar', 'Turnamen'];

// const listNamaKegiatan = [
//   'Chou Starlight Tournament',
//   'Vexana Starlight Tournament - MEL Mar 2023 Vexana Starlight Tournament - MEL Mar 2023 Vexana Starlight Tournament - MEL Mar 2023',
//   'Yuzhong Starlight Tournament - MEL Mar 2023',
//   'Lancelot Starlight Tournament - MEL Mar 2023',
// ];

// const nimTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Fnim.xlsx?alt=media&token=1dab9dcc-615e-45b0-bf6b-b69efe35750c";
const nimTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Fnim.xlsx?alt=media&token=1dab9dcc-615e-45b0-bf6b-b69efe35750c";
const mhsPerPeriodeTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/mhs_per_periode_template.xlsx?alt=media&token=8430b6e0-4500-41a1-84d6-a88b8c868d31";
const riwayatKegiatanTemplate = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/riwayat_kegiatan_template.xlsx?alt=media&token=1628cb15-f8b1-4d68-9390-5a50ef98e72f";

const String apiUrl = 'https://oafish-eggnog-production.up.railway.app';

const statusUsulan = ["Semua", disetujui, ditolak, tertunda];

Color revisionColor = const Color(0xFFE57373);

const String emptyFieldMessage = "Mohon lengkapi semua field.";
const String refreshMessage = 'Memperbarui Halaman';
const String logoutMessage = "Anda telah keluar";

String emptyFieldPrompt(String field) => "Mohon isi field $field.";
String dataTypeFalsePrompt(String field) => "Mohon masukkan angka pada field $field.";

const String dataTypeErrorMessage = "Harap lengkapi data dengan tipe yang sesuai.";
const String savingDataMessage = "Sedang menyimpan data ...";

const listTingkat = ['Desa/Kelurahan', 'Kecamatan', 'Kabupaten/Kota', 'Provinsi', 'Nasional', 'Internasional'];

const listTingkat2 = ['Semua', 'Desa/Kelurahan', 'Kecamatan', 'Kabupaten/Kota', 'Provinsi', 'Nasional', 'Internasional'];

const years2 = ['Semua', "2023", "2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014"];
const periodeYears = ["2030", "2029", "2028", "2027", "2026", "2025", "2024", "2023", "2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014"];

final List<String> years = List.generate(10, (index) =>
    (DateTime.now().year - index).toString(),
);

const listProdi = ['Teknik Informatika', 'Manajemen', 'Akuntansi', 'Sistem Informasi'];
const listJumlahPoint = ['Semua', '<= 100', '> 100 <= 200', '> 200',];

// int newId = DateTime.now().microsecondsSinceEpoch;
// int newId = UniqueIdGenerator.generateUniqueId();
// User? user = FirebaseAuth.instance.currentUser;
// String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
// int randomId = Random().nextInt(9999999);