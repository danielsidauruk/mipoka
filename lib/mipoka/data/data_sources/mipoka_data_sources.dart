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
  Future<List<BeritaModel>> readBerita();
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

  Future<List<LampiranModel>> readLampiran();
  Future<String> createLampiran(LampiranModel lampiranModel);
  Future<String> updateLampiran(LampiranModel lampiranModel);
  Future<String> deleteLampiran(int idLampiran);

  Future<List<LampiranLaporanModel>> readLampiranLaporan();
  Future<String> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<String> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<String> deleteLampiranLaporan(int lampiranLaporanId);

  Future<List<OrmawaModel>> readOrmawa();
  Future<String> createOrmawa(OrmawaModel ormawaModel);
  Future<String> updateOrmawa(OrmawaModel ormawaModel);
  Future<String> deleteOrmawa(int idOrmawa);

  Future<List<PanitiaPesertaLaporanModel>> getPanitiaPesertaL();
  Future<String> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<String> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
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

  Future<List<PrestasiModel>> getPrestasi();
  Future<String> createPrestasi(PrestasiModel prestasiModel);
  Future<String> updatePrestasi(PrestasiModel prestasiModel);
  Future<String> deletePrestasi(int idPrestasi);

  Future<List<RincianBiayaKegiatanModel>> getRincianBiayaKegiatan();
  Future<String> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<String> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<String> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<List<RincianLaporanModel>> getRincianLaporan();
  Future<String> createRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<String> updateRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<String> deleteRincianLaporan(int idRincianL);

  Future<List<RiwayatMptModel>> getRiwayatMpt();
  Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<String> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> getSession();
  Future<String> createSession(SessionModel sessionModel);
  Future<String> updateSession(SessionModel sessionModel);
  Future<String> deleteSession(int idSession);

  Future<List<TertibAcaraModel>> getTertibAcara();
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<String> deleteTertibAcara(int idTertibAcara);

  Future<List<UserModel>> getUser();
  Future<String> createUser(UserModel userModel);
  Future<String> updateUser(UserModel userModel);
  Future<String> deleteUser(int idUser);

  Future<List<UsulanKegiatanModel>> getUsulanKegiatan();
  Future<String> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<String> deleteUsulanKegiatan(int idUsulan);
}

