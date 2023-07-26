import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mipoka/domain/utils/dio_util.dart';
import 'package:mipoka/mipoka/data/models/admin_model.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/data/models/jenis_kegaitan_mpt.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_per_periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/laporan_model.dart';
import 'package:mipoka/mipoka/data/models/mhs_per_periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/nama_kegiatan_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/notifikasi_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/peserta_kegiatan_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/prestasi_model.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_usulan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/riwayat_kegiatan_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/session_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';

abstract class MipokaDataSources {
  Future<List<BeritaModel>> readAllBerita(String filter);
  Future<BeritaModel> readBerita(int idBerita);
  Future<void> createBerita(BeritaModel beritaModel);
  Future<void> updateBerita(BeritaModel beritaModel);
  Future<void> deleteBerita(int beritaId);

  Future<AdminModel> readAdmin(int idAdmin);
  Future<void> createAdmin(AdminModel adminModel);
  Future<void> updateAdmin(AdminModel adminModel);
  Future<void> deleteAdmin(int adminId);

  Future<void> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatanModel biayaKegiatanModel,
  });
  Future<void> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<void> deleteBiayaKegiatan(int idNamaBiayaKegiatan);

  Future<List<JenisKegiatanMptModel>> readAllJenisKegiatanMpt(String filter);
  Future<JenisKegiatanMptModel> readJenisKegiatanMpt(int idJenisKegiatanMpt);
  Future<void> createJenisKegiatanMpt(JenisKegiatanMptModel jenisKegiatanMptModel);
  Future<void> updateJenisKegiatanMpt(JenisKegiatanMptModel jenisKegiatanMptModel);
  Future<void> deleteJenisKegiatanMpt(int idJenisKegiatanMpt);

  Future<List<KegiatanPerPeriodeMptModel>> readAllKegiatanPerPeriodeMpt(String filter);
  Future<KegiatanPerPeriodeMptModel> readKegiatanPerPeriodeMpt(int idKegiatanMpt);
  Future<void> createKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel);
  Future<void> updateKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel);
  Future<void> deleteKegiatanPerPeriodeMpt(int idKegiatanMpt);

  Future<List<LaporanModel>> readAllLaporan(String filter);
  Future<LaporanModel> readLaporan(int idLaporan);
  Future<void> createLaporan(LaporanModel laporanModel);
  Future<void> updateLaporan(LaporanModel laporanModel);
  Future<void> deleteLaporan(int idLaporan);

  Future<List<OrmawaModel>> readAllOrmawa();
  Future<OrmawaModel> readOrmawa(int idOrmawa);
  Future<void> createOrmawa(OrmawaModel ormawaModel);
  Future<void> updateOrmawa(OrmawaModel ormawaModel);
  Future<void> deleteOrmawa(int idOrmawa);

  Future<void> createPartisipan({
    required int idUsulanKegiatan,
    required PartisipanModel partisipanModel,
  });
  Future<void> updatePartisipan(PartisipanModel partisipanModel);
  Future<void> deletePartisipan(int idPartisipan);

  Future<List<PeriodeMptModel>> readAllPeriodeMpt();
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriodeMpt);
  Future<void> createPeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<void> updatePeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<void> deletePeriodeMpt(int idPeriode);

  Future<void> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel,
  });
  Future<void> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel);
  Future<void> deletePesertaKegiatanLaporan(int idPeserta);

  Future<List<PrestasiModel>> readAllPrestasi(String filter);
  Future<PrestasiModel> readPrestasi(int idPrestasi);
  Future<void> createPrestasi(PrestasiModel prestasiModel);
  Future<void> updatePrestasi(PrestasiModel prestasiModel);
  Future<void> deletePrestasi(int idPrestasi);

  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan);
  Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> deleteRevisiLaporan(int idRevisiLaporan);

  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan);
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> deleteRevisiUsulan(int idRevisiUsulan);

  Future<void> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatanModel rincianBiayaKegiatanModel,
  });
  Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<List<RiwayatMptModel>> readAllRiwayatMpt(String filter);
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt);
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptMode);
  Future<void> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> readAllSession(String filter);
  Future<SessionModel> readSession(int idSession);
  Future<void> createSession(SessionModel sessionModel);
  Future<void> updateSession(SessionModel sessionModel);
  Future<void> deleteSession(int idSession);

  Future<void> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcaraModel tertibAcaraModel,
  });
  Future<void> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<void> deleteTertibAcara(int idTertibAcara);

  Future<List<MipokaUserModel>> readAllMipokaUser();
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser);
  Future<MipokaUserModel> readMipokaUserByNim(String nim);
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> deleteMipokaUser(String idMipokaUser);

  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan(String filter);
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan);
  Future<void> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> deleteUsulanKegiatan(int idUsulan);

  Future<List<MhsPerPeriodeMptModel>> readAllMhsPerPeriodeMpt(String filter);
  Future<MhsPerPeriodeMptModel> readMhsPerPeriodeMpt(int idMhsPerPeriodeMpt);
  Future<void> createMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel);
  Future<void> updateMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel);
  Future<void> deleteMhsPerPeriodeMpt(int idMhsPerPeriodeMpt);

  Future<List<NamaKegiatanMptModel>> readAllNamaKegiatanMpt(int id);
  Future<NamaKegiatanMptModel> readNamaKegiatanMpt(int idNamaKegiatanMpt);
  Future<void> createNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel);
  Future<void> updateNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel);
  Future<void> deleteNamaKegiatanMpt(int idNamaKegiatanMpt);

  Future<List<NotifikasiModel>> readAllNotifikasi(String filter);
  Future<NotifikasiModel> readNotifikasi(int idNotifikasi);
  Future<void> createNotifikasi(NotifikasiModel notifikasiModel);
  Future<void> updateNotifikasi(NotifikasiModel notifikasiModel);
  Future<void> deleteNotifikasi(int idNotifikasi);
}

