import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
import 'package:mipoka/dependency_injection.dart' as di;
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/admin_bloc/admin_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_drop_down_bloc/jenis_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_drop_down_bloc/ormawa_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/ganti_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_edit_ormawa_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_jenis_kegiatan_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_jenis_kegiatan_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_kegiatan_per_periode_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_periode_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_edit_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_prestasi_mahasiswa_edit_page.dart';
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
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_mahasiswa_per_periode_tambah_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_periode_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_mpt_mahasiswa_riwayat_kegiatan_mahasiswa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_prestasi_mahasiswa_page.dart';
import 'package:mipoka/mipoka/presentation/pages/lupa_password_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mipoka_admin_dashboard.dart';
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
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_tertib_acara_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/usulan_kegiatan_edit_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/usulan_kegiatan_tambah_biaya_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_dk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/tambah_data_peserta_dalam_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_2_lk_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_daftar_pengajuan_usulan_kegiatan_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/tambah_data_peserta_luar_kota_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_page.dart';
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
        BlocProvider(create: (_) => di.locator<JenisKegiatanMptBloc>()),
        BlocProvider(create: (_) => di.locator<KegiatanPerPeriodeMptBloc>()),
        BlocProvider(create: (_) => di.locator<LaporanBloc>()),
        BlocProvider(create: (_) => di.locator<MipokaUserBloc>()),
        BlocProvider(create: (_) => di.locator<MipokaUserByNimBloc>()),
        BlocProvider(create: (_) => di.locator<OrmawaBloc>()),
        BlocProvider(create: (_) => di.locator<PartisipanBloc>()),
        BlocProvider(create: (_) => di.locator<PeriodeMptBloc>()),
        BlocProvider(create: (_) => di.locator<PesertaKegiatanLaporanBloc>()),
        BlocProvider(create: (_) => di.locator<PrestasiBloc>()),
        BlocProvider(create: (_) => di.locator<RevisiLaporanBloc>()),
        BlocProvider(create: (_) => di.locator<RevisiUsulanBloc>()),
        BlocProvider(create: (_) => di.locator<RincianBiayaKegiatanBloc>()),
        BlocProvider(create: (_) => di.locator<RiwayatKegiatanMptBloc>()),
        BlocProvider(create: (_) => di.locator<SessionBloc>()),
        BlocProvider(create: (_) => di.locator<TertibAcaraBloc>()),
        BlocProvider(create: (_) => di.locator<UsulanKegiatanBloc>()),
        BlocProvider(create: (_) => di.locator<MhsPerPeriodeMptBloc>()),
        BlocProvider(create: (_) => di.locator<NamaKegiatanMptBloc>()),
        BlocProvider(create: (_) => di.locator<NotifikasiBloc>()),
        BlocProvider(create: (_) => di.locator<PeriodeMptDropDownBloc>()),
        BlocProvider(create: (_) => di.locator<NamaKegiatanDropDownBloc>()),
        BlocProvider(create: (_) => di.locator<JenisKegiatanDropDownBloc>()),
        BlocProvider(create: (_) => di.locator<OrmawaDropDownBloc>()),
      ],
      child: MaterialApp(
        // initialRoute: loginPageRoute,
        // routes: "/",
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
        home:
        user != null ?
        // BlocBuilder<MipokaUserBloc, MipokaUserState>(
        //   builder: (context, state) {
        //     if (state is MipokaUserHasData) {
        //       final mipokaUser = state.mipokaUser;
        //
        //       if (mipokaUser.role == kemahasiswaan) {
        //         return const KemahasiswaanBerandaPage();
        //       } else if (mipokaUser.role == pembina) {
        //         return const PemeriksaDaftarPengajuanKegiatanPage();
        //       } else if (mipokaUser.role == mipokaAdmin) {
        //         return const MipokaAdminDashboard();
        //       } else {
        //         return const PenggunaBerandaPage();
        //       }
        //     } else {
        //       return const LoginPage();
        //     }
        //   },
        // ) :
        const KemahasiswaanBerandaPage() :
        const LoginPage(),
        // : const PemeriksaDaftarLaporanKegiatanPage(),
        // : const PenggunaBerandaPage(),
        // : const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage(),
        // :const KemahasiswaanMPTMahasiswaPeriodePage(),

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
            case mipokaAdminDashboardRoute:
              return MaterialPageRoute(
                  builder: (_) => const MipokaAdminDashboard());

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
              final usulanArgs = settings.arguments as UsulanArgs;
              return MaterialPageRoute(
                builder: (_) => PenggunaPengajuanUsulanKegiatan1(usulanArgs: usulanArgs),
                settings: settings,
              );
            case penggunaPengajuanUsulanKegiatan2LKPageRoute:
              final usulanArgs = settings.arguments as UsulanArgs;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanUsulanKegiatan2LK(
                      usulanArgs: usulanArgs
                  ));
            case tambahDataPesertaLuarKotaPageRoute:
              final usulanKegiatan = settings.arguments as UsulanKegiatan;
              return MaterialPageRoute(
                builder: (_) => TambahDataPesertaLuarKotaPage(
                    usulanKegiatan: usulanKegiatan),
              );
            case editDataPesertaLuarKotaPageRoute:
              final partisipanArgs = settings.arguments as PartisipanArgs;
              return MaterialPageRoute(
                builder: (_) => EditDataPesertaLuarKotaPage(partisipanArgs: partisipanArgs),
              );
            case penggunaPengajuanUsulanKegiatan2DKPageRoute:
              final usulanArgs = settings.arguments as UsulanArgs;
              return MaterialPageRoute(
                builder: (_) => PenggunaPengajuanUsulanKegiatan2DK(
                    usulanArgs: usulanArgs),
              );
            case tambahDataPesertaDalamKotaPageRoute:
              final usulanKegiatan = settings.arguments as UsulanKegiatan;
              return MaterialPageRoute(
                  builder: (_) => TambahDataPesertaDalamKota(usulanKegiatan: usulanKegiatan));
            case editDataPesertaDalamKotaPageRoute:
              final partisipanArgs = settings.arguments as PartisipanArgs;
              return MaterialPageRoute(
                builder: (_) => EditDataPesertaDalamKota(
                  partisipanArgs: partisipanArgs,
                ),
              );
            case penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute:
              final usulanKegiatan = settings.arguments as UsulanKegiatan;
              return MaterialPageRoute(
                builder: (_) => UsulanKegiatanTambahBiayaKegiatanPage(usulanKegiatan: usulanKegiatan),
              );
            case usulanKegiatanEditBiayaKegiatanPageRoute:
              final biayaKegiatanArgs = settings.arguments as BiayaKegiatanArgs;
              return MaterialPageRoute(
                builder: (_) => UsulanKegiatanEditBiayaKegiatanPage(biayaKegiatanArgs: biayaKegiatanArgs),
              );
            case penggunaPengajuanUsulanKegiatanTertibAcaraRoute:
              final usulanArgs = settings.arguments as UsulanArgs;
              return MaterialPageRoute(builder: (_) =>
                  PenggunaPengajuanUsulanKegiatanTertibAcara(usulanArgs: usulanArgs));
            case penggunaPengajuanUsulanKegiatan3PageRoute:
              final usulanArgs = settings.arguments as UsulanArgs;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanUsulanKegiatan3(
                    usulanArgs: usulanArgs));
            // case penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute:
            //   final idUsulanKegiatan = settings.arguments as int;
            //   return MaterialPageRoute(
            //       builder: (_) =>
            //           PenggunaPengajuanUsulanKegiatan3TertibAcara(idUsulanKegiatan: idUsulanKegiatan));
            case tambahTertibAcaraPageRoute:
              final usulanKegiatan = settings.arguments as UsulanKegiatan;
              return MaterialPageRoute(
                  builder: (_) => TambahTertibAcaraPage(usulanKegiatan: usulanKegiatan));
            case editTertibAcaraPageRoute:
              final tertibAcaraArgs = settings.arguments as TertibAcaraArgs;
              return MaterialPageRoute(
                  builder: (_) => EditTertibAcaraPage(tertibAcaraArgs: tertibAcaraArgs));

            case penggunaDaftarLaporanKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PenggunaDaftarLaporanKegiatan());
            case penggunaPengajuanLaporanKegiatanPage1Route:
              final laporanArgs = settings.arguments as LaporanArgs;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan1(laporanArgs: laporanArgs));
            case penggunaPengajuanLaporanKegiatan2PageRoute:
              final laporanArgs = settings.arguments as LaporanArgs;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan2(laporanArgs: laporanArgs));
            case laporanKegiatanTambahBiayaKegiatanPageRoute:
              final laporan = settings.arguments as Laporan;
              return MaterialPageRoute(
                  builder: (_) =>
                      LaporanKegiatanTambahBiayaKegiatanPage(laporan: laporan));
            case laporanKegiatanEditBiayaKegiatanPageRoute:
              final rincianBiayaKegiatan = settings.arguments as RincianBiayaKegiatan;
              return MaterialPageRoute(
                  builder: (_) =>
                      LaporanKegiatanEditBiayaKegiatanPage(rincianBiayaLaporan: rincianBiayaKegiatan));
            case importPesertaLaporanPageRoute:
              final laporan = settings.arguments as Laporan;
              return MaterialPageRoute(
                  builder: (_) =>
                      ImportPesertaLaporanPage(laporan: laporan));
            case penggunaPengajuanLaporanKegiatan3PageRoute:
              final laporanArgs = settings.arguments as LaporanArgs;
              return MaterialPageRoute(
                  builder: (_) => PenggunaPengajuanLaporanKegiatan3(laporanArgs: laporanArgs));

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
              final kegiatanPerPeriodeMpt = settings.arguments as KegiatanPerPeriodeMpt;
              return MaterialPageRoute(
                  builder: (_) => PenggunaMPTUnggahBuktiPage(kegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt));

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
              final idRevisiUsulan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanUsulanKegiatan1Page(idUsulan: idRevisiUsulan));

            case pemeriksaDaftarLaporanKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const PemeriksaDaftarLaporanKegiatanPage());
            case pemeriksaPengajuanUsulanKegiatan2DKPageRoute:
              final idRevisiUsulan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanUsulanKegiatan2DKPage(idUsulan: idRevisiUsulan));
            case pemeriksaPengajuanUsulanKegiatan2LKPageRoute:
              final idRevisiUsulan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanUsulanKegiatan2LKPage(idUsulan: idRevisiUsulan));
            case pemeriksaPengajuanUsulanKegiatan3PageRoute:
              final idRevisiUsulan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanUsulanKegiatan3Page(idUsulan: idRevisiUsulan));
            case pemeriksaPengajuanLaporanKegiatan1PageRoute:
              final idLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanLaporanKegiatan1Page(idLaporan: idLaporan));
            case pemeriksaPengajuanLaporanKegiatan2PageRoute:
              final idRevisiLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanLaporanKegiatan2Page(idLaporan: idRevisiLaporan));
            case pemeriksaPengajuanLaporanKegiatan3PageRoute:
              final idRevisiLaporan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) =>
                      PemeriksaPengajuanLaporanKegiatan3Page(idLaporan: idRevisiLaporan));

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
                      const KemahasiswaanMPTMahasiswaPeriodeTambahPage());
            case kemahasiswaanMPTMahasiswaPeriodeEditPageRoute:
              final periodeMpt = settings.arguments as PeriodeMpt;
              return MaterialPageRoute(builder: (_) =>
                  KemahasiswaanMPTMahasiswaPeriodeEditPage(periodeMpt: periodeMpt));
            case kemahasiswaanMPTMahasiswaJenisKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const KemahasiswaanMPTMahasiswaJenisKegiatanPage());
            case kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanMPTMahasiswaJenisKegiatanTambahPage());
            case kemahasiswaanMPTMahasiswaJenisKegiatanEditPageRoute:
              final jenisKegiatanMpt = settings.arguments as JenisKegiatanMpt;
              return MaterialPageRoute(builder: (_) =>
                  KemahasiswaanMPTMahasiswaJenisKegiatanEditPage(jenisKegiatanMpt: jenisKegiatanMpt));
            case kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const MPTMahasiswaKegiatanPerJenisKegiatanPage());
            case mptMahasiswaKegiatanPerJenisKegiatanTambahPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage());
            case kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPageRoute:
              final namaKegiatanMpt = settings.arguments as NamaKegiatanMpt;
              return MaterialPageRoute(
                  builder: (_) => KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPage(namaKegiatanMpt: namaKegiatanMpt));
            case kemahasiswaanMPTMahasiswaKegiatanPerPeriodePageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage());
            case kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage());
            case kemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageRoute:
              final kegiatanPerPeriodeMpt = settings.arguments as KegiatanPerPeriodeMpt;
              return MaterialPageRoute(
                builder: (_) =>
                    KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPage(kegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt),
              );
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
              // final idRiwayatKegiatan = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage());
            case mptMahasiswaRiwayatKegiatanMahasiswaEditPageRoute:
              final riwayatKegiatanMpt = settings.arguments as RiwayatKegiatanMpt;
              return MaterialPageRoute(
                  builder: (_) =>
                      MahasiswaRiwayatKegiatanMahasiswaEditPage(riwayatKegiatanMpt: riwayatKegiatanMpt,));
            case kemahasiswaanEditOrmawaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanEditOrmawaPage());
            case kemahasiswaanEditOrmawaTambahPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanEditOrmawaTambahPage());
            case kemahasiswaanEditOrmawaEditPageRoute:
              final ormawa = settings.arguments as Ormawa;
              return MaterialPageRoute(builder: (_) => KemahasiswaanEditOrmawaEditPage(ormawa: ormawa));
            case kemahasiswaanPrestasiMahasiswaPageRoute:
              return MaterialPageRoute(
                  builder: (_) => const KemahasiswaanPrestasiMahasiswaPage());
            case kemahasiswaanPrestasiMahasiswaTambahPageRoute:
              return MaterialPageRoute(
                  builder: (_) =>
                      const KemahasiswaanPrestasiMahasiswaTambahPage());
            case kemahasiswaanPrestasiMahasiswaEditPageRoute:
              final prestasi = settings.arguments as Prestasi;
              return MaterialPageRoute(
                  builder: (_) => KemahasiswaanPrestasiMahasiswaEditPage(prestasi: prestasi));
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
