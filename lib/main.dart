import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
import 'package:mipoka/mipoka/presentation/pages/ganti_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahaiswaan_prestasi_mahasiswa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_edit_beranda_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_edit_ormawa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_edit_ormawa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_jenis_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_jenis_kegiatan_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_jenis_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_jenis_kegiatan_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_detail_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_prestasi_mahasiswa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/lupa_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/notifikasi_page.dart';
import 'package:mipoka/mipoka/presentation/pages/password_baru_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_daftar_pengajuan_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_2_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_laporan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_2_dk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_2_lk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pemeriksa/pemeriksa_pengajuan_usulan_kegiatan_3_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_berita_detail_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_mpt_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_mpt_unggah_bukti_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_ormawa_ukm_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_2_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_2_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_2_import_peserta_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk_data_peserta_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk_data_peserta_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_tertib_acara_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_prestasi_page.dart';
import 'mipoka/presentation/pages/login_page.dart';

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
          const LoginPage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {

          // mobile route
          case loginPageRoute:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case gantiPasswordPageRoute:
            return MaterialPageRoute(
                builder: (_) => const GantiPasswordPage());

          // mobile - pengguna  route
          case penggunaBerandaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaBerandaPage());
          case penggunaBerandaDetailPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaBerandaDetailPage());
          case lupaPasswordPageRoute:
            return MaterialPageRoute(
                builder: (_) => const LupaPasswordPage());
          case passwordBaruPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PasswordBaruPage());
          case notifikasiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const NotifikasiPage());

          case penggunaDaftarPengajuanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaDaftarPengajuanKegiatan());
          case penggunaPengajuanUsulanKegiatanPage1Route:
            return MaterialPageRoute(
                builder: (_) => const PenggunaPengajuanUsulanKegiatan1());
          case penggunaPengajuanUsulanKegiatan2LKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan2LK());
          case penggunaPengajuanUsulanKegiatan2LKDataPesertaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan2LKDataPeserta());
          case penggunaPengajuanUsulanKegiatan2DKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan2DK());
          case penggunaPengajuanUsulanKegiatan2DKDataPesertaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan2DKDataPeserta());
          case penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan2BiayaKegiatan());
          case penggunaPengajuanUsulanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaPengajuanUsulanKegiatan3());
          case penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan3TertibAcara());
          case penggunaPengajuanUsulanKegiatan3TertibAcaraTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanUsulanKegiatan3TertibAcaraTambah());

          case penggunaDaftarLaporanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaDaftarLaporanKegiatan());
          case penggunaPengajuanLaporanKegiatanPage1Route:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanLaporanKegiatan1());
          case penggunaPengajuanLaporanKegiatan2PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanLaporanKegiatan2());
          case penggunaPengajuanLaporanKegiatan2BiayaKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanLaporanKegiatan2BiayaKegiatan());
          case penggunaPengajuanLaporanKegiatan2ImportKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanLaporanKegiatan2ImportPeserta());
          case penggunaPengajuanLaporanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanLaporanKegiatan3());

          case penggunaDaftarPengajuanSaranaDanPrasaranaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaDaftarPengajuanSaranaDanPrasarana());
          case penggunaPengajuanSaranaDanPrasaranaPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PenggunaPengajuanSaranaDanPrasarana());

          case penggunaMPTPageRoute:
            return MaterialPageRoute(builder: (_) => const PenggunaMPTPage());
          case penggunaMPTUnggahBuktiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaMPTUnggahBuktiPage());

          case penggunaOrmawaUKMPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaOrmawaUKMPage());

          case penggunaPrestasiPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PenggunaPrestasiPage());

          // mobile - pemeriksa
          case pemeriksaDaftarUsulanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PemeriksaDaftarPengajuanKegiatanPage());
          case pemeriksaPengajuanUsulanKegiatan1PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanUsulanKegiatan1Page());

          case pemeriksaDaftarLaporanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const PemeriksaDaftarLaporanKegiatanPage());
          case pemeriksaPengajuanUsulanKegiatan2DKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanUsulanKegiatan2DKPage());
          case pemeriksaPengajuanUsulanKegiatan2LKPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanUsulanKegiatan2LKPage());
          case pemeriksaPengajuanUsulanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanUsulanKegiatan3Page());
          case pemeriksaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanUsulanKegiatan3TertibAcaraPage());
          case pemeriksaPengajuanLaporanKegiatan1PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanLaporanKegiatan1Page());
          case pemeriksaPengajuanLaporanKegiatan2PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanLaporanKegiatan2Page());
          case pemeriksaPengajuanLaporanKegiatan3PageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const PemeriksaPengajuanLaporanKegiatan3Page());

          // mobile - kemahasiswaan
          case kemahasiswaanBerandaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanBerandaPage());
          case kemahasiswaanEditBerandaTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanEditBerandaTambahPage());
          case kemahasiswaanMPTMahasiswaPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaPeriodePage());
          case kemahasiswaanMPTMahasiswaTambahPeriodePageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage());
          case kemahasiswaanMPTMahasiswaJenisKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaJenisKegiatanPage());
          case kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaJenisKegiatanTambahPage());
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
          case kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPage());
          case kemahasiswaanEditOrmawaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanEditOrmawaPage());
          case kemahasiswaanEditOrmawaTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanEditOrmawaTambahPage());
          case kemahasiswaanPrestasiMahasiswaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanPrestasiMahasiswaPage());
          case kemahasiswaanPrestasiMahasiswaTambahPageRoute:
            return MaterialPageRoute(
                builder: (_) =>
                    const KemahasiswaanPrestasiMahasiswaTambahPage());
          case kemahasiswaanCekUsulanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanCekUsulanKegiatanPage());
          case kemahasiswaanCekLaporanKegiatanPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanCekLaporanKegiatanPage());
          case kemahasiswaanCekSaranaDanPrasaranaPageRoute:
            return MaterialPageRoute(
                builder: (_) => const KemahasiswaanCekSaranaDanPrasaranaPage());
        }
      },
    );
  }
}