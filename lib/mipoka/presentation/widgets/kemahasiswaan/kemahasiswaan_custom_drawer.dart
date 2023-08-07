import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

import '../custom_drawer.dart';
import '../mipoka_custom_toast.dart';

class MobileCustomKemahasiswaanDrawer extends StatefulWidget {
  const MobileCustomKemahasiswaanDrawer({super.key});

  @override
  State<MobileCustomKemahasiswaanDrawer> createState() =>
      _MobileCustomKemahasiswaanDrawerState();
}

class _MobileCustomKemahasiswaanDrawerState
    extends State<MobileCustomKemahasiswaanDrawer> {
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
                user?.email ?? "",
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
                child: Text(
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
                                  // onTap: () => Navigator.pushNamed(context, mobileAkunPageRoute),
                                  child: Text(
                                    '${user?.email}',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const CustomFieldSpacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
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
                          context, kemahasiswaanBeritaPageRoute),
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Kemahasiswaan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: const Text(
                            'Edit Beranda',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, kemahasiswaanBerandaPageRoute),
                        ),

                        ExpansionTile(
                          title: const Text("MPT Mahasiswa",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: const Text(
                                'Periode',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaPeriodePageRoute),
                            ),
                            ListTile(
                              title: const Text(
                                'Jenis Kegiatan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaJenisKegiatanPageRoute),
                            ),
                            ListTile(
                              title: const Text(
                                'Kegiatan per Jenis Kegiatan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPageRoute),
                            ),
                            ListTile(
                              title: const Text(
                                'Kegiatan per Periode',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaKegiatanPerPeriodePageRoute),
                            ),
                            ListTile(
                              title: const Text(
                                'Mahasiswa per Periode',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageRoute),
                            ),
                            ListTile(
                              title: const Text(
                                'Riwayat Kegiatan Mahasiswa',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context,
                                  kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageRoute),
                            ),
                          ],
                        ),

                        ListTile(
                          title: const Text(
                            'Edit Ormawa',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, kemahasiswaanEditOrmawaPageRoute),
                        ),
                        ListTile(
                          title: const Text(
                            'Prestasi Mahasiswa',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, kemahasiswaanPrestasiMahasiswaPageRoute),
                        ),
                        ListTile(
                          title: const Text(
                            'Cek Usulan Kegiatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, kemahasiswaanCekUsulanKegiatanPageRoute),
                        ),
                        ListTile(
                          title: const Text(
                            'Verifikasi Sarana & Prasarana',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, kemahasiswaanCekSaranaDanPrasaranaPageRoute),
                        ),
                        ListTile(
                          title: const Text(
                            'Cek Laporan Kegiatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, kemahasiswaanCekLaporanKegiatanPageRoute),
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