class MipokaDataSourcesImpl implements MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});

  final http.Client client;

  static const String beritaPath = "/berita";
  static const String jenisKegiatanPath = "/jenis_kegiatan_mpt";
  static const String kegiatanPerPeriodePath = "/kegiatan_per_periode_mpt";
  static const String laporanPath = "/laporan";
  static const String ormawaPath = "/ormawa";
  static const String periodeMptPath = "/periode_mpt";
  static const String prestasiPath = "/prestasi";
  static const String riwayatMptPath = "/riwayat_mpt";
  static const String sessionPath = "/session";
  static const String userPath = "/user";
  static const String usulanPath = "/usulan";
  static const String mhsPerPeriodePath = "/mhs_per_periode_mpt";
  static const String namaKegiatanMptPath = "/nama_kegiatan_mpt";

  @override
  Future<void> createBerita(BeritaModel beritaModel) async {
    try {
      final response = await DioUtil().dio.post(
        beritaPath,
        data: beritaModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteBerita(int idBerita) async {
    try {
      final response = await DioUtil().dio.delete(
        '$beritaPath/$idBerita',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<BeritaModel>> readAllBerita(String filter) async {
    try {
      final response = await DioUtil().dio.get(beritaPath);
      List<dynamic> resultList = response.data;

      List<BeritaModel> result = resultList
          .map((resultMap) => BeritaModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<BeritaModel> readBerita(int idBerita) async {
    print("");
    final String response =
    await rootBundle.loadString('assets/json_file/berita.json');
    dynamic jsonDecode = json.decode(response);

    BeritaModel result = BeritaModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateBerita(BeritaModel beritaModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$beritaPath/${beritaModel.idBerita}',
        data: beritaModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => Admin DataSources */
  @override
  Future<void> createAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }
  }

  @override
  Future<void> deleteAdmin(int idAdmin) async {
    if (kDebugMode) {
      print("Admin with id $idAdmin has been deleted.");
    }
  }

  @override
  Future<AdminModel> readAdmin(int idAdmin) async {
    final String response =
    await rootBundle.loadString('assets/json_file/admin.json');
    dynamic jsonDecode = json.decode(response);

    AdminModel result = AdminModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }
  }


  /* => BiayaKegiatan DataSources */
  @override
  Future<void> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatanModel biayaKegiatanModel,
  }) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteBiayaKegiatan(int idBiayaKegiatan) async {
    if (kDebugMode) {
      print("BiayaKegiatan with id $idBiayaKegiatan has been deleted.");
    }
  }

  @override
  Future<void> updateBiayaKegiatan(
      BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }
  }


  // => * JenisKegiatanMPT DataSources
  @override
  Future<void> createJenisKegiatanMpt(
      JenisKegiatanMptModel jenisKegiatanMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        jenisKegiatanPath,
        data: jenisKegiatanMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteJenisKegiatanMpt(int idJenisKegiatanMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$jenisKegiatanPath/$idJenisKegiatanMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<JenisKegiatanMptModel>> readAllJenisKegiatanMpt(
      String filter) async {
    try {
      final response = await DioUtil().dio.get(jenisKegiatanPath);
      List<dynamic> resultList = response.data;

      List<JenisKegiatanMptModel> result = resultList
          .map((resultMap) => JenisKegiatanMptModel.fromJson(resultMap))
          .toList();

      print('res :$result');
      if (kDebugMode) {

      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<JenisKegiatanMptModel> readJenisKegiatanMpt(
      int idJenisKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/jenis_kegiatan_mpt.json');
    dynamic jsonDecode = json.decode(response);

    JenisKegiatanMptModel result = JenisKegiatanMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateJenisKegiatanMpt(
      JenisKegiatanMptModel jenisKegiatanMptModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$jenisKegiatanPath/${jenisKegiatanMptModel.idJenisKegiatanMpt}',
        data: jenisKegiatanMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  // => * KegiatanPerPeriodeMPT DataSources
  @override
  Future<void> createKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanPerPeriodeMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        kegiatanPerPeriodePath,
        data: kegiatanPerPeriodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteKegiatanPerPeriodeMpt(int idKegiatanMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$kegiatanPerPeriodePath/$idKegiatanMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<KegiatanPerPeriodeMptModel>> readAllKegiatanPerPeriodeMpt(String filter) async {
    try {
      final response = await DioUtil().dio.get(kegiatanPerPeriodePath);
      List<dynamic> resultList = response.data;

      List<KegiatanPerPeriodeMptModel> result = resultList
          .map((resultMap) => KegiatanPerPeriodeMptModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<KegiatanPerPeriodeMptModel> readKegiatanPerPeriodeMpt(int idKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/kegiatan_per_periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    KegiatanPerPeriodeMptModel result = KegiatanPerPeriodeMptModel.fromJson(jsonDecode);

    if (kDebugMode) {
      print (idKegiatanMpt);
    }

    return result;
  }

  @override
  Future<void> updateKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanPerPeriodeMptModel) async {
    try {
      print("My Own Model : ${kegiatanPerPeriodeMptModel.toJson()}");
      final response = await DioUtil().dio.put(
        '$kegiatanPerPeriodePath/${kegiatanPerPeriodeMptModel.idKegiatanPerPeriodeMpt}',
        data: kegiatanPerPeriodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => Laporan DataSources */
  @override
  Future<void> createLaporan(LaporanModel laporanModel) async {
    try {
      final response = await DioUtil().dio.post(
        laporanPath,
        data: laporanModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteLaporan(int idLaporan) async {
    try {
      final response = await DioUtil().dio.delete(
        '$laporanPath/$idLaporan',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<LaporanModel>> readAllLaporan(String filter) async {
    try {
      final response = await DioUtil().dio.get(laporanPath);
      List<dynamic> resultList = response.data;

      List<LaporanModel> result = resultList
          .map((resultMap) => LaporanModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<LaporanModel> readLaporan(int idLaporan) async {
    try {
      final response = await DioUtil().dio.get("$laporanPath/$idLaporan");
      final result = LaporanModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateLaporan(LaporanModel laporanModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$laporanPath/${laporanModel.idLaporan}',
        data: laporanModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  //* => Ormawa DataSources */
  @override
  Future<void> createOrmawa(OrmawaModel ormawaModel) async {

    try {
      final response = await DioUtil().dio.post(
        ormawaPath,
        data: ormawaModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }

    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

  }

  @override
  Future<void> deleteOrmawa(int idOrmawa) async {
    try {
      final response = await DioUtil().dio.delete(
        '$ormawaPath/$idOrmawa',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<OrmawaModel>> readAllOrmawa() async {
    try {
      final response = await DioUtil().dio.get(ormawaPath);
      List<dynamic> resultList = response.data;

      List<OrmawaModel> result = resultList
          .map((resultMap) => OrmawaModel.fromJson(resultMap))
          .toList();

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<OrmawaModel> readOrmawa(int idOrmawa) async {
    // print("");
    // final String response =
    // await rootBundle.loadString('assets/json_file/ormawa.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // OrmawaModel result = OrmawaModel.fromJson(jsonDecode);
    //
    // return result;

    try {
      final response = await DioUtil().dio.get("$ormawaPath/$idOrmawa");
      final result = OrmawaModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateOrmawa(OrmawaModel ormawaModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$ormawaPath/${ormawaModel.idOrmawa}',
        data: ormawaModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
      print(ormawaModel.toJson());
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => Partisipan DataSources */
  @override
  Future<void> createPartisipan({
    required int idUsulanKegiatan,
    required PartisipanModel partisipanModel
  }) async {
    if (kDebugMode) {
      print(partisipanModel.toJson());
    }
  }

  @override
  Future<void> deletePartisipan(int idPartisipan) async {
    if (kDebugMode) {
      print("Partisipan with id $idPartisipan has been deleted.");
    }
  }

  @override
  Future<void> updatePartisipan(PartisipanModel partisipanModel) async {
    if (kDebugMode) {
      print(partisipanModel);
    }
  }


  /* PeriodeMpt DataSources */
  @override
  Future<void> createPeriodeMpt(PeriodeMptModel periodeMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        periodeMptPath,
        data: periodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deletePeriodeMpt(int idPeriodeMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$periodeMptPath/$idPeriodeMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<PeriodeMptModel>> readAllPeriodeMpt() async {
    try {
      final response = await DioUtil().dio.get(periodeMptPath);
      List<dynamic> resultList = response.data;

      List<PeriodeMptModel> result = resultList
          .map((resultMap) => PeriodeMptModel.fromJson(resultMap))
          .toList();

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriodeMpt) async {
    print("");
    final String response =
    await rootBundle.loadString('assets/json_file/periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    PeriodeMptModel result = PeriodeMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updatePeriodeMpt(PeriodeMptModel periodeMptModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$periodeMptPath/${periodeMptModel.idPeriodeMpt}',
        data: periodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => PesertaKegiatanLaporan */
  @override
  Future<void> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel
  }) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }
  }

  @override
  Future<void> deletePesertaKegiatanLaporan(int idPeserta) async {
    if (kDebugMode) {
      print("Peserta with id $idPeserta has been deleted.");
    }
  }

  @override
  Future<void> updatePesertaKegiatanLaporan(
      PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }
  }


  /* Prestasi DataSources */
  @override
  Future<void> createPrestasi(PrestasiModel prestasiModel) async {
    try {
      final response = await DioUtil().dio.post(
        prestasiPath,
        data: prestasiModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deletePrestasi(int idPrestasi) async {
    try {
      final response = await DioUtil().dio.delete(
        '$prestasiPath/$idPrestasi',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<PrestasiModel>> readAllPrestasi(String filter) async {
    try {
      final response = await DioUtil().dio.get(prestasiPath);
      List<dynamic> resultList = response.data;

      List<PrestasiModel> result = resultList
          .map((resultMap) => PrestasiModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<PrestasiModel> readPrestasi(int idPrestasi) async {
    print("");
    final String response =
    await rootBundle.loadString('assets/json_file/prestasi.json');
    dynamic jsonDecode = json.decode(response);

    PrestasiModel result = PrestasiModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updatePrestasi(PrestasiModel prestasiModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$prestasiPath/${prestasiModel.idPrestasi}',
        data: prestasiModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => RevisiLaporan DataSources */
  @override
  Future<void> createRevisiLaporan(
      RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }

  @override
  Future<void> deleteRevisiLaporan(int idRevisiLaporan) async {
    if (kDebugMode) {
      print("RevisiLaporan with id $idRevisiLaporan has been deleted.");
    }
  }

  @override
  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_laporan.json');
    dynamic jsonDecode = json.decode(response);

    RevisiLaporanModel result = RevisiLaporanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateRevisiLaporan(
      RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }


  /* => RevisiUsulan DataSources */
  @override
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }

  @override
  Future<void> deleteRevisiUsulan(int idRevisiUsulan) async {
    if (kDebugMode) {
      print("RevisiUsulan with id $idRevisiUsulan has been deleted.");
    }
  }

  @override
  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_usulan.json');
    dynamic jsonDecode = json.decode(response);

    RevisiUsulanModel result = RevisiUsulanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }


  /* => RincianBiayaKegiatan DataSources */
  @override
  Future<void> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatanModel rincianBiayaKegiatanModel
  }) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    if (kDebugMode) {
      print(
          "RincianBiayaKegiatan with id $idRincianBiayaKegiatan has been deleted.");
    }
  }

  @override
  Future<void> updateRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }


  /* => RiwayatMpt */
  @override
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        riwayatMptPath,
        data: riwayatMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteRiwayatMpt(int idRiwayatMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$riwayatMptPath/$idRiwayatMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<RiwayatMptModel>> readAllRiwayatMpt(String filter) async {
    try {
      final response = await DioUtil().dio.get(riwayatMptPath);
      List<dynamic> resultList = response.data;

      List<RiwayatMptModel> result = resultList
          .map((resultMap) => RiwayatMptModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt) async {
    // final String response =
    // await rootBundle.loadString('assets/json_file/riwayat_kegiatan_mpt.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // RiwayatMptModel result = RiwayatMptModel.fromJson(jsonDecode);
    //
    // return result;
    try {
      final response = await DioUtil().dio.get("$riwayatMptPath/$idRiwayatMpt");
      print(response.data);
      final result = RiwayatMptModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$riwayatMptPath/${riwayatMptModel.idRiwayatKegiatanMpt}',
        data: riwayatMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => Session DataSources */
  @override
  Future<void> createSession(SessionModel sessionModel) async {
    try {
      final response = await DioUtil().dio.post(
        sessionPath,
        data: sessionModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteSession(int idSession) async {
    try {
      final response = await DioUtil().dio.delete(
        '$sessionPath/$idSession',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<SessionModel>> readAllSession(String filter) async {
    try {
      final response = await DioUtil().dio.get(sessionPath);
      List<dynamic> resultList = response.data;

      List<SessionModel> result = resultList
          .map((resultMap) => SessionModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<SessionModel> readSession(int idSession) async {
    // final String response =
    // await rootBundle.loadString('assets/json_file/session.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // SessionModel result = SessionModel.fromJson(jsonDecode);
    //
    // return result;
    try {
      final response = await DioUtil().dio.get("$sessionPath/$idSession");
      final result = SessionModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateSession(SessionModel sessionModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$sessionPath/${sessionModel.idSession}',
        data: sessionModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* => TertibAcara */
  @override
  Future<void> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcaraModel tertibAcaraModel
  }) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }
  }

  @override
  Future<void> deleteTertibAcara(int idTertibAcara) async {
    if (kDebugMode) {
      print("TertibAcara with id $idTertibAcara has been deleted.");
    }
  }

  @override
  Future<void> updateTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }
  }


  /* => MipokaUser DataSources */
  @override
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel) async {
    try {
      final response = await DioUtil().dio.post(
        userPath,
        data: mipokaUserModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteMipokaUser(String idMipokaUser) async {
    try {
      final response = await DioUtil().dio.delete(
        '$userPath/$idMipokaUser',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<MipokaUserModel>> readAllMipokaUser() async {
    try {
      final response = await DioUtil().dio.get(userPath);
      List<dynamic> resultList = response.data;

      List<MipokaUserModel> result = resultList
          .map((resultMap) => MipokaUserModel.fromJson(resultMap))
          .toList();

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser) async {
    try {
      final response = await DioUtil().dio.get("$userPath/$idMipokaUser");
      final result = MipokaUserModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
    // final String response =
    // await rootBundle.loadString('assets/json_file/mipoka_user.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // MipokaUserModel result = MipokaUserModel.fromJson(jsonDecode);
    //
    // return result;
  }

  @override
  Future<MipokaUserModel> readMipokaUserByNim(String nim) async {
    try {
      final response = await DioUtil().dio.get("$userPath/nim/$nim");
      final result = MipokaUserModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
    // final String response =
    // await rootBundle.loadString('assets/json_file/mipoka_user.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // MipokaUserModel result = MipokaUserModel.fromJson(jsonDecode);
    //
    // if (kDebugMode) {
    //   print(nim);
    // }
    //
    // return result;
  }

  @override
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$userPath/${mipokaUserModel.idUser}',
        data: mipokaUserModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /* Create Usulan Kegiatan */
  @override
  Future<void> createUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    // print(usulanKegiatanModel.toJson());
    try {
      final response = await DioUtil().dio.post(
        usulanPath,
        data: usulanKegiatanModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteUsulanKegiatan(int idUsulan) async {
    try {
      final response = await DioUtil().dio.delete(
        '$usulanPath/$idUsulan',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // if (kDebugMode) {
    //   print("UsulanKegiatan with id $idUsulan has been deleted.");
    // }
  }

  @override
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan(String filter) async {
    try {
      final response = await DioUtil().dio.get(usulanPath);
      List<dynamic> resultList = response.data;

      List<UsulanKegiatanModel> result = resultList
          .map((resultMap) => UsulanKegiatanModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
    // final String response =
    // await rootBundle.loadString('assets/json_file/usulan_kegiatan_list.json');
    // List<dynamic> resultList = json.decode(response);
    //
    // List<UsulanKegiatanModel> result =
    // resultList.map((resultMap) => UsulanKegiatanModel.fromJson(resultMap))
    //     .toList();
    //
    // if (kDebugMode) {
    //   print(filter);
    // }
    //
    // return result;
  }

  @override
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
    try {
      final response = await DioUtil().dio.get("$usulanPath/$idUsulanKegiatan");
      print(response.data);
      final result = UsulanKegiatanModel.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
    // final String response =
    // await rootBundle.loadString('assets/json_file/usulan_kegiatan.json');
    // dynamic jsonDecode = json.decode(response);
    //
    // UsulanKegiatanModel result = UsulanKegiatanModel.fromJson(jsonDecode);
    //
    // return result;
  }

  @override
  Future<void> updateUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$usulanPath/${usulanKegiatanModel.idUsulan}',
        data: usulanKegiatanModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // if (kDebugMode) {
    //   print(usulanKegiatanModel.toJson());
    // }
  }

  // * => MhsPerPeriodeMpt DataSources
  @override
  Future<void> createMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        mhsPerPeriodePath,
        data: mhsPerPeriodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$mhsPerPeriodePath/$idMhsPerPeriodeMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<MhsPerPeriodeMptModel>> readAllMhsPerPeriodeMpt(String filter) async {
    try {
      final response = await DioUtil().dio.get(mhsPerPeriodePath);
      List<dynamic> resultList = response.data;

      List<MhsPerPeriodeMptModel> result = resultList
          .map((resultMap) => MhsPerPeriodeMptModel.fromJson(resultMap))
          .toList();

      if (kDebugMode) {
        print(filter);
      }

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<MhsPerPeriodeMptModel> readMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/mhs_per_periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    MhsPerPeriodeMptModel result = MhsPerPeriodeMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$mhsPerPeriodePath/${mhsPerPeriodeMptModel.idMhsPerPeriodeMpt}',
        data: mhsPerPeriodeMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  // * => NamaKegiatanMpt DataSources
  @override
  Future<void> createNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel) async {
    try {
      final response = await DioUtil().dio.post(
        namaKegiatanMptPath,
        data: namaKegiatanMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> deleteNamaKegiatanMpt(int idNamaKegiatanMpt) async {
    try {
      final response = await DioUtil().dio.delete(
        '$namaKegiatanMptPath/$idNamaKegiatanMpt',
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<List<NamaKegiatanMptModel>> readAllNamaKegiatanMpt(int id) async {
    try {
      final response = await DioUtil().dio.get(namaKegiatanMptPath);
      List<dynamic> resultList = response.data;

      List<NamaKegiatanMptModel> result = resultList
          .map((resultMap) => NamaKegiatanMptModel.fromJson(resultMap))
          .toList();

      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  @override
  Future<NamaKegiatanMptModel> readNamaKegiatanMpt(int idNamaKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/nama_kegiatan_mpt.json');
    dynamic jsonDecode = json.decode(response);

    NamaKegiatanMptModel result = NamaKegiatanMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel) async {
    try {
      final response = await DioUtil().dio.put(
        '$namaKegiatanMptPath/${namaKegiatanMptModel.idNamaKegiatanMpt}',
        data: namaKegiatanMptModel.toJson(),
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  // * => Notifikasi DataSources
  @override
  Future<void> createNotifikasi(NotifikasiModel notifikasiModel) async {
    if (kDebugMode) {
      print(notifikasiModel.toJson());
    }
  }

  @override
  Future<void> deleteNotifikasi(int idNotifikasi) async {
    if (kDebugMode) {
      print("Notifikasi with id $idNotifikasi has been deleted.");
    }
  }

  @override
  Future<List<NotifikasiModel>> readAllNotifikasi(String filter) async {
    final String response =
        await rootBundle.loadString('assets/json_file/notifikasi_list.json');
    List<dynamic> resultList = json.decode(response);

    List<NotifikasiModel> result =
    resultList.map((resultMap) => NotifikasiModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<NotifikasiModel> readNotifikasi(int idNotifikasi) async {
    final String response =
    await rootBundle.loadString('assets/json_file/notifikasi.json');
    dynamic jsonDecode = json.decode(response);

    NotifikasiModel result = NotifikasiModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateNotifikasi(NotifikasiModel notifikasiModel) async {
    if (kDebugMode) {
      print(notifikasiModel.toJson());
    }
  }
}
