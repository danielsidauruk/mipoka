import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mipoka/mipoka/data/models/admin_model.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/laporan_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/peserta_kegiatan_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/prestasi_model.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_usulan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/riwayat_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/session_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';

abstract class MipokaDataSources {
  Future<List<BeritaModel>> readAllBerita();
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

  Future<List<KegiatanMptModel>> readAllKegiatanMpt();
  Future<KegiatanMptModel> readKegiatanMpt(int idKegiatanMpt);
  Future<void> createKegiatanMpt(KegiatanMptModel kegiatanMptModel);
  Future<void> updateKegiatanMpt(KegiatanMptModel kegiatanMptModel);
  Future<void> deleteKegiatanMpt(int idKegiatanMpt);

  Future<List<LaporanModel>> readAllLaporan();
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

  Future<List<PrestasiModel>> readAllPrestasi();
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

  Future<List<RiwayatMptModel>> readAllRiwayatMpt();
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt);
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptMode);
  Future<void> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> readAllSession();
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
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> deleteMipokaUser(String idMipokaUser);

  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan();
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan);
  Future<void> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> deleteUsulanKegiatan(int idUsulan);
}

class MipokaDataSourcesImpl implements MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  Future<void> createBerita(BeritaModel beritaModel) async {
    // TODO: implement createBerita
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBerita(int beritaId) async {
    // TODO: implement deleteBerita
    throw UnimplementedError();
  }

  @override
  Future<List<BeritaModel>> readAllBerita() async {
    // TODO: implement readAllBerita
    throw UnimplementedError();
  }

  @override
  Future<BeritaModel> readBerita(int idBerita) async {
    // TODO: implement readBerita
    throw UnimplementedError();
  }

  @override
  Future<void> updateBerita(BeritaModel beritaModel) async {
    int a;

    a = beritaModel.idBerita;
    // TODO: implement updateBerita
    throw UnimplementedError();
  }