class MipokaDataSourcesImpl extends MipokaDataSources {
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
  Future<List<BeritaModel>> readBerita() async {
    final String response = await rootBundle.loadString('assets/json_file/berita.json');
    List<dynamic> resultList = json.decode(response);

    List<BeritaModel> result = resultList
        .map((resultMap) => BeritaModel.fromJson(resultMap))
        .toList();

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
    final String response = await rootBundle.loadString('assets/json_file/admin.json');
    List<dynamic> resultList = json.decode(response);

    List<AdminModel> result = resultList
        .map((resultMap) => AdminModel.fromJson(resultMap))
        .toList();

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
    final String response = await rootBundle.loadString('assets/json_file/biaya.json');
    List<dynamic> resultList = json.decode(response);

    List<BiayaKegiatanModel> result = resultList
        .map((resultMap) => BiayaKegiatanModel.fromJson(resultMap))
        .toList();

    return result;
  }
  @override
  Future<String> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }

    return "Biaya has been created successfully.";
  }
  @override
  Future<String> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }

    return "Biaya Kegiatan has been updated successfully.";
  }
  @override
  Future<String> deleteBiayaKegiatan(int biayaKegiatanId) async {
    if (kDebugMode) {
      print('Biaya Kegiatan with ID $biayaKegiatanId has been deleted successfully.');
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
    final String response = await rootBundle.loadString('assets/json_file/kegiatan.json');
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
  Future<String> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) async {
    if (kDebugMode) {
      print(lampiranLaporanModel.toJson());
    }

    return "Lampiran Laporan has been created successfully.";
  }
  @override
  Future<List<LampiranLaporanModel>> readLampiranLaporan() async {
    final String response = await rootBundle.loadString('assets/json_file/lampiran.json');
    List<dynamic> resultList = json.decode(response);

    List<LampiranLaporanModel> result = resultList
        .map((resultMap) => LampiranLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }
  @override
  Future<String> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) async {
    if (kDebugMode) {
      print(lampiranLaporanModel.toJson());
    }

    return "Lampiran Laporan has been updated successfully.";
  }
  @override
  Future<String> deleteLampiranLaporan(int lampiranLaporanId) async {
    if (kDebugMode) {
      print('Lampiran Laporan with ID $lampiranLaporanId has been deleted successfully.');
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
    final String response = await rootBundle.loadString('assets/json_file/lampiran.json');
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
    final String response = await rootBundle.loadString('assets/json_file/ormawa.json');
    List<dynamic> resultList = json.decode(response);

    List<OrmawaModel> result = resultList
        .map((resultMap) => OrmawaModel.fromJson(resultMap))
        .toList();

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
  Future<String> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) async {
    if (kDebugMode) {
      print(panitiaPesertaLaporanModel.toJson());
    }

    return "Panitia Peserta Laporan has been created successfully.";
  }
  @override
  Future<List<PanitiaPesertaLaporanModel>> getPanitiaPesertaL() async {
    final String response = await rootBundle.loadString('assets/json_file/panitia_peserta_laporan.json');
    List<dynamic> resultList = json.decode(response);

    List<PanitiaPesertaLaporanModel> result = resultList
        .map((resultMap) => PanitiaPesertaLaporanModel.fromJson(resultMap))
        .toList();

    return result;
  }
  @override
  Future<String> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) async {
    if (kDebugMode) {
      print(panitiaPesertaLaporanModel.toJson());
    }

    return "Panitia Peserta Laporan has been updated successfully.";
  }
  @override
  Future<String> deletePanitiaPesertaL(int idPanitiaPesertaLaporan) async {
    if (kDebugMode) {
      print('Panitia Peserta Laporan with ID $idPanitiaPesertaLaporan has been deleted successfully.');
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
    final String response = await rootBundle.loadString('assets/json_file/partisipan.json');
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
    final String response = await rootBundle.loadString('assets/json_file/periode.json');
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
    final String response = await rootBundle.loadString('assets/json_file/peserta.json');
    List<dynamic> resultList = json.decode(response);

    List<PesertaModel> result = resultList
        .map((resultMap) => PesertaModel.fromJson(resultMap))
        .toList();

    return result;
  }
  @override
  Future<String>updatePeserta(PesertaModel pesertaModel) async {
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
  Future<List<PrestasiModel>> getPrestasi() {
    // TODO: implement getPrestasi
    throw UnimplementedError();
  }
  @override
  Future<String> updatePrestasi(PrestasiModel prestasiModel) {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }
  @override
  Future<String> deletePrestasi(int idPrestasi) {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }


  // => Rincian Biaya kegiatanModel
  @override
  Future<String> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<List<RincianBiayaKegiatanModel>> getRincianBiayaKegiatan() {
    // TODO: implement getRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }


  // => Rincian Laporan
  @override
  Future<String> createRincianLaporan(RincianLaporanModel rincianLaporanModel) {
    // TODO: implement createRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<List<RincianLaporanModel>> getRincianLaporan() {
    // TODO: implement getRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<String> updateRincianLaporan(RincianLaporanModel rincianLaporanModel) {
    // TODO: implement updateRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<String> deleteRincianLaporan(int idRincianL) {
    // TODO: implement deleteRincianLaporan
    throw UnimplementedError();
  }


  // => Riwayat MPT
  @override
  Future<String> createRiwayatMpt(RiwayatMptModel riwayatMptModel) {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<List<RiwayatMptModel>> getRiwayatMpt() {
    // TODO: implement getRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<String> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<String> deleteRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }


  // => SessionModel
  @override
  Future<String> createSession(SessionModel sessionModel) {
    // TODO: implement createSession
    throw UnimplementedError();
  }
  @override
  Future<List<SessionModel>> getSession() {
    // TODO: implement getSession
    throw UnimplementedError();
  }
  @override
  Future<String> updateSession(SessionModel sessionModel) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }
  @override
  Future<String> deleteSession(int idSession) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }


  // => Tertib Acara
  @override
  Future<String> createTertibAcara(TertibAcaraModel tertibAcaraModel) {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<List<TertibAcaraModel>> getTertibAcara() {
    // TODO: implement getTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<String> updateTertibAcara(TertibAcaraModel tertibAcaraModel) {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<String> deleteTertibAcara(int idTertibAcara) {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }


  // => UserModel
  @override
  Future<String> createUser(UserModel userModel) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  @override
  Future<List<UserModel>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  @override
  Future<String> updateUser(UserModel userModel) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  @override
  Future<String> deleteUser(int idUser) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }


  // => Usulan
  @override
  Future<String> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<List<UsulanKegiatanModel>> getUsulanKegiatan() {
    // TODO: implement getUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<String> deleteUsulanKegiatan(int idUsulan) {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<String> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }
}