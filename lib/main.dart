import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
import 'package:mipoka/dependency_injection.dart' as di;
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/admin_bloc/admin_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_mpt_bloc/kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_mpt_bloc/riwayat_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/ganti_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_prestasi_mahasiswa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_update_berita.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_cek_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
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
import 'package:mipoka/mipoka/presentation/pages/pengguna/edit_data_peserta_dalam_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/edit_data_peserta_luar_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/edit_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/laporan_kegiatan_edit_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_berita_detail_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_laporan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_mpt_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_mpt_unggah_bukti_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_ormawa_ukm_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_2_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/laporan_kegiatan_tambah_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/import_peserta_laporan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_laporan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_sarana_dan_prasarana_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_1_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/usulan_kegiatan_edit_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/usulan_kegiatan_tambah_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/tambah_data_peserta_dalam_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/tambah_data_peserta_luar_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/tambah_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_prestasi_page.dart';
import 'package:mipoka/mipoka/presentation/pages/register_page.dart';
import 'firebase_options.dart';
import 'mipoka/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AdminBloc>()),
        BlocProvider(create: (_) => di.locator<BeritaBloc>()),
        BlocProvider(create: (_) => di.locator<BiayaKegiatanBloc>()),
        BlocProvider(create: (_) => di.locator<KegiatanMptBloc>()),
        BlocProvider(create: (_) => di.locator<LaporanBloc>()),
        BlocProvider(create: (_) => di.locator<MipokaUserBloc>()),
        BlocProvider(create: (_) => di.locator<OrmawaBloc>()),
        BlocProvider(create: (_) => di.locator<PartisipanBloc>()),
        BlocProvider(create: (_) => di.locator<PeriodeMptBloc>()),
        BlocProvider(create: (_) => di.locator<PesertaKegiatanLaporanBloc>()),
        BlocProvider(create: (_) => di.locator<PrestasiBloc>()),
        BlocProvider(create: (_) => di.locator<RevisiLaporanBloc>()),
        BlocProvider(create: (_) => di.locator<RevisiUsulanBloc>()),
        BlocProvider(create: (_) => di.locator<RincianBiayaKegiatanBloc>()),
        BlocProvider(create: (_) => di.locator<RiwayatMptBloc>()),
        BlocProvider(create: (_) => di.locator<SessionBloc>()),
        BlocProvider(create: (_) => di.locator<TertibAcaraBloc>()),
        BlocProvider(create: (_) => di.locator<UsulanKegiatanBloc>()),
      ],
      child: MaterialApp(
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
          hintColor: Colors.white,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        home: user?.email == ""
            ? const LoginPage()
            : const PenggunaBerandaPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            // route
            case loginPageRoute:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case registrationPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const RegistrationPage());
            case gantiPasswordPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const GantiPasswordPage());

            // pengguna  route
            case penggunaBerandaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PenggunaBerandaPage());
            case penggunaBerandaDetailPageRoute:
              final berita = settings.arguments as Berita;
              return MaterialPageRoute(
                  builder: (_) => PenggunaBerandaDetailPage(berita: berita),
                  settings: settings);
            case lupaPasswordPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const LupaPasswordPage());
            case passwordBaruPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PasswordBaruPage());
            case notifikasiPageRoute:
              return MaterialPageRoute(builder: (_) => const NotifikasiPage());

            case penggunaDaftarPengajuanKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PenggunaDaftarPengajuanKegiatan());
            case penggunaPengajuanUsulanKegiatanPage1Route:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => PenggunaPengajuanUsulanKegiatan1(
                    idUsulanKegiatan: idUsulanKegiatan),
                settings: settings,
              );
            case penggunaPengajuanUsulanKegiatan2LKPageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanUsulanKegiatan2LK(
                      idUsulanKegiatan: idUsulanKegiatan
                  ));
            case tambahDataPesertaLuarKotaPageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TambahDataPesertaLuarKotaPage(
                    idUsulanKegiatan: idUsulanKegiatan),
              );
            case editDataPesertaLuarKotaPageRoute:
              final partisipanArgs = settings.arguments as PartisipanArgs;
              return MaterialPageRoute(
                builder: (_) => EditDataPesertaLuarKotaPage(partisipanArgs: partisipanArgs),
              );
            case penggunaPengajuanUsulanKegiatan2DKPageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => PenggunaPengajuanUsulanKegiatan2DK(
                    idUsulanKegiatan: idUsulanKegiatan),
              );
            case tambahDataPesertaDalamKotaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const TambahDataPesertaDalamKota());
            case editDataPesertaDalamKotaPageRoute:
              final partisipanArgs = settings.arguments as PartisipanArgs;
              return MaterialPageRoute(
                builder: (_) => EditDataPesertaDalamKota(
                  multipleArgs: partisipanArgs,
                ),
              );
            case penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => UsulanKegiatanTambahBiayaKegiatanPage(idUsulanKegiatan: idUsulanKegiatan),
              );
            case usulanKegiatanEditBiayaKegiatanPageRoute:
              final biayaKegiatanArgs = settings.arguments as BiayaKegiatanArgs;
              return MaterialPageRoute(
                builder: (_) => UsulanKegiatanEditBiayaKegiatanPage(biayaKegiatanArgs: biayaKegiatanArgs),
              );
            case penggunaPengajuanUsulanKegiatan3PageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanUsulanKegiatan3(
                    idUsulanKegiatan: idUsulanKegiatan,));
            // case penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            //   final idUsulanKegiatan = settings.arguments as int;
            //   return MaterialPageRoute(
            //       builder: (_) =>
            //           PenggunaPengajuanUsulanKegiatan3TertibAcara(idUsulanKegiatan: idUsulanKegiatan));
            case tambahTertibAcaraPageRoute:
              final idUsulanKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => TambahTertibAcaraPage(idUsulanKegiatan: idUsulanKegiatan));
            case editTertibAcaraPageRoute:
              final usulanKegiatan = settings.arguments as UsulanKegiatan;
              return MaterialPageRoute(
                  builder: (_) => EditTertibAcaraPage(usulanKegiatan: usulanKegiatan));

            case penggunaDaftarLaporanKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PenggunaDaftarLaporanKegiatan());
            case penggunaPengajuanLaporanKegiatanPage1Route:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan1(idLaporan: idLaporan));
            case penggunaPengajuanLaporanKegiatan2PageRoute:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan2(idLaporan: idLaporan));
            case laporanKegiatanTambahBiayaKegiatanPageRoute:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      LaporanKegiatanTambahBiayaKegiatanPage(idLaporan: idLaporan));
            case laporanKegiatanEditBiayaKegiatanPageRoute:
              final rincianBiayaKegiatan = settings.arguments as RincianBiayaKegiatan;
              return MaterialPageRoute(
                  builder: (_) =>
                      LaporanKegiatanEditBiayaKegiatanPage(rincianBiayaLaporan: rincianBiayaKegiatan));
            case importPesertaLaporanPageRoute:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      ImportPesertaLaporanPage(idLaporan: idLaporan));
            case penggunaPengajuanLaporanKegiatan3PageRoute:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan3(idLaporan: idLaporan));

            case penggunaDaftarPengajuanSaranaDanPrasaranaPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const PenggunaDaftarPengajuanSaranaDanPrasarana());
            case penggunaPengajuanSaranaDanPrasaranaPageRoute:
              final idSession = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanSaranaDanPrasarana(idSession: idSession));

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

            // kemahasiswaan
            case kemahasiswaanBerandaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanBerandaPage());
            case kemahasiswaanBerandaTambahBeritaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanBerandaBeritaPage());
            case kemahasiswaanBerandaUpdateBeritaPageRoute:
              final berita = settings.arguments as Berita;

              return MaterialPageRoute(
                  builder: (_) =>
                      KemahasiswaanBerandaUpdateBeritaPage(berita: berita),
                  settings: settings);
            case kemahasiswaanMPTMahasiswaPeriodePageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanMPTMahasiswaPeriodePage());
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
                  builder: (_) =>
                      const KemahasiswaanCekSaranaDanPrasaranaPage());
            default:
              return MaterialPageRoute(builder: (_) => const Center());
          }
        },
      ),
    );
  }
}
