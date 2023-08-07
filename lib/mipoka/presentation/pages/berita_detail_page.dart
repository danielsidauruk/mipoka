import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class BeritaDetailPage extends StatefulWidget {
  final Berita berita;

  const BeritaDetailPage({
    super.key,
    required this.berita,
  });

  @override
  State<BeritaDetailPage> createState() => _BeritaDetailPageState();
}

class _BeritaDetailPageState extends State<BeritaDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      // drawer: const MobileCustomPenggunaDrawerWidget(),

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

                  buildDetailBeritaTitle(widget.berita.judul),

                  const CustomFieldSpacer(height: 4),

                  Text(
                    'Diterbitkan: ${widget.berita.tglTerbit} | Oleh: ${widget.berita.penulis}',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const CustomFieldSpacer(),

                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Image.network(
                      widget.berita.gambar,
                      height: 200,
                    ),
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