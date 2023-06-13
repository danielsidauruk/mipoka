import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/pengajuan_kegiatan_cubit.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenggunaPengajuanUsulanKegiatan2BiayaKegiatan extends StatelessWidget {
  final TextEditingController _namaBiayaKegiatanController =
  TextEditingController();
  final TextEditingController _keteranganController =
  TextEditingController();

  PenggunaPengajuanUsulanKegiatan2BiayaKegiatan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PengajuanKegiatanCubit(),
      child: Scaffold(
        appBar: const MipokaMobileAppBar(),
        drawer: const MobileCustomPenggunaDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomMobileTitle(
                    text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
                const CustomFieldSpacer(),
                BlocBuilder<PengajuanKegiatanCubit, PengajuanKegiatanState>(
                  builder: (context, state) {
                    return CustomContentBox(
                      children: [
                        customBoxTitle('Biaya Kegiatan'),
                        const CustomFieldSpacer(),
                        buildTitle('Nama Biaya Kegiatan'),
                        CustomTextField(
                          controller: _namaBiayaKegiatanController,
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Qty'),
                        CustomTextField2(
                          textInputType: TextInputType.number,
                          onSubmitted: (value) {
                            final qty = int.tryParse(value) ?? 0;
                            context
                                .read<PengajuanKegiatanCubit>()
                                .updateQty(qty);
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Harga Satuan'),
                        CustomTextField2(
                          textInputType: TextInputType.number,
                          onSubmitted: (value) {
                            final hargaSatuan = int.tryParse(value) ?? 0;
                            context
                                .read<PengajuanKegiatanCubit>()
                                .updateHargaSatuan(hargaSatuan);
                          },
                        ),



                        const CustomFieldSpacer(),
                        buildTitle('Total'),
                        // CustomTextField3(
                        //   value: state.total.toString(),
                        //   textInputType: TextInputType.number,
                        //   onSubmitted: (value) {  },
                        // ),

                        BlocProvider(
                          create: (_) => PengajuanKegiatanCubit(),
                          child: BlocBuilder<PengajuanKegiatanCubit, PengajuanKegiatanState>(
                            builder: (context, state) {
                              return CustomTextField(
                                controller: TextEditingController(
                                    text: state.total.toString()),
                                textInputType: TextInputType.number,
                              );
                            },
                          ),
                        ),



                        const CustomFieldSpacer(),
                        buildTitle('Keterangan'),
                        CustomTextField(
                          controller: _keteranganController,
                        ),
                        const CustomFieldSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Sebelumnya',
                            ),
                            const SizedBox(width: 8.0),
                            CustomButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Tambahkan',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

