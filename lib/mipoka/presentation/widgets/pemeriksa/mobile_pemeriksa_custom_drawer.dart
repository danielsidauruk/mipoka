import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class MobileCustomPemeriksaDrawer extends StatefulWidget {
  const MobileCustomPemeriksaDrawer({super.key});

  @override
  State<MobileCustomPemeriksaDrawer> createState() => _MobileCustomPemeriksaDrawerState();
}

class _MobileCustomPemeriksaDrawerState extends State<MobileCustomPemeriksaDrawer> {
  final TextEditingController _queryController = TextEditingController();

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
                'Sio Jurnalis Pipin (Pembina)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),

              const CustomFieldSpacer(height: 24),

              InkWell(
                onTap: () => Navigator.pushNamed(context, mobileGantiPasswordPageRoute),
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

                              Expanded(
                                child: InkWell(
                                  onTap: () => _showAlertDialog(context),
                                  // onTap: () => Navigator.pushNamed(context, mobileAkunPageRoute),
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
                                onPressed: () => Navigator.pushNamed(context, mobileNotifikasiPageRoute),
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, mobilePemeriksaDaftarUsulanKegiatanPageRoute),
                        ),

                        ListTile(
                          title: const Text(
                            'Verifikasi Laporan Kegiatan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(context, mobilePemeriksaDaftarLaporanKegiatanPageRoute),
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