  // TODO: => Admin DataSources
  @override
  Future<void> createAdmin(AdminModel adminModel) async {
    // TODO: implement createAdmin
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAdmin(int adminId) async {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> readAdmin(int idAdmin) async {
    // TODO: implement readAdmin
    throw UnimplementedError();
  }

  @override
  Future<void> updateAdmin(AdminModel adminModel) async {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }


  // TODO: => BiayaKegiatan DataSources
  @override
  Future<void> createBiayaKegiatan({required int idUsulanKegiatan, required BiayaKegiatanModel biayaKegiatanModel}) async {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBiayaKegiatan(int idNamaBiayaKegiatan) async {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) async {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }


  // TODO : KegiatanMPT DataSources
  @override
  Future<void> createKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
    // TODO: implement createKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<void> deleteKegiatanMpt(int idKegiatanMpt) async {
    // TODO: implement deleteKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<List<KegiatanMptModel>> readAllKegiatanMpt() async {
    // TODO: implement readAllKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<KegiatanMptModel> readKegiatanMpt(int idKegiatanMpt) async {
    // TODO: implement readKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<void> updateKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
    // TODO: implement updateKegiatanMpt
    throw UnimplementedError();
  }


  // TODO: => Berita DataSources
  @override
  Future<void> createLaporan(LaporanModel laporanModel) async {
    // TODO: implement createLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLaporan(int idLaporan) async {
    // TODO: implement deleteLaporan
    throw UnimplementedError();
  }

  @override
  Future<List<LaporanModel>> readAllLaporan() async {
    // TODO: implement readAllLaporan
    throw UnimplementedError();
  }

  @override
  Future<LaporanModel> readLaporan(int idLaporan) async {
    // TODO: implement readLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> updateLaporan(LaporanModel laporanModel) async {
    // TODO: implement updateLaporan
    throw UnimplementedError();
  }


  // TODO: => Ormawa DataSources
  @override
  Future<void> createOrmawa(OrmawaModel ormawaModel) async {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrmawa(int idOrmawa) async {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }

  @override
  Future<List<OrmawaModel>> readAllOrmawa() async {
    // TODO: implement readAllOrmawa
    throw UnimplementedError();
  }

  @override
  Future<OrmawaModel> readOrmawa(int idOrmawa) async {
    // TODO: implement readOrmawa
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrmawa(OrmawaModel ormawaModel) async {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }


  // TODO: => Partisipan DataSources
  @override
  Future<void> createPartisipan({required int idUsulanKegiatan, required PartisipanModel partisipanModel}) async {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }

  @override
  Future<void> deletePartisipan(int idPartisipan) async {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }

  @override
  Future<void> updatePartisipan(PartisipanModel partisipanModel) async {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }


  // TODO: => PeriodeMpt DataSources
  @override
  Future<void> createPeriodeMpt(PeriodeMptModel periodeMptModel) async {
    // TODO: implement createPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<void> deletePeriodeMpt(int idPeriode) async {
    // TODO: implement deletePeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<List<PeriodeMptModel>> readAllPeriodeMpt() async {
    // TODO: implement readAllPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriodeMpt) async {
    // TODO: implement readPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<void> updatePeriodeMpt(PeriodeMptModel periodeMptModel) async {
    // TODO: implement updatePeriodeMpt
    throw UnimplementedError();
  }


  // TODO: => PesertaKegiatanLaporan
  @override
  Future<void> createPesertaKegiatanLaporan({required int idLaporan, required PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel}) async {
    // TODO: implement createPesertaKegiatanLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> deletePesertaKegiatanLaporan(int idPeserta) async {
    // TODO: implement deletePesertaKegiatanLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
    // TODO: implement updatePesertaKegiatanLaporan
    throw UnimplementedError();
  }


  // TODO: => Prestasi DataSources
  @override
  Future<void> createPrestasi(PrestasiModel prestasiModel) async {
    // TODO: implement createPrestasi
    throw UnimplementedError();
  }

  @override
  Future<void> deletePrestasi(int idPrestasi) async {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }

  @override
  Future<List<PrestasiModel>> readAllPrestasi() async {
    // TODO: implement readAllPrestasi
    throw UnimplementedError();
  }

  @override
  Future<PrestasiModel> readPrestasi(int idPrestasi) async {
    // TODO: implement readPrestasi
    throw UnimplementedError();
  }

  @override
  Future<void> updatePrestasi(PrestasiModel prestasiModel) async {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }


  // TODO: => RevisiLaporan DataSources
  @override
  Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
    // TODO: implement createRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRevisiLaporan(int idRevisiLaporan) async {
    // TODO: implement deleteRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan) async {
    // TODO: implement readRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
    // TODO: implement updateRevisiLaporan
    throw UnimplementedError();
  }


  // TODO: => RevisiUsulan DataSources
  @override
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    // TODO: implement createRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRevisiUsulan(int idRevisiUsulan) async {
    // TODO: implement deleteRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan) async {
    // TODO: implement readRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    // TODO: implement updateRevisiUsulan
    throw UnimplementedError();
  }


  // TODO: => RincianBiayaKegiatan DataSources
  @override
  Future<void> createRincianBiayaKegiatan({required int idLaporan, required RincianBiayaKegiatanModel rincianBiayaKegiatanModel}) async {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }


  // TODO: => RiwayatMpt
  @override
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRiwayatMpt(int idRiwayatMpt) async {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<List<RiwayatMptModel>> readAllRiwayatMpt() async {
    // TODO: implement readAllRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt) async {
    // TODO: implement readRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }


  // TODO: => Session DataSources
  @override
  Future<void> createSession(SessionModel sessionModel) async {
    // TODO: implement createSession
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSession(int idSession) async {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }

  @override
  Future<List<SessionModel>> readAllSession() async {
    // TODO: implement readAllSession
    throw UnimplementedError();
  }

  @override
  Future<SessionModel> readSession(int idSession) async {
    // TODO: implement readSession
    throw UnimplementedError();
  }

  @override
  Future<void> updateSession(SessionModel sessionModel) async {
    // TODO: implement updateSession
    throw UnimplementedError();
  }


  // TODO: => TertibAcara
  @override
  Future<void> createTertibAcara({required int idUsulanKegiatan, required TertibAcaraModel tertibAcaraModel}) async {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTertibAcara(int idTertibAcara) async {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<void> updateTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }


  // TODO: => MipokaUser DataSources
  @override
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel) async {
    // TODO: implement createMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMipokaUser(String idMipokaUser) async {
    // TODO: implement deleteMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<List<MipokaUserModel>> readAllMipokaUser() async {
    // TODO: implement readAllMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser) async {
    // TODO: implement readMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel) async {
    // TODO: implement updateMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<void> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) async {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUsulanKegiatan(int idUsulan) async {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan() async {
    // TODO: implement readAllUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
    // TODO: implement readUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) async {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }

  // // => BeritaModel Repositories
  // @override
  // Future<List<BeritaModel>> readAllBerita() async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/berita_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<BeritaModel> result =
  //   resultList.map((resultMap) => BeritaModel.fromJson(resultMap)).toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<BeritaModel> readBerita(int idBerita) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/berita.json');
  //   dynamic jsonDecode = json.decode(response);
  //
  //   BeritaModel result = BeritaModel.fromJson(jsonDecode);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> createBerita(BeritaModel beritaModel) async {
  //   if (kDebugMode) {
  //     print(beritaModel.toJson());
  //   }
  //
  //   return "Berita has been created successfully.";
  // }
  //
  // @override
  // Future<String> updateBerita(BeritaModel beritaModel) async {
  //   if (kDebugMode) {
  //     print(beritaModel.toJson());
  //   }
  //
  //   return "Berita has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteBerita(int beritaId) async {
  //   if (kDebugMode) {
  //     print('Berita with ID $beritaId has been deleted successfully.');
  //   }
  //
  //   return "Berita has been deleted successfully.";
  // }
  //
  // // => AdminModel Repositories
  // @override
  // Future<String> createAdmin(AdminModel adminModel) async {
  //   if (kDebugMode) {
  //     print(adminModel.toJson());
  //   }
  //
  //   return "Admin has been created successfully.";
  // }
  //
  // @override
  // Future<AdminModel> readAdmin(int idAdmin) async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/admin.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   AdminModel result = AdminModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateAdmin(AdminModel adminModel) async {
  //   if (kDebugMode) {
  //     print(adminModel.toJson());
  //   }
  //
  //   return "Admin has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteAdmin(int adminId) async {
  //   if (kDebugMode) {
  //     print('Admin with ID $adminId has been deleted successfully.');
  //   }
  //
  //   return "Berita has been deleted successfully.";
  // }
  //
  // // => Biaya kegiatanModel (~)
  // @override
  // Future<List<BiayaKegiatanModel>> readAllBiayaKegiatan() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/biaya.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<BiayaKegiatanModel> result = resultList
  //       .map((resultMap) => BiayaKegiatanModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<BiayaKegiatanModel> readBiayaKegiatan(int biayaKegiatan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/kegiatan_mpt.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   BiayaKegiatanModel result = BiayaKegiatanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> createBiayaKegiatan(
  //     BiayaKegiatanModel biayaKegiatanModel) async {
  //   if (kDebugMode) {
  //     print(biayaKegiatanModel.toJson());
  //   }
  //
  //   return "Biaya has been created successfully.";
  // }
  //
  // @override
  // Future<String> updateBiayaKegiatan(
  //     BiayaKegiatanModel biayaKegiatanModel) async {
  //   if (kDebugMode) {
  //     print(biayaKegiatanModel.toJson());
  //   }
  //
  //   return "Biaya Kegiatan has been updated successfully.";
  // }
  //
  // // => kegiatanModel
  // @override
  // Future<String> createKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
  //   if (kDebugMode) {
  //     print(kegiatanMptModel.toJson());
  //   }
  //
  //   return "Kegiatan has been created successfully.";
  // }
  //
  // @override
  // Future<KegiatanMptModel> readKegiatanMpt(int idKegiatanMpt) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/kegiatan_mpt.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   KegiatanMptModel result = KegiatanMptModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<List<KegiatanMptModel>> readAllKegiatanMpt() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/kegiatan_mpt_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<KegiatanMptModel> result = resultList
  //       .map((resultMap) => KegiatanMptModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
  //   if (kDebugMode) {
  //     print(kegiatanMptModel.toJson());
  //   }
  //
  //   return "Kegiatan has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteKegiatanMpt(int kegiatanId) async {
  //   if (kDebugMode) {
  //     print('Kegiatan with ID $kegiatanId has been deleted successfully.');
  //   }
  //
  //   return "Berita has been deleted successfully.";
  // }
  //
  // // Laporan
  // @override
  // Future<String> createLaporan(LaporanModel laporanModel) async {
  //   if (kDebugMode) {
  //     print(laporanModel.toJson());
  //   }
  //
  //   return "Laporan has been created successfully.";
  // }
  //
  // @override
  // Future<List<LaporanModel>> readAllLaporan() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/laporan_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<LaporanModel> result = resultList
  //       .map((resultMap) => LaporanModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<LaporanModel> readLaporan(int idLaporan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/laporan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   LaporanModel result = LaporanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateLaporan(LaporanModel laporanModel) async {
  //   if (kDebugMode) {
  //     print(laporanModel.toJson());
  //   }
  //
  //   return "Lampiran has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteLaporan(int laporanId) async {
  //   if (kDebugMode) {
  //     print('Laporan with ID $laporanId has been deleted successfully.');
  //   }
  //
  //   return "Laporan has been deleted successfully.";
  // }
  //
  // // => Ormawa
  // @override
  // Future<String> createOrmawa(OrmawaModel ormawaModel) async {
  //   if (kDebugMode) {
  //     print(ormawaModel.toJson());
  //   }
  //
  //   return "Ormawa has been created successfully.";
  // }
  //
  // @override
  // Future<List<OrmawaModel>> readAllOrmawa() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/ormawa_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<OrmawaModel> result =
  //       resultList.map((resultMap) => OrmawaModel.fromJson(resultMap)).toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<OrmawaModel> readOrmawa(int idOrmawa) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/ormawa.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   OrmawaModel result = OrmawaModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateOrmawa(OrmawaModel ormawaModel) async {
  //   if (kDebugMode) {
  //     print(ormawaModel.toJson());
  //   }
  //
  //   return "Ormawa has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteOrmawa(int idOrmawa) async {
  //   if (kDebugMode) {
  //     print('Ormawa with ID $idOrmawa has been deleted successfully.');
  //   }
  //
  //   return "Ormawa has been deleted successfully.";
  // }
  //
  // // => PartisipanModel
  // @override
  // Future<String> createPartisipan(PartisipanModel partisipanModel) async {
  //   if (kDebugMode) {
  //     print(partisipanModel.toJson());
  //   }
  //
  //   return "Partisipan has been created successfully.";
  // }
  //
  // @override
  // Future<List<PartisipanModel>> readAllPartisipan() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/partisipan.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<PartisipanModel> result = resultList
  //       .map((resultMap) => PartisipanModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<PartisipanModel> readPartisipan(int idPartisipan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/partisipan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   PartisipanModel result = PartisipanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updatePartisipan(PartisipanModel partisipanModel) async {
  //   if (kDebugMode) {
  //     print(partisipanModel.toJson());
  //   }
  //
  //   return "Partisipan has been updated successfully.";
  // }
  //
  // // => Periode
  // @override
  // Future<String> createPeriodeMpt(PeriodeMptModel periodeMptModel) async {
  //   if (kDebugMode) {
  //     print(periodeMptModel.toJson());
  //   }
  //
  //   return "Periode has been created successfully.";
  // }
  //
  // @override
  // Future<List<PeriodeMptModel>> readAllPeriodeMpt() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/periode_mpt_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<PeriodeMptModel> result = resultList
  //       .map((resultMap) => PeriodeMptModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<PeriodeMptModel> readPeriodeMpt(int idPeriode) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/periode_mpt.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   PeriodeMptModel result = PeriodeMptModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updatePeriodeMpt(PeriodeMptModel periodeMptModel) async {
  //   if (kDebugMode) {
  //     print(periodeMptModel.toJson());
  //   }
  //
  //   return "Periode has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deletePeriodeMpt(int idPeriode) async {
  //   if (kDebugMode) {
  //     print('Periode with ID $idPeriode has been deleted successfully.');
  //   }
  //
  //   return "Periode has been deleted successfully.";
  // }
  //
  // // => pesertaKegiatanLaporanModel
  // @override
  // Future<String> createPesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
  //   if (kDebugMode) {
  //     print(pesertaKegiatanLaporanModel.toJson());
  //   }
  //
  //   return "Peserta has been created successfully.";
  // }
  //
  // @override
  // Future<List<PesertaKegiatanLaporanModel>> readAllPesertaKegiatanLaporan() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/peserta.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<PesertaKegiatanLaporanModel> result = resultList
  //       .map((resultMap) => PesertaKegiatanLaporanModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<PesertaKegiatanLaporanModel> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/periode_mpt.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   PesertaKegiatanLaporanModel result = PesertaKegiatanLaporanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
  //   if (kDebugMode) {
  //     print(pesertaKegiatanLaporanModel.toJson());
  //   }
  //
  //   return "Peserta has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deletePeserta(int idPeserta) async {
  //   if (kDebugMode) {
  //     print('Peserta with ID $idPeserta has been deleted successfully.');
  //   }
  //
  //   return "Peserta has been deleted successfully.";
  // }
  //
  // // => PrestasiModel
  // @override
  // Future<String> createPrestasi(PrestasiModel prestasiModel) async {
  //   if (kDebugMode) {
  //     print(prestasiModel.toJson());
  //   }
  //
  //   return "Prestasi has been created successfully.";
  // }
  //
  // @override
  // Future<List<PrestasiModel>> readAllPrestasi() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/prestasi_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<PrestasiModel> result = resultList
  //       .map((resultMap) => PrestasiModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<PrestasiModel> readPrestasi(int idPrestasi) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/prestasi.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   PrestasiModel result = PrestasiModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updatePrestasi(PrestasiModel prestasiModel) async {
  //   if (kDebugMode) {
  //     print(prestasiModel.toJson());
  //   }
  //
  //   return "Prestasi has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deletePrestasi(int idPrestasi) async {
  //   if (kDebugMode) {
  //     print('Prestasi with ID $idPrestasi has been deleted successfully.');
  //   }
  //
  //   return "Prestasi has been deleted successfully.";
  // }
  //
  // // => Revisi Laporan Model
  // @override
  // Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/revisi_laporan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   RevisiLaporanModel result = RevisiLaporanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
  //   if (kDebugMode) {
  //     print(revisiLaporanModel.toJson());
  //   }
  // }
  //
  // @override
  // Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
  //   if (kDebugMode) {
  //     print(revisiLaporanModel.toJson());
  //   }
  // }
  //
  // @override
  // Future<void> deleteRevisiLaporan(int idRevisiLaporan) async {
  //   if (kDebugMode) {
  //     print(
  //         'Rincian Biaya Kegiatan with ID $idRevisiLaporan has been deleted successfully.');
  //   }
  // }
  //
  //
  // // => Revisi Usulan
  // @override
  // Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/revisi_usulan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   RevisiUsulanModel result = RevisiUsulanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
  //   if (kDebugMode) {
  //     print(revisiUsulanModel.toJson());
  //   }
  // }
  //
  // @override
  // Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
  //   if (kDebugMode) {
  //     print(revisiUsulanModel.toJson());
  //   }
  // }
  // @override
  // Future<void> deleteRevisiUsulan(int idRevisiUsulan) async {
  //   if (kDebugMode) {
  //     print(
  //         'Rincian Biaya Kegiatan with ID $idRevisiUsulan has been deleted successfully.');
  //   }
  // }
  //
  // // => Rincian Biaya kegiatanModel (~)
  // @override
  // Future<RincianBiayaKegiatanModel> readRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/revisi_usulan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   RincianBiayaKegiatanModel result = RincianBiayaKegiatanModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<void> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel)async {
  //   if (kDebugMode) {
  //     print(rincianBiayaKegiatanModel.toJson());
  //   }
  // }
  //
  // @override
  // Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
  //   if (kDebugMode) {
  //     print(rincianBiayaKegiatanModel.toJson());
  //   }
  // }
  //
  // @override
  // Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
  //   if (kDebugMode) {
  //     print(
  //         'Rincian Biaya Kegiatan with ID $idRincianBiayaKegiatan has been deleted successfully.');
  //   }
  // }
  //
  // // => Riwayat MPT
  // @override
  // Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
  //   if (kDebugMode) {
  //     print(riwayatMptModel.toJson());
  //   }
  //
  //   return "Riwayat MPT has been created successfully.";
  // }
  //
  // @override
  // Future<List<RiwayatMptModel>> readAllRiwayatMpt() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/riwayat_mpt_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<RiwayatMptModel> result = resultList
  //       .map((resultMap) => RiwayatMptModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/revisi_usulan.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   RiwayatMptModel result = RiwayatMptModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
  //   if (kDebugMode) {
  //     print(riwayatMptModel.toJson());
  //   }
  //
  //   return "Riwayat MPT has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteRiwayatMpt(int idRiwayatMpt) async {
  //   if (kDebugMode) {
  //     print('Riwayat MPT with ID $idRiwayatMpt has been deleted successfully.');
  //   }
  //
  //   return "Riwayat MPT has been deleted successfully.";
  // }
  //
  // // => SessionModel
  // @override
  // Future<String> createSession(SessionModel sessionModel) async {
  //   if (kDebugMode) {
  //     print(sessionModel.toJson());
  //   }
  //
  //   return "Session has been created successfully.";
  // }
  //
  // @override
  // Future<List<SessionModel>> readAllSession() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/session_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<SessionModel> result = resultList
  //       .map((resultMap) => SessionModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<SessionModel> readSession(int idSession) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/session.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   SessionModel result = SessionModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateSession(SessionModel sessionModel) async {
  //   if (kDebugMode) {
  //     print(sessionModel.toJson());
  //   }
  //
  //   return "Session has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteSession(int idSession) async {
  //   if (kDebugMode) {
  //     print('Session with ID $idSession has been deleted successfully.');
  //   }
  //
  //   return "Session has been deleted successfully.";
  // }
  //
  // // => Tertib Acara (~)
  // @override
  // Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel) async {
  //   if (kDebugMode) {
  //     print(tertibAcaraModel.toJson());
  //   }
  //
  //   return "Tertib Acara has been created successfully.";
  // }
  //
  // @override
  // Future<List<TertibAcaraModel>> readAllTertibAcara() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/tertib_acara.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<TertibAcaraModel> result = resultList
  //       .map((resultMap) => TertibAcaraModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<TertibAcaraModel> readTertibAcara(int idTertibAcara) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/session.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   TertibAcaraModel result = TertibAcaraModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel) async {
  //   if (kDebugMode) {
  //     print(tertibAcaraModel.toJson());
  //   }
  //
  //   return "Tertib Acara has been updated successfully.";
  // }
  //
  // // => MipokaUserModel
  // @override
  // Future<String> createMipokaUser(MipokaUserModel userModel) async {
  //   if (kDebugMode) {
  //     print(userModel.toJson());
  //   }
  //
  //   return "User has been created successfully.";
  // }
  //
  // @override
  // Future<List<MipokaUserModel>> readAllMipokaUser() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/mipoka_user_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<MipokaUserModel> result = resultList
  //       .map((resultMap) => MipokaUserModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<MipokaUserModel> readMipokaUser(String idUser) async {
  //   final String response =
  //   await rootBundle.loadString('assets/json_file/mipoka_user.json');
  //   dynamic jsonResult = json.decode(response);
  //
  //   MipokaUserModel result = MipokaUserModel.fromJson(jsonResult);
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateMipokaUser(MipokaUserModel userModel) async {
  //   if (kDebugMode) {
  //     print(userModel.toJson());
  //   }
  //
  //   return "User has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteMipokaUser(String idMipokaUser) async {
  //   if (kDebugMode) {
  //     print('User with ID $idMipokaUser has been deleted successfully.');
  //   }
  //
  //   return "User has been deleted successfully.";
  // }
  //
  // // => Usulan
  // @override
  // Future<String> createUsulanKegiatan(
  //     UsulanKegiatanModel usulanKegiatanModel) async {
  //   if (kDebugMode) {
  //     print(usulanKegiatanModel.toJson());
  //   }
  //
  //   return "Usulan Kegiatan has been created successfully.";
  // }
  //
  // @override
  // Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
  //   final String response = await rootBundle
  //       .loadString('assets/json_file/usulan_kegiatan.json');
  //
  //   dynamic jsonResult = json.decode(response);
  //   UsulanKegiatanModel result = UsulanKegiatanModel.fromJson(jsonResult);
  //
  //   if (kDebugMode) {
  //     print(idUsulanKegiatan);
  //   }
  //
  //   return result;
  // }
  //
  // @override
  // Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json_file/usulan_kegiatan_list.json');
  //   List<dynamic> resultList = json.decode(response);
  //
  //   List<UsulanKegiatanModel> result = resultList
  //       .map((resultMap) => UsulanKegiatanModel.fromJson(resultMap))
  //       .toList();
  //
  //   return result;
  // }
  //
  // @override
  // Future<String> updateUsulanKegiatan(
  //     UsulanKegiatanModel usulanKegiatanModel) async {
  //   if (kDebugMode) {
  //     print(usulanKegiatanModel.toJson());
  //   }
  //
  //   return "Usulan Kegiatan has been updated successfully.";
  // }
  //
  // @override
  // Future<String> deleteUsulanKegiatan(int idUsulan) async {
  //   if (kDebugMode) {
  //     print('Usulan Kegiatan with ID $idUsulan has been deleted successfully.');
  //   }
  //
  //   return "Usulan Kegiatan has been deleted successfully.";
  // }
  //
  // @override
  // Future<void> deletePartisipan(int idPartisipan) async {
  //   if (kDebugMode) {
  //     print('Partisipan with ID $idPartisipan has been deleted successfully.');
  //   }
  // }
  //
  // @override
  // Future<void> deleteBiayaKegiatan(int idBiayaKegiatan) async {
  //   if (kDebugMode) {
  //     print(
  //         'Biaya Kegiatan with ID $idBiayaKegiatan has been deleted successfully.');
  //   }
  // }
}
