import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';

class MobilePenggunaBerandaPage extends StatefulWidget {
  const MobilePenggunaBerandaPage({super.key});

  @override
  State<MobilePenggunaBerandaPage> createState() => _MobilePenggunaBerandaPageState();
}

class _MobilePenggunaBerandaPageState extends State<MobilePenggunaBerandaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobilePenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const MobileTitle(text: 'Berita Kemahasiswaan'),

            const FieldSpacer(),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    const Placeholder(
                      fallbackHeight: 170,
                    ),

                    const SizedBox(height: 8.0),

                    Expanded(
                      child: ListView(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildBeritaTile() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white)
      ),
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
    );
  }
}