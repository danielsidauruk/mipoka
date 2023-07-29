import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/dio_util.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:http/http.dart' as http;

class PenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan3({
    super.key,
    required this.usulanArgs,
  });

  final UsulanArgs usulanArgs;

  @override
  State<PenggunaPengajuanUsulanKegiatan3> createState() =>
      _PenggunaPengajuanUsulanKegiatan3State();
}

class _PenggunaPengajuanUsulanKegiatan3State
    extends State<PenggunaPengajuanUsulanKegiatan3> with RouteAware {

  final TextEditingController _latarBelakangController = TextEditingController();
  final TextEditingController _tujuanKegiatanController = TextEditingController();
  final TextEditingController _manfaatKegiatanController = TextEditingController();
  final TextEditingController _bentukPelaksanaanKegiatanController = TextEditingController();
  final TextEditingController _targetPencapaianKegiatanController = TextEditingController();
  final TextEditingController _waktuDanTempatPelaksanaanKegiatanController = TextEditingController();
  final TextEditingController _rencanaAnggaranKegiatanController = TextEditingController();
  final TextEditingController _perlengkapanDanPeralatanController = TextEditingController();
  final TextEditingController _penutupController = TextEditingController();

  final StreamController<String?> _postinganKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _suratUndanganKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _linimasaKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoTempatKegiatanStream = StreamController<String?>.broadcast();

  String? _postinganKegiatanController;
  String? _suratUndanganKegiatanController;
  String? _linimasaKegiatanController;
  String? _fotoTempatKegiatanController;

  FilePickerResult? _postinganKegiatanResult;
  FilePickerResult? _suratUndanganKegiatanResult;
  FilePickerResult? _linimasaKegiatanResult;
  FilePickerResult? _fotoTempatKegiatanResult;

  Uint8List? postinganKegiatanBytes;
  Uint8List? suratUndanganKegiatanBytes;
  Uint8List? linimasaKegiatanBytes;
  Uint8List? fotoTempatKegiatanBytes;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    _postinganKegiatanStream.close();
    _suratUndanganKegiatanStream.close();
    _linimasaKegiatanStream.close();
    _fotoTempatKegiatanStream.close();
    super.dispose();
  }

  // Future<String?> generateUsulanDocx(UsulanKegiatanModel usulanKegiatanModel) async {
  //   const String localUrl = "http://192.168.43.183:3000/usulan-kegiatan";
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(localUrl),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(usulanKegiatanModel.toJson()),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Request berhasil, lakukan sesuatu dengan response
  //       if (kDebugMode) {
  //         print(response.body);
  //       }
  //       return response.body;
  //     } else {
  //       // Jika request tidak berhasil, tampilkan pesan error
  //       if (kDebugMode) {
  //         print("HTTP Error ${response.statusCode}: ${response.reasonPhrase}");
  //       }
  //     }
  //   } catch (e) {
  //     // Tangani kesalahan ketika melakukan request
  //     if (kDebugMode) {
  //       print("Error: $e");
  //     }
  //   }
  //
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    print('Page 3 Reloaded');
    return Scaffold(
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

              CustomContentBox(
                children: [

                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (state is SaveAndGoBackLastPageSuccess) {
                        Navigator.pop(context, true);

                      } else if (state is SaveAndSendLastPageSuccess) {

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          penggunaDaftarPengajuanKegiatanPageRoute,
                              (route) => false,
                        );
                      }
                      else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text('Loading');
                      } else if (state is UsulanKegiatanHasData) {
                        final usulanKegiatan = state.usulanKegiatan;

                        _latarBelakangController.text = usulanKegiatan.latarBelakang;
                        _tujuanKegiatanController.text = usulanKegiatan.tujuanKegiatan;
                        _manfaatKegiatanController.text = usulanKegiatan.manfaatKegiatan;
                        _bentukPelaksanaanKegiatanController.text = usulanKegiatan.bentukPelaksanaanKegiatan;
                        _targetPencapaianKegiatanController.text = usulanKegiatan.targetPencapaianKegiatan;
                        _waktuDanTempatPelaksanaanKegiatanController.text = usulanKegiatan.waktuDanTempatPelaksanaan;
                        _rencanaAnggaranKegiatanController.text = usulanKegiatan.rencanaAnggaranKegiatan;
                        _perlengkapanDanPeralatanController.text = usulanKegiatan.perlengkapanDanPeralatan;
                        _penutupController.text = usulanKegiatan.penutup;
                        _postinganKegiatanController = usulanKegiatan.fotoPostinganKegiatan;
                        _suratUndanganKegiatanController = usulanKegiatan.fotoSuratUndanganKegiatan;
                        _linimasaKegiatanController = usulanKegiatan.fotoLinimasaKegiatan;
                        _fotoTempatKegiatanController = usulanKegiatan.fotoTempatKegiatan;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            InkWell(
                              onTap: () {
                                context.read<UsulanKegiatanBloc>().add(
                                    ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
                              },
                              child: const Icon(
                                Icons.refresh,
                              ),
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Latar Belakang'),
                            buildDescription('Berisi latar belakang kegiatan diusulkan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiLatarBelakang != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiLatarBelakang ?? ""),

                            CustomTextField(controller: _latarBelakangController),

                            const CustomFieldSpacer(),

                            buildTitle('Tujuan Kegiatan'),
                            buildDescription('Berisi tujuan kegiatan diusulkan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiTujuanKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiTujuanKegiatan ?? ""),
                            CustomTextField(controller: _tujuanKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Manfaat Kegiatan'),
                            buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiManfaatKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiManfaatKegiatan ?? ""),
                            CustomTextField(controller: _manfaatKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Bentuk Pelaksanaan Kegiatan'),
                            buildDescription(
                                'Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiBentukPelaksanaanKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiBentukPelaksanaanKegiatan ?? ""),
                            CustomTextField(
                                controller: _bentukPelaksanaanKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Target Pencapaian Kegiatan'),
                            buildDescription(
                                'Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiTargetPencapaianKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiTargetPencapaianKegiatan ?? ""),
                            CustomTextField(
                                controller: _targetPencapaianKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu dan Tempat Pelaksanaan'),
                            buildDescription('Rincikan dengan jelas'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiWaktuDanTempatPelaksanaan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiWaktuDanTempatPelaksanaan ?? ""),
                            CustomTextField(
                                controller: _waktuDanTempatPelaksanaanKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Rencana Anggaran Kegiatan'),
                            buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiRencanaAnggaranKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiRencanaAnggaranKegiatan ?? ""),

                            CustomTextField(
                                controller: _rencanaAnggaranKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                            buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiManfaatKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiManfaatKegiatan ?? ""),
                            CustomTextField(
                                controller: _perlengkapanDanPeralatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Penutup'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiPenutup != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiPenutup ?? ""),
                            CustomTextField(controller: _penutupController),

                            const CustomFieldSpacer(),

                            buildTitle('Lampiran - Lampiran'),

                            const CustomFieldSpacer(),

                            buildTitle('Postingan Kegiatan'),
                            buildDescription(
                                'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiFotoPostinganKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiFotoPostinganKegiatan ?? ""),

                            StreamBuilder<String?>(
                              initialData: _postinganKegiatanController,
                              stream: _postinganKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _postinganKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _postinganKegiatanResult?.files.first;
                                    if (_postinganKegiatanResult != null) {
                                      _postinganKegiatanStream.add(file?.name);
                                    }
                                  },
                                  onDelete: () {
                                    deleteFileFromFirebase(_postinganKegiatanController ?? "");
                                    _postinganKegiatanStream.add("");
                                    _postinganKegiatanController = "";
                                    _postinganKegiatanResult = null;
                                  },
                                  text: text,
                                );
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Surat Undangan Kegiatan'),
                            buildDescription(
                                'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiFotoSuratUndanganKegiatan != "")

                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiFotoSuratUndanganKegiatan ?? ""),
                            StreamBuilder<String?>(
                              initialData: _suratUndanganKegiatanController,
                              stream: _suratUndanganKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _suratUndanganKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _suratUndanganKegiatanResult?.files.first;
                                    if (_suratUndanganKegiatanResult!= null) {
                                      _suratUndanganKegiatanStream.add(file?.name);
                                    }
                                  },
                                  onDelete: () {
                                    deleteFileFromFirebase(_suratUndanganKegiatanController ?? "");
                                    _suratUndanganKegiatanStream.add("");
                                    _suratUndanganKegiatanController = "";
                                    _suratUndanganKegiatanResult = null;
                                  },
                                  text: text,
                                );
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Linimasa Kegiatan'),
                            buildDescription(
                                'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiFotoLinimasaKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiFotoLinimasaKegiatan ?? ""),

                            StreamBuilder<String?>(
                              initialData: _linimasaKegiatanController,
                              stream: _linimasaKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _linimasaKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _linimasaKegiatanResult?.files.first;
                                    if (_linimasaKegiatanResult!= null) {
                                      _linimasaKegiatanStream.add(file?.name);
                                    }
                                  },
                                  onDelete: () {
                                    deleteFileFromFirebase(_linimasaKegiatanController ?? "");
                                    _linimasaKegiatanStream.add("");
                                    _linimasaKegiatanController = "";
                                    _linimasaKegiatanResult = null;
                                  },
                                  text: text,
                                );
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Tempat Kegiatan'),
                            buildDescription(
                                'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && state.usulanKegiatan.revisiUsulan?.revisiFotoTempatKegiatan != "")
                              buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiFotoTempatKegiatan ?? ""),

                            StreamBuilder<String?>(
                              initialData: _fotoTempatKegiatanController,
                              stream: _fotoTempatKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _fotoTempatKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _fotoTempatKegiatanResult?.files.first;
                                    if (_fotoTempatKegiatanResult!= null) {
                                      _fotoTempatKegiatanStream.add(file?.name);
                                    }
                                  },
                                  onDelete: (){
                                    deleteFileFromFirebase(_fotoTempatKegiatanController ?? "");
                                    _fotoTempatKegiatanStream.add("");
                                    _fotoTempatKegiatanController = "";
                                    _fotoTempatKegiatanResult = null;
                                  },
                                  text: text,
                                );
                              },
                            ),

                            const CustomFieldSpacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomMipokaButton(
                                  onTap: () async {

                                    mipokaCustomToast(savingDataMessage);

                                    if (kIsWeb) {
                                      if (_postinganKegiatanResult != null) {
                                        postinganKegiatanBytes = _postinganKegiatanResult?.files.first.bytes;
                                      }
                                      if (_suratUndanganKegiatanResult != null) {
                                        suratUndanganKegiatanBytes = _suratUndanganKegiatanResult?.files.first.bytes;
                                      }
                                      if (_linimasaKegiatanResult != null) {
                                        linimasaKegiatanBytes = _linimasaKegiatanResult?.files.first.bytes;
                                      }
                                      if (_fotoTempatKegiatanResult != null) {
                                        fotoTempatKegiatanBytes = _fotoTempatKegiatanResult?.files.first.bytes;
                                      }
                                    } else if (Platform.isAndroid) {
                                      if (_postinganKegiatanResult != null) {
                                        postinganKegiatanBytes = await File(_postinganKegiatanResult!.files.first.path!).readAsBytes();
                                      }
                                      if (_suratUndanganKegiatanResult != null) {
                                        suratUndanganKegiatanBytes = await File(_suratUndanganKegiatanResult!.files.first.path!).readAsBytes();
                                      }
                                      if (_linimasaKegiatanResult != null) {
                                        linimasaKegiatanBytes = await File(_linimasaKegiatanResult!.files.first.path!).readAsBytes();
                                      }
                                      if (_fotoTempatKegiatanResult != null) {
                                        fotoTempatKegiatanBytes = await File(_fotoTempatKegiatanResult!.files.first.path!).readAsBytes();
                                      }
                                    }

                                    if (postinganKegiatanBytes != null) {
                                      int uniqueId = UniqueIdGenerator.generateUniqueId();
                                      _postinganKegiatanController = await uploadBytesToFirebase(postinganKegiatanBytes!, "$uniqueId${_postinganKegiatanResult!.files.first.name}");
                                    }
                                    if (suratUndanganKegiatanBytes != null) {
                                      int uniqueId = UniqueIdGenerator.generateUniqueId();
                                      _suratUndanganKegiatanController = await uploadBytesToFirebase(suratUndanganKegiatanBytes!, "$uniqueId${_suratUndanganKegiatanResult!.files.first.name}");
                                    }
                                    if (linimasaKegiatanBytes != null) {
                                      int uniqueId = UniqueIdGenerator.generateUniqueId();
                                      _linimasaKegiatanController = await uploadBytesToFirebase(linimasaKegiatanBytes!, "$uniqueId${_linimasaKegiatanResult!.files.first.name}");
                                    }
                                    if (fotoTempatKegiatanBytes != null) {
                                      int uniqueId = UniqueIdGenerator.generateUniqueId();
                                      _fotoTempatKegiatanController = await uploadBytesToFirebase(fotoTempatKegiatanBytes!, "$uniqueId${_fotoTempatKegiatanResult!.files.first.name}");
                                    }

                                    if (context.mounted) {
                                      context.read<UsulanKegiatanBloc>().add(
                                        SaveAndGoBackLastPageEvent(
                                          usulanKegiatan: usulanKegiatan.copyWith(
                                            latarBelakang: _latarBelakangController.text,
                                            tujuanKegiatan: _tujuanKegiatanController.text,
                                            manfaatKegiatan: _manfaatKegiatanController.text,
                                            bentukPelaksanaanKegiatan: _bentukPelaksanaanKegiatanController.text,
                                            targetPencapaianKegiatan: _targetPencapaianKegiatanController.text,
                                            waktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.text,
                                            rencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.text,
                                            perlengkapanDanPeralatan: _perlengkapanDanPeralatanController.text,
                                            penutup: _penutupController.text,
                                            fotoPostinganKegiatan: _postinganKegiatanController,
                                            fotoSuratUndanganKegiatan: _suratUndanganKegiatanController,
                                            fotoLinimasaKegiatan: _linimasaKegiatanController,
                                            fotoTempatKegiatan: _fotoTempatKegiatanController,
                                            updatedAt: currentDate,
                                            updatedBy: user?.email,
                                          ),
                                        ),
                                      );
                                      Navigator.pop(context, true);
                                    }
                                  },
                                  text: 'Sebelumnya',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () async {
                                    if (_latarBelakangController.text != "" && _tujuanKegiatanController.text != ""
                                        && _manfaatKegiatanController.text != "" && _bentukPelaksanaanKegiatanController.text != ""
                                        && _targetPencapaianKegiatanController.text != "" && _waktuDanTempatPelaksanaanKegiatanController.text != ""
                                        && _rencanaAnggaranKegiatanController.text != "" && _perlengkapanDanPeralatanController.text != ""
                                        && _penutupController.text != ""
                                        && ((_postinganKegiatanController != "" || _postinganKegiatanResult != null)
                                            && (_suratUndanganKegiatanController != "" || _suratUndanganKegiatanResult != null)
                                            && (_linimasaKegiatanController != "" || _linimasaKegiatanResult != null)
                                            && (_fotoTempatKegiatanController != "" || _fotoTempatKegiatanResult != null))
                                    ) {

                                      mipokaCustomToast(savingDataMessage);

                                      if (kIsWeb) {
                                        if (_postinganKegiatanResult != null) {
                                          postinganKegiatanBytes = _postinganKegiatanResult?.files.first.bytes;
                                        }
                                        if (_suratUndanganKegiatanResult != null) {
                                          suratUndanganKegiatanBytes = _suratUndanganKegiatanResult?.files.first.bytes;
                                        }
                                        if (_linimasaKegiatanResult != null) {
                                          linimasaKegiatanBytes = _linimasaKegiatanResult?.files.first.bytes;
                                        }
                                        if (_fotoTempatKegiatanResult != null) {
                                          fotoTempatKegiatanBytes = _fotoTempatKegiatanResult?.files.first.bytes;
                                        }
                                      } else if (Platform.isAndroid) {
                                        if (_postinganKegiatanResult != null) {
                                          postinganKegiatanBytes = await File(_postinganKegiatanResult!.files.first.path!).readAsBytes();
                                        }
                                        if (_suratUndanganKegiatanResult != null) {
                                          suratUndanganKegiatanBytes = await File(_suratUndanganKegiatanResult!.files.first.path!).readAsBytes();
                                        }
                                        if (_linimasaKegiatanResult != null) {
                                          linimasaKegiatanBytes = await File(_linimasaKegiatanResult!.files.first.path!).readAsBytes();
                                        }
                                        if (_fotoTempatKegiatanResult != null) {
                                          fotoTempatKegiatanBytes = await File(_fotoTempatKegiatanResult!.files.first.path!).readAsBytes();
                                        }
                                      }

                                      if (postinganKegiatanBytes != null) {
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        _postinganKegiatanController = await uploadBytesToFirebase(postinganKegiatanBytes!, "$uniqueId${_postinganKegiatanResult!.files.first.name}");
                                      }
                                      if (suratUndanganKegiatanBytes != null) {
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        _suratUndanganKegiatanController = await uploadBytesToFirebase(suratUndanganKegiatanBytes!, "$uniqueId${_suratUndanganKegiatanResult!.files.first.name}");
                                      }
                                      if (linimasaKegiatanBytes != null) {
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        _linimasaKegiatanController = await uploadBytesToFirebase(linimasaKegiatanBytes!, "$uniqueId${_linimasaKegiatanResult!.files.first.name}");
                                      }
                                      if (fotoTempatKegiatanBytes != null) {
                                        int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        _fotoTempatKegiatanController = await uploadBytesToFirebase(fotoTempatKegiatanBytes!, "$uniqueId${_fotoTempatKegiatanResult!.files.first.name}");
                                      }

                                      print("Postingan Kegiatan : $_postinganKegiatanController");
                                      print("Surat Undangan : $_suratUndanganKegiatanController");
                                      print("Linimasa Kegiatan  : $_linimasaKegiatanController");
                                      print("Foto Tempat Kegiatan : $_fotoTempatKegiatanController");

                                      int totalBiaya = usulanKegiatan.biayaKegiatan.fold(0, (sum, biayaKegiatan) => sum + biayaKegiatan.total);

                                      final usulanKegiatanObject = usulanKegiatan.copyWith(
                                        latarBelakang: _latarBelakangController.text,
                                        tujuanKegiatan: _tujuanKegiatanController.text,
                                        manfaatKegiatan: _manfaatKegiatanController.text,
                                        bentukPelaksanaanKegiatan: _bentukPelaksanaanKegiatanController.text,
                                        targetPencapaianKegiatan: _targetPencapaianKegiatanController.text,
                                        waktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.text,
                                        rencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.text,
                                        perlengkapanDanPeralatan: _perlengkapanDanPeralatanController.text,
                                        penutup: _penutupController.text,
                                        fotoPostinganKegiatan: _postinganKegiatanController,
                                        fotoSuratUndanganKegiatan: _suratUndanganKegiatanController,
                                        fotoLinimasaKegiatan: _linimasaKegiatanController,
                                        fotoTempatKegiatan: _fotoTempatKegiatanController,
                                        totalBiaya: totalBiaya,
                                        updatedAt: currentDate,
                                        updatedBy: user?.email,
                                      );

                                      String? fileUsulanKegiatan = await generateUsulanDocx(
                                        UsulanKegiatanModel.fromEntity(
                                          usulanKegiatanObject,
                                        ),
                                      );

                                      print("File Usulan Kegaitan : $fileUsulanKegiatan");
                                      print(
                                        UsulanKegiatanModel.fromEntity(
                                          usulanKegiatanObject,
                                        ),
                                      );

                                      if (fileUsulanKegiatan != null) {
                                        if (context.mounted) {
                                          context.read<UsulanKegiatanBloc>().add(
                                            SaveAndSendLastPageEvent(
                                              usulanKegiatan: usulanKegiatanObject.copyWith(
                                                fileUsulanKegiatan: fileUsulanKegiatan,
                                              ),
                                              // usulanKegiatan.copyWith(
                                              //   latarBelakang: _latarBelakangController.text,
                                              //   tujuanKegiatan: _tujuanKegiatanController.text,
                                              //   manfaatKegiatan: _manfaatKegiatanController.text,
                                              //   bentukKegiatan: _bentukPelaksanaanKegiatanController.text,
                                              //   targetKegiatan: _targetPencapaianKegiatanController.text,
                                              //   waktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.text,
                                              //   rencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.text,
                                              //   perlengkapanDanPeralatan: _perlengkapanDanPeralatanController.text,
                                              //   penutup: _penutupController.text,
                                              //   fotoPostinganKegiatan: _postinganKegiatanController,
                                              //   fotoSuratUndanganKegiatan: _suratUndanganKegiatanController,
                                              //   fotoLinimasaKegiatan: _linimasaKegiatanController,
                                              //   fotoTempatKegiatan: _fotoTempatKegiatanController,
                                              //   totalBiaya: totalBiaya,
                                              //   fileUsulanKegiatan: fileUsulanKegiatan,
                                              //   updatedAt: currentDate,
                                              //   updatedBy: user?.email,
                                              // ),
                                            ),
                                          );

                                          mipokaCustomToast("Usulan Kegiatan telah dikirim");
                                        } else {
                                          mipokaCustomToast("File gagal di Generate.");
                                        }
                                      }
                                    } else {
                                      mipokaCustomToast(emptyFieldMessage);
                                    }
                                  },
                                  text: widget.usulanArgs.isRevisiUsulan == true ? 'Kirim Revisi' : 'Kirim',
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (state is UsulanKegiatanError) {
                        return Text(state.message);
                      } else {
                        return const Center();
                      }
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

Future<String?> generateUsulanDocx(UsulanKegiatanModel usulanKegiatanModel) async {
  // const String localUrl = "http://localhost:3000/usulan-kegiatan";
  const String localUrl = "http://192.168.43.183:3000/usulan-kegiatan";

  print("generateUsulan triggered");
  try {
    final response = await DioUtil().dio.post(
      localUrl,
      data: usulanKegiatanModel.toJson(),
    );
    if (kDebugMode) {
      print(response.data);
    }
    return response.data.toString();
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return null;
}