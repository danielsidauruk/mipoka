import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';

class MobilePenggunaBerandaPage extends StatefulWidget {
  const MobilePenggunaBerandaPage({super.key});

  @override
  State<MobilePenggunaBerandaPage> createState() => _MobilePenggunaBerandaPageState();
}

class _MobilePenggunaBerandaPageState extends State<MobilePenggunaBerandaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 0.5,
            color: Colors.white,
          ),
        ),
      ),

      drawer: const MobilePenggunaDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Berita Kemahasiswaan',
                  style: mobileTitle,
                ),
              ],
            ),

            const SizedBox(height: 4.0),

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