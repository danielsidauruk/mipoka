import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaBerandaPage extends StatefulWidget {
  const PenggunaBerandaPage({super.key});

  @override
  State<PenggunaBerandaPage> createState() =>
      _PenggunaBerandaPageState();
}

class _PenggunaBerandaPageState extends State<PenggunaBerandaPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BeritaBloc>(context, listen: false)
        .add(LoadBeritaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<BeritaBloc, BeritaState>(
        builder: (context, state) {
          if (state is BeritaLoading) {
            return const Text('Loading');
          } else if (state is BeritaHasData) {
            return SingleChildScrollView(
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
                        ListView.builder(
                          itemCount: state.berita.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final berita = state.berita[index];
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
                                      child: Image.network(berita.gambar),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Expanded(
                                      flex: 3,
                                      child: Text(berita.teks,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          // children: [
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //   // const SizedBox(height: 4.0),
                          //   // buildBeritaTile(),
                          //
                          // ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BeritaError) {
            return Text('Error');
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }

  // InkWell buildBeritaTile() {
  //   return InkWell(
  //     onTap: () => Navigator.pushNamed(context, penggunaBerandaDetailPageRoute),
  //     child: Container(
  //       height: 80,
  //       decoration: BoxDecoration(border: Border.all(color: Colors.white)),
  //       padding: const EdgeInsets.all(4.0),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             flex: 1,
  //             child: Container(
  //               width: 80,
  //               height: 80,
  //               color: Colors.grey,
  //             ),
  //           ),
  //           const SizedBox(width: 4.0),
  //           const Expanded(
  //             flex: 3,
  //             child: Text(
  //               'Lorem ipsum dolor sit amet, consectetur '
  //               'adipiscing elit, sed do eiusmod tempor incididunt '
  //               'ut labore et dolore ',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
