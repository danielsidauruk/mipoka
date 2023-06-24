import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mipoka/mipoka/data/models/admin_model.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/lampiran_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/lampiran_model.dart';
import 'package:mipoka/mipoka/data/models/laporan_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/panitia_peserta_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/periode_model.dart';
import 'package:mipoka/mipoka/data/models/peserta_model.dart';
import 'package:mipoka/mipoka/data/models/prestasi_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/riwayat_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/session_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/user_model.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';

abstract class MipokaDataSources {
  Future<List<BeritaModel>> readAllBerita();
  Future<BeritaModel> readBerita(int idBerita);
  Future<String> createBerita(BeritaModel beritaModel);
  Future<String> updateBerita(BeritaModel beritaModel);
  Future<String> deleteBerita(int beritaId);

  Future<List<AdminModel>> readAdmin();
  Future<String> createAdmin(AdminModel adminModel);
  Future<String> updateAdmin(AdminModel adminModel);
  Future<String> deleteAdmin(int adminId);

  Future<List<BiayaKegiatanModel>> readBiayaKegiatan();
  Future<String> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> deleteBiayaKegiatan(int biayaKegiatanId);

  Future<List<KegiatanModel>> readKegiatan();
  Future<String> createKegiatan(KegiatanModel kegiatanModel);
  Future<String> updateKegiatan(KegiatanModel kegiatanModel);
  Future<String> deleteKegiatan(int kegiatanId);

  Future<List<LampiranLaporanModel>> readLampiranLaporan();
  Future<String> createLampiranLaporan(
      LampiranLaporanModel lampiranLaporanModel);
  Future<String> updateLampiranLaporan(
      LampiranLaporanModel lampiranLaporanModel);
  Future<String> deleteLampiranLaporan(int lampiranLaporanId);

  Future<List<LampiranModel>> readLampiran();
  Future<String> createLampiran(LampiranModel lampiranModel);
  Future<String> updateLampiran(LampiranModel lampiranModel);
  Future<String> deleteLampiran(int idLampiran);

  Future<List<LaporanModel>> readLaporan();
  Future<String> createLaporan(LaporanModel laporanModel);
  Future<String> updateLaporan(LaporanModel laporanModel);
  Future<String> deleteLaporan(int laporanId);

  Future<List<OrmawaModel>> readOrmawa();
  Future<String> createOrmawa(OrmawaModel ormawaModel);
  Future<String> updateOrmawa(OrmawaModel ormawaModel);
  Future<String> deleteOrmawa(int idOrmawa);

