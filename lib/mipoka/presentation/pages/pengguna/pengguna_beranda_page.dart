import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaBerandaPage extends StatefulWidget {
  const PenggunaBerandaPage({super.key});

  @override
  State<PenggunaBerandaPage> createState() => _PenggunaBerandaPageState();
}

class _PenggunaBerandaPageState extends State<PenggunaBerandaPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BeritaBloc>(context, listen: false)
        .add(const ReadAllBeritaEvent());
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
          } else if (state is AllBeritaHasData) {
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
                        ListView.builder(
                          itemCount: state.allBerita.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final berita = state.allBerita[index];
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                penggunaBerandaDetailPageRoute,
                                arguments: berita,
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 80,
                                  maxHeight: 120,
                                ),
                                margin: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(maxWidth: 100),
                                      margin: const EdgeInsets.all(4.0),
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Image.network(
                                          berita.gambar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            buildTitle(berita.judul),
                                            Text(
                                              berita.createdAt,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
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
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BeritaError) {
            return const Text('Error');
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}