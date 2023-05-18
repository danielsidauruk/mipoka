import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaBerandaPage extends StatefulWidget {
  const MobilePenggunaBerandaPage({super.key});

  @override
  State<MobilePenggunaBerandaPage> createState() =>
      _MobilePenggunaBerandaPageState();
}

class _MobilePenggunaBerandaPageState extends State<MobilePenggunaBerandaPage> {
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
              const CustomMobileTitle(text: 'Berita Kemahasiswaan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  const Placeholder(
                    fallbackHeight: 170,
                  ),
                  const CustomFieldSpacer(),
                  ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                      const SizedBox(height: 4.0),
                      buildBeritaTile(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildBeritaTile() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, penggunaBerandaDetailPageRoute),
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 4.0),
            const Expanded(
              flex: 3,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur '
                'adipiscing elit, sed do eiusmod tempor incididunt '
                'ut labore et dolore ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