  Future<List<PanitiaPesertaLaporanModel>> readPanitiaPesertaL();
  Future<String> createPanitiaPesertaL(
      PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<String> updatePanitiaPesertaL(
      PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<String> deletePanitiaPesertaL(int idPanitiaPesertaLaporan);

  Future<List<PartisipanModel>> readPartisipan();
  Future<String> createPartisipan(PartisipanModel partisipanModel);
  Future<String> updatePartisipan(PartisipanModel partisipanModel);
  Future<String> deletePartisipan(int idPartisipan);

  Future<List<PeriodeModel>> readPeriode();
  Future<String> createPeriode(PeriodeModel periodeModel);
  Future<String> updatePeriode(PeriodeModel periodeModel);
  Future<String> deletePeriode(int idPeriode);

  Future<List<PesertaModel>> readPeserta();
  Future<String> createPeserta(PesertaModel pesertaModel);
  Future<String> updatePeserta(PesertaModel pesertaModel);
  Future<String> deletePeserta(int idPeserta);

  Future<List<PrestasiModel>> readPrestasi();
  Future<String> createPrestasi(PrestasiModel prestasiModel);
  Future<String> updatePrestasi(PrestasiModel prestasiModel);
  Future<String> deletePrestasi(int idPrestasi);

  Future<List<RincianBiayaKegiatanModel>> readRincianBiayaKegiatan();
  Future<String> createRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<String> updateRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<String> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<List<RincianLaporanModel>> readRincianLaporan();
  Future<String> createRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<String> updateRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<String> deleteRincianLaporan(int idRincianL);

  Future<List<RiwayatMptModel>> readRiwayatMpt();
  Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> readSession();
  Future<String> createSession(SessionModel sessionModel);
  Future<String> updateSession(SessionModel sessionModel);
  Future<String> deleteSession(int idSession);

  Future<List<TertibAcaraModel>> readTertibAcara();
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> deleteTertibAcara(int idTertibAcara);

  Future<List<MipokaUserModel>> readUser();
  Future<String> createUser(MipokaUserModel userModel);
  Future<String> updateUser(MipokaUserModel userModel);
  Future<String> deleteUser(int idUser);

  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan);
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan();
  Future<String> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> deleteUsulanKegiatan(int idUsulan);
}

class MipokaDataSourcesImpl implements MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});
  final http.Client client;

  // => BeritaModel Repositories
  @override
  Future<String> createBerita(BeritaModel beritaModel) async {
    if (kDebugMode) {
      print(beritaModel.toJson());
    }

    return "Berita has been created successfully.";
  }

  @override
  Future<BeritaModel> readBerita(int idBerita) async {
    final String response =
    await rootBundle.loadString('assets/json_file/berita_object.json');
    dynamic jsonDecode = json.decode(response);

    BeritaModel result = BeritaModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<List<BeritaModel>> readAllBerita() async {
    final String response =
        await rootBundle.loadString('assets/json_file/berita.json');
    List<dynamic> resultList = json.decode(response);

    List<BeritaModel> result =
        resultList.map((resultMap) => BeritaModel.fromJson(resultMap)).toList();

    return result;
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
  Future<List<AdminModel>> readAdmin() async {
    final String response =
        await rootBundle.loadString('assets/json_file/admin.json');
    List<dynamic> resultList = json.decode(response);

    List<AdminModel> result =
        resultList.map((resultMap) => AdminModel.fromJson(resultMap)).toList();

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

  // => Biaya kegiatanModel
  @override
  Future<List<BiayaKegiatanModel>> readBiayaKegiatan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/biaya.json');
    List<dynamic> resultList = json.decode(response);

    List<BiayaKegiatanModel> result = resultList
        .map((resultMap) => BiayaKegiatanModel.fromJson(resultMap))
        .toList();

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
  Future<String> createKegiatan(KegiatanModel kegiatanModel) async {
    if (kDebugMode) {
      print(kegiatanModel.toJson());
    }

    return "Kegiatan has been created successfully.";
  }

  @override
  Future<List<KegiatanModel>> readKegiatan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/kegiatan.json');
    List<dynamic> resultList = json.decode(response);

    List<KegiatanModel> result = resultList
        .map((resultMap) => KegiatanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateKegiatan(KegiatanModel kegiatanModel) async {
    if (kDebugMode) {
      print(kegiatanModel.toJson());
    }

    return "Kegiatan has been updated successfully.";
  }

  @override
  Future<String> deleteKegiatan(int kegiatanId) async {
    if (kDebugMode) {
      print('Kegiatan with ID $kegiatanId has been deleted successfully.');
    }

    return "Berita has been deleted successfully.";
  }

  // => LampiranModel Laporan
  @override
  Future<String> createLampiranLaporan(
      LampiranLaporanModel lampiranLaporanModel) async {
    if (kDebugMode) {
      print(lampiranLaporanModel.toJson());
    }

    return "Lampiran Laporan has been created successfully.";
  }

  @override
  Future<List<LampiranLaporanModel>> readLampiranLaporan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/lampiran.json');
    List<dynamic> resultList = json.decode(response);

    List<LampiranLaporanModel> result = resultList
        .map((resultMap) => LampiranLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateLampiranLaporan(
      LampiranLaporanModel lampiranLaporanModel) async {
    if (kDebugMode) {
      print(lampiranLaporanModel.toJson());
    }

    return "Lampiran Laporan has been updated successfully.";
  }

  @override
  Future<String> deleteLampiranLaporan(int lampiranLaporanId) async {
    if (kDebugMode) {
      print(
          'Lampiran Laporan with ID $lampiranLaporanId has been deleted successfully.');
    }

    return "Lampiran has been deleted successfully.";
  }

  // => LampiranModel
  @override
  Future<String> createLampiran(LampiranModel lampiranModel) async {
    if (kDebugMode) {
      print(lampiranModel.toJson());
    }

    return "Lampiran has been created successfully.";
  }

  @override
  Future<List<LampiranModel>> readLampiran() async {
    final String response =
        await rootBundle.loadString('assets/json_file/lampiran.json');
    List<dynamic> resultList = json.decode(response);

    List<LampiranModel> result = resultList
        .map((resultMap) => LampiranModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateLampiran(LampiranModel lampiranModel) async {
    if (kDebugMode) {
      print(lampiranModel.toJson());
    }

    return "Lampiran has been updated successfully.";
  }

  @override
  Future<String> deleteLampiran(int idLampiran) async {
    if (kDebugMode) {
      print('Lampiran with ID $idLampiran has been deleted successfully.');
    }

    return "Lampiran has been deleted successfully.";
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
  Future<List<LaporanModel>> readLaporan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/laporan.json');
    List<dynamic> resultList = json.decode(response);

    List<LaporanModel> result = resultList
        .map((resultMap) => LaporanModel.fromJson(resultMap))
        .toList();

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
  Future<List<OrmawaModel>> readOrmawa() async {
    final String response =
        await rootBundle.loadString('assets/json_file/ormawa.json');
    List<dynamic> resultList = json.decode(response);

    List<OrmawaModel> result =
        resultList.map((resultMap) => OrmawaModel.fromJson(resultMap)).toList();

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

  // => Panitia pesertaModel Laporan
  @override
  Future<String> createPanitiaPesertaL(
      PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) async {
    if (kDebugMode) {
      print(panitiaPesertaLaporanModel.toJson());
    }

    return "Panitia Peserta Laporan has been created successfully.";
  }

  @override
  Future<List<PanitiaPesertaLaporanModel>> readPanitiaPesertaL() async {
    final String response = await rootBundle
        .loadString('assets/json_file/panitia_peserta_laporan.json');
    List<dynamic> resultList = json.decode(response);

    List<PanitiaPesertaLaporanModel> result = resultList
        .map((resultMap) => PanitiaPesertaLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updatePanitiaPesertaL(
      PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) async {
    if (kDebugMode) {
      print(panitiaPesertaLaporanModel.toJson());
    }

    return "Panitia Peserta Laporan has been updated successfully.";
  }

  @override
  Future<String> deletePanitiaPesertaL(int idPanitiaPesertaLaporan) async {
    if (kDebugMode) {
      print(
          'Panitia Peserta Laporan with ID $idPanitiaPesertaLaporan has been deleted successfully.');
    }

    return "Panitia Peserta Laporan has been deleted successfully.";
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
  Future<List<PartisipanModel>> readPartisipan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/partisipan.json');
    List<dynamic> resultList = json.decode(response);

    List<PartisipanModel> result = resultList
        .map((resultMap) => PartisipanModel.fromJson(resultMap))
        .toList();

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
  Future<String> createPeriode(PeriodeModel periodeModel) async {
    if (kDebugMode) {
      print(periodeModel.toJson());
    }

    return "Periode has been created successfully.";
  }

  @override
  Future<List<PeriodeModel>> readPeriode() async {
    final String response =
        await rootBundle.loadString('assets/json_file/periode.json');
    List<dynamic> resultList = json.decode(response);

    List<PeriodeModel> result = resultList
        .map((resultMap) => PeriodeModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updatePeriode(PeriodeModel periodeModel) async {
    if (kDebugMode) {
      print(periodeModel.toJson());
    }

    return "Periode has been updated successfully.";
  }

  @override
  Future<String> deletePeriode(int idPeriode) async {
    if (kDebugMode) {
      print('Periode with ID $idPeriode has been deleted successfully.');
    }

    return "Periode has been deleted successfully.";
  }

  // => pesertaModel
  @override
  Future<String> createPeserta(PesertaModel pesertaModel) async {
    if (kDebugMode) {
      print(pesertaModel.toJson());
    }

    return "Peserta has been created successfully.";
  }

  @override
  Future<List<PesertaModel>> readPeserta() async {
    final String response =
        await rootBundle.loadString('assets/json_file/peserta.json');
    List<dynamic> resultList = json.decode(response);

    List<PesertaModel> result = resultList
        .map((resultMap) => PesertaModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updatePeserta(PesertaModel pesertaModel) async {
    if (kDebugMode) {
      print(pesertaModel.toJson());
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
  Future<List<PrestasiModel>> readPrestasi() async {
    final String response =
        await rootBundle.loadString('assets/json_file/prestasi.json');
    List<dynamic> resultList = json.decode(response);

    List<PrestasiModel> result = resultList
        .map((resultMap) => PrestasiModel.fromJson(resultMap))
        .toList();

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

  // => Rincian Biaya kegiatanModel
  @override
  Future<String> createRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }

    return "Rincian Biaya Kegiatan has been created successfully.";
  }

  @override
  Future<List<RincianBiayaKegiatanModel>> readRincianBiayaKegiatan() async {
    final String response = await rootBundle
        .loadString('assets/json_file/rincian_biaya_kegiatan.json');
    List<dynamic> resultList = json.decode(response);

    List<RincianBiayaKegiatanModel> result = resultList
        .map((resultMap) => RincianBiayaKegiatanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }

    return "Rincian Biaya Kegiatan has been updated successfully.";
  }

  @override
  Future<String> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    if (kDebugMode) {
      print(
          'Rincian Biaya Kegiatan with ID $idRincianBiayaKegiatan has been deleted successfully.');
    }

    return "Rincian Biaya Kegiatan has been deleted successfully.";
  }

  // => Rincian Laporan
  @override
  Future<String> createRincianLaporan(
      RincianLaporanModel rincianLaporanModel) async {
    if (kDebugMode) {
      print(rincianLaporanModel.toJson());
    }

    return "Rincian Laporan has been created successfully.";
  }

  @override
  Future<List<RincianLaporanModel>> readRincianLaporan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/rincian_laporan.json');
    List<dynamic> resultList = json.decode(response);

    List<RincianLaporanModel> result = resultList
        .map((resultMap) => RincianLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateRincianLaporan(
      RincianLaporanModel rincianLaporanModel) async {
    if (kDebugMode) {
      print(rincianLaporanModel.toJson());
    }

    return "Rincian Laporan has been updated successfully.";
  }

  @override
  Future<String> deleteRincianLaporan(int idRincianL) async {
    if (kDebugMode) {
      print(
          'Rincian Laporan with ID $idRincianL has been deleted successfully.');
    }

    return "Rincian Laporan has been deleted successfully.";
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
  Future<List<RiwayatMptModel>> readRiwayatMpt() async {
    final String response =
        await rootBundle.loadString('assets/json_file/riwayat_mpt.json');
    List<dynamic> resultList = json.decode(response);

    List<RiwayatMptModel> result = resultList
        .map((resultMap) => RiwayatMptModel.fromJson(resultMap))
        .toList();

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
  Future<List<SessionModel>> readSession() async {
    final String response =
        await rootBundle.loadString('assets/json_file/session.json');
    List<dynamic> resultList = json.decode(response);

    List<SessionModel> result = resultList
        .map((resultMap) => SessionModel.fromJson(resultMap))
        .toList();

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

  // => Tertib Acara
  @override
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }

    return "Tertib Acara has been created successfully.";
  }

  @override
  Future<List<TertibAcaraModel>> readTertibAcara() async {
    final String response =
        await rootBundle.loadString('assets/json_file/tertib_acara.json');
    List<dynamic> resultList = json.decode(response);

    List<TertibAcaraModel> result = resultList
        .map((resultMap) => TertibAcaraModel.fromJson(resultMap))
        .toList();

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

  // => UserModel
  @override
  Future<String> createUser(MipokaUserModel userModel) async {
    if (kDebugMode) {
      print(userModel.toJson());
    }

    return "User has been created successfully.";
  }

  @override
  Future<List<MipokaUserModel>> readUser() async {
    final String response =
        await rootBundle.loadString('assets/json_file/user.json');
    List<dynamic> resultList = json.decode(response);

    List<MipokaUserModel> result = resultList
        .map((resultMap) => MipokaUserModel.fromJson(resultMap))
        .toList();

    return result;
  }

  @override
  Future<String> updateUser(MipokaUserModel userModel) async {
    if (kDebugMode) {
      print(userModel.toJson());
    }

    return "User has been updated successfully.";
  }

  @override
  Future<String> deleteUser(int idUser) async {
    if (kDebugMode) {
      print('User with ID $idUser has been deleted successfully.');
    }

    return "User has been deleted successfully.";
  }

  // => Usulan
  @override
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
    final String response = await rootBundle
        .loadString('assets/json_file/usulan_kegiatan_object.json');

    dynamic jsonResult = json.decode(response);
    UsulanKegiatanModel result = UsulanKegiatanModel.fromJson(jsonResult);

    if (kDebugMode) {
      print(result);
    }

    return result;
  }

  @override
  Future<String> createUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    if (kDebugMode) {
      print(usulanKegiatanModel.toJson());
    }

    return "Usulan Kegiatan has been created successfully.";
  }

  @override
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan() async {
    final String response =
        await rootBundle.loadString('assets/json_file/usulan_kegiatan.json');
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
