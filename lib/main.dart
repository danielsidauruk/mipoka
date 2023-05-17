import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_edit_beranda_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_jenis_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_jenis_kegiatan_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_jenis_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_jenis_kegiatan_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/ganti_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/lupa_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/notifikasi_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/password_baru_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_daftar_pengajuan_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_1.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_2_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_3.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_1.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_2_dk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_2_lk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_3_tertib_acara.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_berita_detail_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_daftar_pengajuan_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_daftar_pengajuan_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_mpt_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_mpt_unggah_bukti_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_ormawa_ukm_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_laporan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_laporan_kegiatan_2_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_laporan_kegiatan_2_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_laporan_kegiatan_2_import_peserta_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_laporan_kegiatan_3.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_sarana_dan_prasarana.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_1.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_2_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk_data_peserta.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk_data_peserta.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_3.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_3_tertib_acara.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_pengajuan_usulan_kegiatan_3_tertib_acara_tambah.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/pengguna_prestasi_page.dart';
import 'package:mipoka/mipoka/presentation/pages/web/web_pengguna_beranda_page.dart';
import 'mipoka/presentation/pages/mobile/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mipoka',
      theme: ThemeData(
        fontFamily: 'helvetica',
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 56, color: Colors.white),
          displayMedium: TextStyle(fontSize: 45, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 28, color: Colors.white),
          titleMedium: TextStyle(fontSize: 16, color: Colors.white),
          titleSmall: TextStyle(fontSize: 14, color: Colors.white),
          labelLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      home:
          // WebLoginPage(),
          const MobileLoginPage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          // web route
          case webPenggunaBerandaRoute:
            return MaterialPageRoute(
                builder: (_) => const WebPenggunaBerandaPage());

          // mobile route
          case loginPageRoute:
            return MaterialPageRoute(builder: (_) => const MobileLoginPage());
          case gantiPasswordPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobileGantiPasswordPage());

          // mobile - pengguna  route
          case penggunaBerandaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaBerandaPage());
          case penggunaBerandaDetailPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaBerandaDetailPage());
          case lupaPasswordPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobileLupaPasswordPage());
          case passwordBaruPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePasswordBaruPage());
          case notifikasiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobileNotifikasiPage());

          case penggunaDaftarPengajuanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaDaftarPengajuanKegiatan());
          case penggunaPengajuanUsulanKegiatanPage1Route:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan1());
          case penggunaPengajuanUsulanKegiatan2LKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan2LK());
          case penggunaPengajuanUsulanKegiatan2LKDataPesertaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta());
          case penggunaPengajuanUsulanKegiatan2DKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan2DK());
          case penggunaPengajuanUsulanKegiatan2DKDataPesertaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta());
          case penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan());
          case penggunaPengajuanUsulanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan3());
          case penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan3TertibAcara());
          case penggunaPengajuanUsulanKegiatan3TertibAcaraTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanUsulanKegiatan3TertibAcaraTambah());

          case penggunaDaftarLaporanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaDaftarLaporanKegiatan());
          case penggunaPengajuanLaporanKegiatanPage1Route:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanLaporanKegiatan1());
          case penggunaPengajuanLaporanKegiatan2PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanLaporanKegiatan2());
          case penggunaPengajuanLaporanKegiatan2BiayaKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanLaporanKegiatan2BiayaKegiatan());
          case penggunaPengajuanLaporanKegiatan2ImportKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta());
          case penggunaPengajuanLaporanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanLaporanKegiatan3());

          case penggunaDaftarPengajuanSaranaDanPrasaranaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaDaftarPengajuanSaranaDanPrasarana());
          case penggunaPengajuanSaranaDanPrasaranaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePenggunaPengajuanSaranaDanPrasarana());

          case penggunaMPTPageRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaMPT());
          case penggunaMPTUnggahBuktiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaMPTUnggahBukti());

          case penggunaOrmawaUKMPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaOrmawaUKMPage());

          case penggunaPrestasiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePenggunaPrestasiPage());

          // mobile - pemeriksa
          case pemeriksaDaftarUsulanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePemeriksaDaftarPengajuanKegiatan());
          case pemeriksaPengajuanUsulanKegiatan1PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanUsulanKegiatan1Page());

          case pemeriksaDaftarLaporanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobilePemeriksaDaftarLaporanKegiatan());
          case pemeriksaPengajuanUsulanKegiatan2DKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanUsulanKegiatan2DKPage());
          case pemeriksaPengajuanUsulanKegiatan2LKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanUsulanKegiatan2LK());
          case pemeriksaPengajuanUsulanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanUsulanKegiatan3Page());
          case pemeriksaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanUsulanKegiatan3TertibAcara());
          case pemeriksaPengajuanLaporanKegiatan1PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanLaporanKegiatan1Page());
          case pemeriksaPengajuanLaporanKegiatan2PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanLaporanKegiatan2Page());
          case pemeriksaPengajuanLaporanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobilePemeriksaPengajuanLaporanKegiatan3Page());

          // mobile - kemahasiswaan
          case kemahasiswaanBerandaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const MobileKemahasiswaanBerandaPage());
          case kemahasiswaanEditBerandaTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobileKemahasiswaanEditBerandaTambahPage());
          case kemahasiswaanMPTMahasiswaPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobileKemahasiswaanMPTMahasiswaPeriodePage());
          case kemahasiswaanMPTMahasiswaTambahPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage());
          case kemahasiswaanMPTMahasiswaJenisKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobileKemahasiswaanMPTMahasiswaJenisKegiatanPage());
          case kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const MobileKemahasiswaanMPTMahasiswaJenisKegiatanTambahPage());
          case kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPage());
          case kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage());
          case kemahasiswaanMPTMahasiswaKegiatanPerPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage());
          case kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage());
          case kemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage());
          case kemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage());
          case kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage());
          case kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage());
        }
      },
    );
  }
}

// Widget build(BuildContext context) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'Flutter Demo',
//     theme: ThemeData(
//       fontFamily: 'Roboto',
//       scaffoldBackgroundColor: Colors.black,
//       textTheme: const TextTheme(
//         displayLarge: TextStyle(fontSize: 56, color: Colors.white),
//         displayMedium: TextStyle(fontSize: 45, color: Colors.white),
//         bodyLarge: TextStyle(fontSize: 28, color: Colors.white),
//         titleMedium: TextStyle(fontSize: 16, color: Colors.white),
//         titleSmall: TextStyle(fontSize: 14, color: Colors.white),
//         labelLarge: TextStyle(
//           fontWeight: FontWeight.normal,
//           fontSize: 14,
//           color: Colors.white,
//         ),
//       ),
//       brightness: Brightness.dark,
//       primaryColor: Colors.black,
//       accentColor: Colors.white,
//       backgroundColor: Colors.black,
//       iconTheme: const IconThemeData(color: Colors.white),
//       inputDecorationTheme: const InputDecorationTheme(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//       ),
//     ),
//     // home: const MobileLoginPage(),
//     home: DesktopLoginPage(),
//   );
// }