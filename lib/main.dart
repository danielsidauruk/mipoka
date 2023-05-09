import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_daftar_laporan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_laporan_kegiatan_1.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_laporan_kegiatan_2.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_laporan_kegiatan_2_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_laporan_kegiatan_2_import_peserta.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_laporan_kegiatan_3.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_1.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_2_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_2_dk.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_2_dk_data_peserta.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_2_lk.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_daftar_pengajuan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_2_lk_data_peserta.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_beranda_page.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_3.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_3_tertib_acara.dart';
import 'package:mipoka/mipoka/presentation/pages/mobile/pengguna/mobile_pengguna_pengajuan_usulan_kegiatan_3_tertib_acara_tambah.dart';
import 'package:mipoka/mipoka/presentation/pages/web/web_pengguna_beranda_page.dart';
import 'mipoka/presentation/pages/mobile/mobile_pengguna_login_page.dart';

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
      const MobilePenggunaLoginPage(),

      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          // web route
          case webPenggunaBerandaRoute:
            return MaterialPageRoute(builder: (_) => const WebPenggunaBerandaPage());


          // mobile route

          case mobilePenggunaBerandaRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaBerandaPage());
          case mobilePenggunaDaftarPengajuanKegiatanRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaDaftarPengajuanKegiatan());
          case mobilePenggunaPengajuanUsulanKegiatan1Route:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan1());
          case mobilePenggunaPengajuanUsulanKegiatan2LKRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan2LK());
          case mobilePenggunaPengajuanUsulanKegiatan2LKDataPesertaRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan2LKDataPeserta());
          case mobilePenggunaPengajuanUsulanKegiatan2DKRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan2DK());
          case mobilePenggunaPengajuanUsulanKegiatan2DKDataPesertaRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan2DKDataPeserta());
          case mobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatanRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan());
          case mobilePenggunaPengajuanUsulanKegiatan3Route:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan3());
          case mobilePenggunaPengajuanUsulanKegiatan3TertibAcaraRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan3TertibAcara());
          case mobilePenggunaPengajuanUsulanKegiatan3TertibAcaraTambahRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanUsulanKegiatan3TertibAcaraTambah());

          case mobilePenggunaDaftarLaporanKegiatanRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaDaftarLaporanKegiatan());
          case mobilePenggunaPengajuanLaporanKegiatan1Route:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanLaporanKegiatan1());
          case mobilePenggunaPengajuanLaporanKegiatan2Route:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanLaporanKegiatan2());
          case mobilePenggunaPengajuanLaporanKegiatan2BiayaKegiatanRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanLaporanKegiatan2BiayaKegiatan());
          case mobilePenggunaPengajuanLaporanKegiatan2ImportKegiatanRoute:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanLaporanKegiatan2ImportPeserta());
          case mobilePenggunaPengajuanLaporanKegiatan3Route:
            return MaterialPageRoute(builder: (_) => const MobilePenggunaPengajuanLaporanKegiatan3());
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