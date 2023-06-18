import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaBerandaDetailPage extends StatefulWidget {
  final Berita berita;

  const PenggunaBerandaDetailPage({
    super.key,
    required this.berita,
  });

  @override
  State<PenggunaBerandaDetailPage> createState() => _PenggunaBerandaDetailPageState();
}

class _PenggunaBerandaDetailPageState extends State<PenggunaBerandaDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Berita Kemahasiswaan - Detail'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildDetailBeritaTitle('widget.berita.judulBerita',),

                  const CustomFieldSpacer(height: 4),

                  Text(
                    'Diterbitkan: 14 April 2023 | Oleh: ${widget.berita.penulis}',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const CustomFieldSpacer(),

                  Container(
                    height: 200,
                    color: Colors.grey,
                  ),

                  const CustomFieldSpacer(),

                  Text(widget.berita.teks),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildDetailBeritaTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

}