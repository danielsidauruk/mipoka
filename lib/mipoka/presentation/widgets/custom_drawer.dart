import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';

class MobileCustomPenggunaDrawerWidget extends StatelessWidget {
  const MobileCustomPenggunaDrawerWidget({Key? key}) : super(key: key);

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
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white),
                ),
                child: TextField(
                  onChanged: (query) {},
                  style: const TextStyle(),
                  decoration: null,
                ),
              ),

              const SizedBox(height: 8.0),

              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Switch(
                    value: darkMode,
                    onChanged: (value) {},
                  ),

                  const Text(
                    'Dark Mode',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),

              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        'Beranda',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context, mobilePenggunaBerandaRoute),
                    ),

                    ExpansionTile(
                      title: const Text(
                        'Pengajuan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ExpansionTile(
                          title: const Text(
                            'Kegiatan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: const Text(
                                'Usulan Kegiatan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context, mobilePenggunaDaftarPengajuanKegiatanRoute),
                            ),

                            ListTile(
                              title: const Text(
                                'Laporan Kegiatan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context, mobilePenggunaDaftarLaporanKegiatanRoute),
                            ),

                          ],
                        ),

                        ListTile(
                          title: const Text(
                            'Sarana & Prasarana',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                          },
                        ),
                      ],
                    ),

                    ListTile(
                      title: const Text(
                        'MPT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                      },
                    ),

                    ExpansionTile(
                      title: const Text(
                        'Ormawa',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      children: [
                        ListTile(
                          title: const Text(
                            'UKM',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),

                    ListTile(
                      title: const Text(
                        'Prestasi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {},
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
