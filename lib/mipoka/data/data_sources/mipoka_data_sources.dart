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

  Future<List<BiayaKegiatanModel>> getBiayaKegiatan(String namaBiayaKegiatan);
  Future<String> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<String> deleteBiayaKegiatan(String namaBiayaKegiatan);

  Future<List<KegiatanModel>> getKegiatan();
  Future<String> createKegiatan(KegiatanModel kegiatanModel);
  Future<String> updateKegiatan(KegiatanModel kegiatanModel);
  Future<String> deleteKegiatan(int idKegiatan);

  Future<List<LampiranModel>> getLampiran();
  Future<String> createLampiran(LampiranModel lampiranModel);
  Future<String> updateLampiran(LampiranModel lampiranModel);
  Future<String> deleteLampiran(int idLampiran);

  Future<List<LampiranLaporanModel>> getLampiranLaporan();
  Future<String> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<String> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<String> deleteLampiranLaporan(int idLampiranLaporan);

  Future<List<OrmawaModel>> getOrmawa();
  Future<String> createOrmawa(OrmawaModel ormawaModel);
  Future<String> updateOrmawa(OrmawaModel ormawaModel);
  Future<String> deleteOrmawa(int idOrmawa);

  Future<List<PanitiaPesertaLaporanModel>> getPanitiaPesertaL();
  Future<String> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<String> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<String> deletePanitiaPesertaL(int idPanitiaPesertaLaporan);

  Future<List<PartisipanModel>> getPartisipan();
  Future<String> createPartisipan(PartisipanModel partisipanModel);
  Future<String> updatePartisipan(PartisipanModel partisipanModel);
  Future<String> deletePartisipan(int idPartisipan);

  Future<List<PeriodeModel>> getPeriode();
  Future<String> createPeriode(PeriodeModel periodeModel);
  Future<String> updatePeriode(PeriodeModel periodeModel);
  Future<String> deletePeriode(PeriodeModel periodeModel);

  Future<List<PesertaModel>> getPeserta();
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
    List<dynamic> beritaList = json.decode(response);

    List<BeritaModel> result = beritaList
        .map((beritaMap) => BeritaModel.fromJson(beritaMap))
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
  Future<String> createAdmin(AdminModel adminModel) {
    // TODO: implement createAdminModel
    throw UnimplementedError();
  }
  @override
  Future<List<AdminModel>> readAdmin() {
    // TODO: implement getAdminModel
    throw UnimplementedError();
  }
  @override
  Future<String> updateAdmin(AdminModel adminModel) {
    // TODO: implement updateAdminModel
    throw UnimplementedError();
  }
  @override
  Future<String> deleteAdmin(int adminId) {
    // TODO: implement deleteAdminModel
    throw UnimplementedError();
  }


  // => Biaya kegiatanModel
  @override
  Future<String> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<List<BiayaKegiatanModel>> getBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement getBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> deleteBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }


  // => kegiatanModel
  @override
  Future<String> createKegiatan(KegiatanModel kegiatanModel) {
    // TODO: implement createKegiatan
    throw UnimplementedError();
  }
  @override
  Future<List<KegiatanModel>> getKegiatan() {
    // TODO: implement getKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> updateKegiatan(KegiatanModel kegiatanModel) {
    // TODO: implement updateKegiatan
    throw UnimplementedError();
  }
  @override
  Future<String> deleteKegiatan(int idKegiatan) {
    // TODO: implement deleteKegiatan
    throw UnimplementedError();
  }


  // => LampiranModel Laporan
  @override
  Future<String> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) {
    // TODO: implement createLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<List<LampiranLaporanModel>> getLampiranLaporan() {
    // TODO: implement getLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<String> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) {
    // TODO: implement updateLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<String> deleteLampiranLaporan(int idLampiranLaporan) {
    // TODO: implement deleteLampiranLaporan
    throw UnimplementedError();
  }


  // => LampiranModel
  @override
  Future<String> createLampiran(LampiranModel lampiranModel) {
    // TODO: implement createLampiran
    throw UnimplementedError();
  }
  @override
  Future<List<LampiranModel>> getLampiran() {
    // TODO: implement getLampiran
    throw UnimplementedError();
  }
  @override
  Future<String> updateLampiran(LampiranModel lampiranModel) {
    // TODO: implement updateLampiran
    throw UnimplementedError();
  }
  @override
  Future<String> deleteLampiran(int idLampiran) {
    // TODO: implement deleteLampiran
    throw UnimplementedError();
  }


  // => Ormawa
  @override
  Future<String> createOrmawa(OrmawaModel ormawaModel) {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }
  @override
  Future<List<OrmawaModel>> getOrmawa() {
    // TODO: implement getOrmawa
    throw UnimplementedError();
  }
  @override
  Future<String> updateOrmawa(OrmawaModel ormawaModel) {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }
  @override
  Future<String> deleteOrmawa(int idOrmawa) {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }


  // => Panitia pesertaModel Laporan
  @override
  Future<String> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) {
    // TODO: implement createPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<List<PanitiaPesertaLaporanModel>> getPanitiaPesertaL() {
    // TODO: implement getPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<String> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) {
    // TODO: implement updatePanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<String> deletePanitiaPesertaL(int idPanitiaPesertaLaporan) {
    // TODO: implement deletePanitiaPesertaL
    throw UnimplementedError();
  }


  // => PartisipanModel
  @override
  Future<String> createPartisipan(PartisipanModel partisipanModel) {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }
  @override
  Future<List<PartisipanModel>> getPartisipan() {
    // TODO: implement getPartisipan
    throw UnimplementedError();
  }
  @override
  Future<String> updatePartisipan(PartisipanModel partisipanModel) {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }
  @override
  Future<String> deletePartisipan(int idPartisipan) {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }


  // => Periode
  @override
  Future<String> createPeriode(PeriodeModel periodeModel) {
    // TODO: implement createPeriode
    throw UnimplementedError();
  }

  @override
  Future<String> deletePeriode(PeriodeModel periodeModel) {
    // TODO: implement deletePeriode
    throw UnimplementedError();
  }

  @override
  Future<List<PeriodeModel>> getPeriode() {
    // TODO: implement getPeriode
    throw UnimplementedError();
  }

  @override
  Future<String> updatePeriode(PeriodeModel periodeModel) {
    // TODO: implement updatePeriode
    throw UnimplementedError();
  }


  // => pesertaModel
  @override
  Future<String> createPeserta(PesertaModel pesertaModel) {
    // TODO: implement createPeserta
    throw UnimplementedError();
  }
  @override
  Future<List<PesertaModel>> getPeserta() {
    // TODO: implement getPeserta
    throw UnimplementedError();
  }
  @override
  Future<String>updatePeserta(PesertaModel pesertaModel) {
    // TODO: implement updatePeserta
    throw UnimplementedError();
  }
  @override
  Future<String> deletePeserta(int idPeserta) {
    // TODO: implement deletePeserta
    throw UnimplementedError();
  }


  // => PrestasiModel
  @override
  Future<String> createPrestasi(PrestasiModel prestasiModel) {
    // TODO: implement createPrestasi
    throw UnimplementedError();
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