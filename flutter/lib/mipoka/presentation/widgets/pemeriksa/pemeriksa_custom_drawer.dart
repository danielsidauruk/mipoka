import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class MobileCustomPemeriksaDrawer extends StatefulWidget {
  const MobileCustomPemeriksaDrawer({super.key});

  @override
  State<MobileCustomPemeriksaDrawer> createState() =>
      _MobileCustomPemeriksaDrawerState();
}

class _MobileCustomPemeriksaDrawerState
    extends State<MobileCustomPemeriksaDrawer> {
  final TextEditingController _queryController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBoxTitle('Akun'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user?.email ?? "-",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const CustomFieldSpacer(height: 24),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, gantiPasswordPageRoute),
                child: const Text(
                  'Ganti Password',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'MIPOKA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => _showAlertDialog(context),
                                  child: Text(
                                    '${user?.email}',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const CustomFieldSpacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pushNamed(context, gantiPasswordPageRoute),
                                icon: const Icon(Icons.password),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, notifikasiPageRoute),
                                icon: const Icon(Icons.notifications),
                              ),
                              IconButton(
                                onPressed: () {
                                  logoutUser();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    loginPageRoute,
                                        (route) => false,
                                  );
                                  mipokaCustomToast(logoutMessage);
                                },
                                icon: const Icon(Icons.exit_to_app),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Beranda',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                          context, pemeriksaBerandaPageRoute),
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Pemeriksa',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: const Text(
                            'Verifikasi Usulan Kegiatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, pemeriksaDaftarUsulanKegiatanPageRoute),
                        ),
                        ListTile(
                          title: const Text(
                            'Verifikasi Laporan Kegiatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, pemeriksaDaftarLaporanKegiatanPageRoute),
                        ),
                      ],
                    ),
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
