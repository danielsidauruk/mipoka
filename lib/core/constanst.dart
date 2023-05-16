const dropdownItem = ['Semua', 'Menunggu', 'Berlansung', 'Ditolak'];
const listNamaOrmawa = ['Ormawa A', 'Ormawa B', 'Ormawa C', 'Ormawa D', 'Ormawa E'];
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

const tingkatList = ['Desa/Kelurahan', 'Kecamatan', 'Kabupaten/Kota', 'Provinsi', 'Nasional', 'Internasional'];

final List<String> years = List.generate(10, (index) =>
    (DateTime.now().year - index).toString(),
);