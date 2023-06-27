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
  Future<String> createBerita(BeritaModel beritaModel);
  Future<String> updateBerita(BeritaModel beritaModel);
  Future<String> deleteBerita(int beritaId);

  Future<AdminModel> readAdmin(int idAdmin);
  Future<String> createAdmin(AdminModel adminModel);
  Future<String> updateAdmin(AdminModel adminModel);
  Future<String> deleteAdmin(int idAdmin);

  Future<List<BiayaKegiatanModel>> readAllBiayaKegiatan();
  Future<BiayaKegiatanModel> readBiayaKegiatan(int biayaKegiatan);
  Future<String> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> deleteBiayaKegiatan(int idBiayaKegiatan);

  Future<List<KegiatanMptModel>> readAllKegiatanMpt();
  Future<KegiatanMptModel> readKegiatanMpt(int idKegiatanMpt);
  Future<String> createKegiatanMpt(KegiatanMptModel kegiatanMptModel);
  Future<String> updateKegiatanMpt(KegiatanMptModel kegiatanMptModel);
  Future<String> deleteKegiatanMpt(int idKegiatanMpt);

  Future<List<LaporanModel>> readAllLaporan();
  Future<LaporanModel> readLaporan(int idLaporan);
  Future<String> createLaporan(LaporanModel laporanModel);
  Future<String> updateLaporan(LaporanModel laporanModel);
  Future<String> deleteLaporan(int laporanId);

  Future<List<OrmawaModel>> readAllOrmawa();
  Future<OrmawaModel> readOrmawa(int idOrmawa);
  Future<String> createOrmawa(OrmawaModel ormawaModel);
  Future<String> updateOrmawa(OrmawaModel ormawaModel);
  Future<String> deleteOrmawa(int idOrmawa);

  Future<List<PartisipanModel>> readAllPartisipan();
  Future<PartisipanModel> readPartisipan(int idPartisipan);
  Future<String> createPartisipan(PartisipanModel partisipanModel);
  Future<String> updatePartisipan(PartisipanModel partisipanModel);
  Future<String> deletePartisipan(int idPartisipan);

  Future<List<PeriodeMptModel>> readAllPeriodeMpt();
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriode);
  Future<String> createPeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<String> updatePeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<String> deletePeriodeMpt(int idPeriode);

  Future<List<PesertaKegiatanLaporanModel>> readAllPesertaKegiatanLaporan();
  Future<PesertaKegiatanLaporanModel> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan);
  Future<String> createPesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel);
  Future<String> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel);
  Future<String> deletePeserta(int idPesertaKegiatanLaporan);

  Future<List<PrestasiModel>> readAllPrestasi();
  Future<PrestasiModel> readPrestasi(int idPrestasi);
  Future<String> createPrestasi(PrestasiModel prestasiModel);
  Future<String> updatePrestasi(PrestasiModel prestasiModel);
  Future<String> deletePrestasi(int idPrestasi);

  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan);
  Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> deleteRevisiLaporan(int idRevisiLaporan);

  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan);
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> deleteRevisiUsulan(int idRevisiUsulan);

  Future<RincianBiayaKegiatanModel> readRincianBiayaKegiatan(int idRincianBiayaKegiatan);
  Future<void> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<List<RiwayatMptModel>> readAllRiwayatMpt();
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt);
  Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> readAllSession();
  Future<SessionModel> readSession(int idSession);
  Future<String> createSession(SessionModel sessionModel);
  Future<String> updateSession(SessionModel sessionModel);
  Future<String> deleteSession(int idSession);

  Future<List<TertibAcaraModel>> readAllTertibAcara();
  Future<TertibAcaraModel> readTertibAcara(int idTertibAcara);
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> deleteTertibAcara(int idTertibAcara);

  Future<List<MipokaUserModel>> readAllMipokaUser();
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser);
  Future<String> createMipokaUser(MipokaUserModel mipokaUserModel);
  Future<String> updateMipokaUser(MipokaUserModel mipokaUserModel);
  Future<String> deleteMipokaUser(String idUser);

  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan();
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan);
  Future<String> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> deleteUsulanKegiatan(int idMipokaUser);
}

