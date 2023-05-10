import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class MobileCustomPenggunaDrawerWidget extends StatefulWidget {
  const MobileCustomPenggunaDrawerWidget({super.key});

  @override
  State<MobileCustomPenggunaDrawerWidget> createState() => _MobileCustomPenggunaDrawerWidgetState();
}

class _MobileCustomPenggunaDrawerWidgetState extends State<MobileCustomPenggunaDrawerWidget> {
  final TextEditingController _queryController = TextEditingController();

  // void _showAlertDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             customBoxTitle('Akun'),
  //           ],
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               'Daniel Hamonangan Sidauruk (191112857)',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 22,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //
  //             const CustomFieldSpacer(),
  //
  //             Text(
  //               'Ganti Password',
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
              CustomTextField(controller: _queryController),

              const CustomFieldSpacer(),

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

              const CustomFieldSpacer(),

              Expanded(
                child: ListView(
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Icon(Icons.person),

                              // SizedBox(width: 8.0),

                              Expanded(
                                child: InkWell(
                                  // onTap: () => _showAlertDialog(context),
                                  child: Text(
                                    'Daniel Hamonangan Sidauruk (191112857)',
                                    style: TextStyle(fontWeight: FontWeight.bold),
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
                                onPressed: () {} ,
                                icon: const Icon(Icons.message),
                              ),

                              IconButton(
                                onPressed: () {} ,
                                icon: const Icon(Icons.notifications),
                              ),

                              
                              IconButton(
                                onPressed: () => Navigator.pushNamed(context, mobileLoginPageRoute),
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
                          onTap: () => Navigator.pushNamed(context, mobilePenggunaDaftarPengajuanSaranaDanPrasaranaRoute),
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
                      onTap: () => Navigator.pushNamed(context, mobilePenggunaMPTRoute),
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
                          onTap: () => Navigator.pushNamed(context, mobilePenggunaOrmawaUKMPageRoute),
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
                      onTap: () => Navigator.pushNamed(context, mobilePenggunaPrestasiPageRoute),
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
