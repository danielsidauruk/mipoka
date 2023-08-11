import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart' as indonesiaFormat;
import 'package:mipoka/domain/utils/format_notification_date_utils.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_notifikasi_tile.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:intl/date_symbol_data_local.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {

  @override
  void initState() {
    initializeDateFormatting('id_ID', null);
    context.read<NotifikasiBloc>().add(const ReadAllNotifikasiEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<NotifikasiBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<NotifikasiBloc>().add(const ReadAllNotifikasiEvent());
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Notifikasi'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocBuilder<NotifikasiBloc, NotifikasiState>(
                    builder: (context, state) {
                      if (state is NotifikasiLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllNotifikasiHasData) {
                        final notifikasiList = state.notifikasiList;

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: notifikasiList.length,
                          itemBuilder: (context, index) {
                            return CustomNotifikasiTile(
                              text: notifikasiList[index].teksNotifikasi,
                              time: formatNotificationDate(notifikasiList[index].tglNotifikasi),
                            );
                          },
                        );
                      } else if (state is NotifikasiError) {
                        mipokaCustomToast(state.message);
                        return const SizedBox();
                      } else {
                        print("Notifikasi hasn't been triggered yet.");
                        return const SizedBox();
                      }
                      // return Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //
                      //
                      //
                      //     CustomFieldSpacer(),
                      //
                      //     CustomNotifikasiTile(
                      //       text: 'Sio Jurnalis Pipin telah memberikan validasi mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                      //       time: '11.00 AM',
                      //     ),
                      //
                      //     CustomFieldSpacer(),
                      //
                      //     CustomNotifikasiTile(
                      //       text: 'Tashia Taslim telah memberikan persetujuan mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                      //       time: '03.00 PM',
                      //     ),
                      //
                      //     CustomFieldSpacer(),
                      //
                      //     CustomNotifikasiTile(
                      //       text: 'Tommy Christian Siregar telah melakukan pengajuan Usulan Kegiatan',
                      //       time: 'Senin',
                      //     ),
                      //
                      //     CustomFieldSpacer(),
                      //
                      //     CustomNotifikasiTile(
                      //       text: 'Sio Jurnalis Pipin telah memberikan validasi mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                      //       time: '11.00 AM',
                      //     ),
                      //
                      //     CustomFieldSpacer(),
                      //
                      //     CustomNotifikasiTile(
                      //       text: 'Tashia Taslim telah memberikan persetujuan mengenai Usulan Kegiatan yang diajukan oleh Tommy Christian Siregar',
                      //       time: '03.00 PM',
                      //     ),
                      //   ],
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}