class MipokaDataSourcesImpl implements MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});
  final http.Client client;

  // => BeritaModel Repositories
  @override
  Future<List<BeritaModel>> readAllBerita() async {
    final String response =
    await rootBundle.loadString('assets/json_file/berita_list.json');
    List<dynamic> resultList = json.decode(response);

    List<BeritaModel> result =
    resultList.map((resultMap) => BeritaModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<BeritaModel> readBerita(int idBerita) async {
    final String response =
    await rootBundle.loadString('assets/json_file/berita.json');
    dynamic jsonDecode = json.decode(response);

    BeritaModel result = BeritaModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<String> createBerita(BeritaModel beritaModel) async {
    if (kDebugMode) {
      print(beritaModel.toJson());
    }

    return "Berita has been created successfully.";
  }

  @override
  Future<String> updateBerita(BeritaModel beritaModel) async {
    if (kDebugMode) {
      print(beritaModel.toJson());
    }

    return "Berita has been updated successfully.";
  }

  @override
  Future<String> deleteBerita(int beritaId) async {
    if (kDebugMode) {
      print('Berita with ID $beritaId has been deleted successfully.');
    }

    return "Berita has been deleted successfully.";
  }

  // => AdminModel Repositories
  @override
  Future<String> createAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }

    return "Admin has been created successfully.";
  }

  @override
  Future<AdminModel> readAdmin(int idAdmin) async {
    final String response =
        await rootBundle.loadString('assets/json_file/admin.json');
    dynamic jsonResult = json.decode(response);

    AdminModel result = AdminModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }

    return "Admin has been updated successfully.";
  }

  @override
  Future<String> deleteAdmin(int adminId) async {
    if (kDebugMode) {
      print('Admin with ID $adminId has been deleted successfully.');
    }

    return "Berita has been deleted successfully.";
  }

  // => Biaya kegiatanModel (~)
  @override
  Future<List<BiayaKegiatanModel>> readAllBiayaKegiatan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/biaya.json');
    List<dynamic> resultList = json.decode(response);

    List<BiayaKegiatanModel> result = resultList
        .map((resultMap) => BiayaKegiatanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<BiayaKegiatanModel> readBiayaKegiatan(int biayaKegiatan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/kegiatan_mpt.json');
    dynamic jsonResult = json.decode(response);

    BiayaKegiatanModel result = BiayaKegiatanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> createBiayaKegiatan(
      BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }

    return "Biaya has been created successfully.";
  }

  @override
  Future<String> updateBiayaKegiatan(
      BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }

    return "Biaya Kegiatan has been updated successfully.";
  }

  @override
  Future<String> deleteBiayaKegiatan(int biayaKegiatanId) async {
    if (kDebugMode) {
      print(
          'Biaya Kegiatan with ID $biayaKegiatanId has been deleted successfully.');
    }

    return "Biaya Kegiatan has been deleted successfully.";
  }

  // => kegiatanModel
  @override
  Future<String> createKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
    if (kDebugMode) {
      print(kegiatanMptModel.toJson());
    }

    return "Kegiatan has been created successfully.";
  }

  @override
  Future<KegiatanMptModel> readKegiatanMpt(int idKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/kegiatan_mpt.json');
    dynamic jsonResult = json.decode(response);

    KegiatanMptModel result = KegiatanMptModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<List<KegiatanMptModel>> readAllKegiatanMpt() async {
    final String response =
        await rootBundle.loadString('assets/json_file/kegiatan_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<KegiatanMptModel> result = resultList
        .map((resultMap) => KegiatanMptModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateKegiatanMpt(KegiatanMptModel kegiatanMptModel) async {
    if (kDebugMode) {
      print(kegiatanMptModel.toJson());
    }

    return "Kegiatan has been updated successfully.";
  }

  @override
  Future<String> deleteKegiatanMpt(int kegiatanId) async {
    if (kDebugMode) {
      print('Kegiatan with ID $kegiatanId has been deleted successfully.');
    }

    return "Berita has been deleted successfully.";
  }

  // Laporan
  @override
  Future<String> createLaporan(LaporanModel laporanModel) async {
    if (kDebugMode) {
      print(laporanModel.toJson());
    }

    return "Laporan has been created successfully.";
  }

  @override
  Future<List<LaporanModel>> readAllLaporan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/laporan_list.json');
    List<dynamic> resultList = json.decode(response);

    List<LaporanModel> result = resultList
        .map((resultMap) => LaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<LaporanModel> readLaporan(int idLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/laporan.json');
    dynamic jsonResult = json.decode(response);

    LaporanModel result = LaporanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateLaporan(LaporanModel laporanModel) async {
    if (kDebugMode) {
      print(laporanModel.toJson());
    }

    return "Lampiran has been updated successfully.";
  }

  @override
  Future<String> deleteLaporan(int laporanId) async {
    if (kDebugMode) {
      print('Laporan with ID $laporanId has been deleted successfully.');
    }

    return "Laporan has been deleted successfully.";
  }

  // => Ormawa
  @override
  Future<String> createOrmawa(OrmawaModel ormawaModel) async {
    if (kDebugMode) {
      print(ormawaModel.toJson());
    }

    return "Ormawa has been created successfully.";
  }

  @override
  Future<List<OrmawaModel>> readAllOrmawa() async {
    final String response =
        await rootBundle.loadString('assets/json_file/ormawa_list.json');
    List<dynamic> resultList = json.decode(response);

    List<OrmawaModel> result =
        resultList.map((resultMap) => OrmawaModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<OrmawaModel> readOrmawa(int idOrmawa) async {
    final String response =
    await rootBundle.loadString('assets/json_file/ormawa.json');
    dynamic jsonResult = json.decode(response);

    OrmawaModel result = OrmawaModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateOrmawa(OrmawaModel ormawaModel) async {
    if (kDebugMode) {
      print(ormawaModel.toJson());
    }

    return "Ormawa has been updated successfully.";
  }

  @override
  Future<String> deleteOrmawa(int idOrmawa) async {
    if (kDebugMode) {
      print('Ormawa with ID $idOrmawa has been deleted successfully.');
    }

    return "Ormawa has been deleted successfully.";
  }

  // => PartisipanModel
  @override
  Future<String> createPartisipan(PartisipanModel partisipanModel) async {
    if (kDebugMode) {
      print(partisipanModel.toJson());
    }

    return "Partisipan has been created successfully.";
  }

  @override
  Future<List<PartisipanModel>> readAllPartisipan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/partisipan_list.json');
    List<dynamic> resultList = json.decode(response);

    List<PartisipanModel> result = resultList
        .map((resultMap) => PartisipanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<PartisipanModel> readPartisipan(int idPartisipan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/partisipan.json');
    dynamic jsonResult = json.decode(response);

    PartisipanModel result = PartisipanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updatePartisipan(PartisipanModel partisipanModel) async {
    if (kDebugMode) {
      print(partisipanModel.toJson());
    }

    return "Partisipan has been updated successfully.";
  }

  @override
  Future<String> deletePartisipan(int idPartisipan) async {
    if (kDebugMode) {
      print('Partisipan with ID $idPartisipan has been deleted successfully.');
    }

    return "Partisipan has been deleted successfully.";
  }

  // => Periode
  @override
  Future<String> createPeriodeMpt(PeriodeMptModel periodeMptModel) async {
    if (kDebugMode) {
      print(periodeMptModel.toJson());
    }

    return "Periode has been created successfully.";
  }

  @override
  Future<List<PeriodeMptModel>> readAllPeriodeMpt() async {
    final String response =
        await rootBundle.loadString('assets/json_file/periode_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<PeriodeMptModel> result = resultList
        .map((resultMap) => PeriodeMptModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriode) async {
    final String response =
    await rootBundle.loadString('assets/json_file/periode_mpt.json');
    dynamic jsonResult = json.decode(response);

    PeriodeMptModel result = PeriodeMptModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updatePeriodeMpt(PeriodeMptModel periodeMptModel) async {
    if (kDebugMode) {
      print(periodeMptModel.toJson());
    }

    return "Periode has been updated successfully.";
  }

  @override
  Future<String> deletePeriodeMpt(int idPeriode) async {
    if (kDebugMode) {
      print('Periode with ID $idPeriode has been deleted successfully.');
    }

    return "Periode has been deleted successfully.";
  }

  // => pesertaKegiatanLaporanModel
  @override
  Future<String> createPesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }

    return "Peserta has been created successfully.";
  }

  @override
  Future<List<PesertaKegiatanLaporanModel>> readAllPesertaKegiatanLaporan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/peserta.json');
    List<dynamic> resultList = json.decode(response);

    List<PesertaKegiatanLaporanModel> result = resultList
        .map((resultMap) => PesertaKegiatanLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<PesertaKegiatanLaporanModel> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/periode_mpt.json');
    dynamic jsonResult = json.decode(response);

    PesertaKegiatanLaporanModel result = PesertaKegiatanLaporanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }

    return "Peserta has been updated successfully.";
  }

  @override
  Future<String> deletePeserta(int idPeserta) async {
    if (kDebugMode) {
      print('Peserta with ID $idPeserta has been deleted successfully.');
    }

    return "Peserta has been deleted successfully.";
  }

  // => PrestasiModel
  @override
  Future<String> createPrestasi(PrestasiModel prestasiModel) async {
    if (kDebugMode) {
      print(prestasiModel.toJson());
    }

    return "Prestasi has been created successfully.";
  }

  @override
  Future<List<PrestasiModel>> readAllPrestasi() async {
    final String response =
        await rootBundle.loadString('assets/json_file/prestasi_list.json');
    List<dynamic> resultList = json.decode(response);

    List<PrestasiModel> result = resultList
        .map((resultMap) => PrestasiModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<PrestasiModel> readPrestasi(int idPrestasi) async {
    final String response =
    await rootBundle.loadString('assets/json_file/prestasi.json');
    dynamic jsonResult = json.decode(response);

    PrestasiModel result = PrestasiModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updatePrestasi(PrestasiModel prestasiModel) async {
    if (kDebugMode) {
      print(prestasiModel.toJson());
    }

    return "Prestasi has been updated successfully.";
  }

  @override
  Future<String> deletePrestasi(int idPrestasi) async {
    if (kDebugMode) {
      print('Prestasi with ID $idPrestasi has been deleted successfully.');
    }

    return "Prestasi has been deleted successfully.";
  }

  // => Revisi Laporan Model
  @override
  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_laporan.json');
    dynamic jsonResult = json.decode(response);

    RevisiLaporanModel result = RevisiLaporanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }

  @override
  Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }

  @override
  Future<void> deleteRevisiLaporan(int idRevisiLaporan) async {
    if (kDebugMode) {
      print(
          'Rincian Biaya Kegiatan with ID $idRevisiLaporan has been deleted successfully.');
    }
  }


  // => Revisi Usulan
  @override
  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_usulan.json');
    dynamic jsonResult = json.decode(response);

    RevisiUsulanModel result = RevisiUsulanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }

  @override
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }
  @override
  Future<void> deleteRevisiUsulan(int idRevisiUsulan) async {
    if (kDebugMode) {
      print(
          'Rincian Biaya Kegiatan with ID $idRevisiUsulan has been deleted successfully.');
    }
  }

  // => Rincian Biaya kegiatanModel (~)
  @override
  Future<RincianBiayaKegiatanModel> readRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_usulan.json');
    dynamic jsonResult = json.decode(response);

    RincianBiayaKegiatanModel result = RincianBiayaKegiatanModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<void> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel)async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    if (kDebugMode) {
      print(
          'Rincian Biaya Kegiatan with ID $idRincianBiayaKegiatan has been deleted successfully.');
    }
  }

  // => Riwayat MPT
  @override
  Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    if (kDebugMode) {
      print(riwayatMptModel.toJson());
    }

    return "Riwayat MPT has been created successfully.";
  }

  @override
  Future<List<RiwayatMptModel>> readAllRiwayatMpt() async {
    final String response =
        await rootBundle.loadString('assets/json_file/riwayat_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<RiwayatMptModel> result = resultList
        .map((resultMap) => RiwayatMptModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_usulan.json');
    dynamic jsonResult = json.decode(response);

    RiwayatMptModel result = RiwayatMptModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    if (kDebugMode) {
      print(riwayatMptModel.toJson());
    }

    return "Riwayat MPT has been updated successfully.";
  }

  @override
  Future<String> deleteRiwayatMpt(int idRiwayatMpt) async {
    if (kDebugMode) {
      print('Riwayat MPT with ID $idRiwayatMpt has been deleted successfully.');
    }

    return "Riwayat MPT has been deleted successfully.";
  }

  // => SessionModel
  @override
  Future<String> createSession(SessionModel sessionModel) async {
    if (kDebugMode) {
      print(sessionModel.toJson());
    }

    return "Session has been created successfully.";
  }

  @override
  Future<List<SessionModel>> readAllSession() async {
    final String response =
        await rootBundle.loadString('assets/json_file/session_list.json');
    List<dynamic> resultList = json.decode(response);

    List<SessionModel> result = resultList
        .map((resultMap) => SessionModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<SessionModel> readSession(int idSession) async {
    final String response =
    await rootBundle.loadString('assets/json_file/session.json');
    dynamic jsonResult = json.decode(response);

    SessionModel result = SessionModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateSession(SessionModel sessionModel) async {
    if (kDebugMode) {
      print(sessionModel.toJson());
    }

    return "Session has been updated successfully.";
  }

  @override
  Future<String> deleteSession(int idSession) async {
    if (kDebugMode) {
      print('Session with ID $idSession has been deleted successfully.');
    }

    return "Session has been deleted successfully.";
  }

  // => Tertib Acara (~)
  @override
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }

    return "Tertib Acara has been created successfully.";
  }

  @override
  Future<List<TertibAcaraModel>> readAllTertibAcara() async {
    final String response =
        await rootBundle.loadString('assets/json_file/tertib_acara.json');
    List<dynamic> resultList = json.decode(response);

    List<TertibAcaraModel> result = resultList
        .map((resultMap) => TertibAcaraModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<TertibAcaraModel> readTertibAcara(int idTertibAcara) async {
    final String response =
    await rootBundle.loadString('assets/json_file/session.json');
    dynamic jsonResult = json.decode(response);

    TertibAcaraModel result = TertibAcaraModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }

    return "Tertib Acara has been updated successfully.";
  }

  @override
  Future<String> deleteTertibAcara(int idTertibAcara) async {
    if (kDebugMode) {
      print(
          'Tertib Acara with ID $idTertibAcara has been deleted successfully.');
    }

    return "Tertib Acara has been deleted successfully.";
  }

  // => MipokaUserModel
  @override
  Future<String> createMipokaUser(MipokaUserModel userModel) async {
    if (kDebugMode) {
      print(userModel.toJson());
    }

    return "User has been created successfully.";
  }

  @override
  Future<List<MipokaUserModel>> readAllMipokaUser() async {
    final String response =
        await rootBundle.loadString('assets/json_file/mipoka_user_list.json');
    List<dynamic> resultList = json.decode(response);

    List<MipokaUserModel> result = resultList
        .map((resultMap) => MipokaUserModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<MipokaUserModel> readMipokaUser(String idUser) async {
    final String response =
    await rootBundle.loadString('assets/json_file/mipoka_user.json');
    dynamic jsonResult = json.decode(response);

    MipokaUserModel result = MipokaUserModel.fromJson(jsonResult);

    return result;
  }

  @override
  Future<String> updateMipokaUser(MipokaUserModel userModel) async {
    if (kDebugMode) {
      print(userModel.toJson());
    }

    return "User has been updated successfully.";
  }

  @override
  Future<String> deleteMipokaUser(String idMipokaUser) async {
    if (kDebugMode) {
      print('User with ID $idMipokaUser has been deleted successfully.');
    }

    return "User has been deleted successfully.";
  }

  // => Usulan
  @override
  Future<String> createUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    if (kDebugMode) {
      print(usulanKegiatanModel.toJson());
    }

    return "Usulan Kegiatan has been created successfully.";
  }

  @override
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
    final String response = await rootBundle
        .loadString('assets/json_file/usulan_kegiatan.json');

    dynamic jsonResult = json.decode(response);
    UsulanKegiatanModel result = UsulanKegiatanModel.fromJson(jsonResult);

    if (kDebugMode) {
      print(idUsulanKegiatan);
    }

    return result;
  }

  @override
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/usulan_kegiatan_list.json');
    List<dynamic> resultList = json.decode(response);

    List<UsulanKegiatanModel> result = resultList
        .map((resultMap) => UsulanKegiatanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    if (kDebugMode) {
      print(usulanKegiatanModel.toJson());
    }

    return "Usulan Kegiatan has been updated successfully.";
  }

  @override
  Future<String> deleteUsulanKegiatan(int idUsulan) async {
    if (kDebugMode) {
      print('Usulan Kegiatan with ID $idUsulan has been deleted successfully.');
    }

    return "Usulan Kegiatan has been deleted successfully.";
  }
}
