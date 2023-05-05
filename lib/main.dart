import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/utils.dart';
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
      MobilePenggunaLoginPage(),

      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case webPenggunaBerandaRoute:
            return MaterialPageRoute(builder: (_) => const WebPenggunaBerandaPage());
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