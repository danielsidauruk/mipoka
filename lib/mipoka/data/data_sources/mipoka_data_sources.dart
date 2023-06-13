import 'dart:convert';
import 'dart:io';
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
  Future<BeritaModel> readBerita();
  Future<BeritaModel> createBerita(BeritaModel beritaModel);
  Future<BeritaModel> updateBerita(BeritaModel beritaModel);
  Future<void> deleteBerita(int beritaId);

  Future<AdminModel> readAdmin();
  Future<AdminModel> createAdmin(AdminModel adminModel);
  Future<AdminModel> updateAdmin(AdminModel adminModel);
  Future<void> deleteAdmin(int adminId);

  Future<BiayaKegiatanModel> getBiayaKegiatan(String namaBiayaKegiatan);
  Future<BiayaKegiatanModel> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<BiayaKegiatanModel> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<void> deleteBiayaKegiatan(String namaBiayaKegiatan);

  Future<KegiatanModel> getKegiatan();
  Future<KegiatanModel> createKegiatan(KegiatanModel kegiatanModel);
  Future<KegiatanModel> updateKegiatan(KegiatanModel kegiatanModel);
  Future<void> deleteKegiatan(int idKegiatan);

  Future<LampiranModel> getLampiran();
  Future<LampiranModel> createLampiran(LampiranModel lampiranModel);
  Future<LampiranModel> updateLampiran(LampiranModel lampiranModel);
  Future<void> deleteLampiran(int idLampiran);

  Future<LampiranLaporanModel> getLampiranLaporan();
  Future<LampiranLaporanModel> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<LampiranLaporanModel> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel);
  Future<void> deleteLampiranLaporan(int idLampiranLaporan);

  Future<OrmawaModel> getOrmawa();
  Future<OrmawaModel> createOrmawa(OrmawaModel ormawaModel);
  Future<OrmawaModel> updateOrmawa(OrmawaModel ormawaModel);
  Future<void> deleteOrmawa(int idOrmawa);

  Future<PanitiaPesertaLaporanModel> getPanitiaPesertaL();
  Future<PanitiaPesertaLaporanModel> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<PanitiaPesertaLaporanModel> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel);
  Future<void> deletePanitiaPesertaL(int idPanitiaPesertaLaporan);

  Future<PartisipanModel> getPartisipan();
  Future<PartisipanModel> createPartisipan(PartisipanModel partisipanModel);
  Future<PartisipanModel> updatePartisipan(PartisipanModel partisipanModel);
  Future<void> deletePartisipan(int idPartisipan);

  Future<PeriodeModel> getPeriode();
  Future<PeriodeModel> createPeriode(PeriodeModel periodeModel);
  Future<PeriodeModel> updatePeriode(PeriodeModel periodeModel);
  Future<void> deletePeriode(PeriodeModel periodeModel);

  Future<PesertaModel> getPeserta();
  Future<PesertaModel> createPeserta(PesertaModel pesertaModel);
  Future<PesertaModel> updatePeserta(PesertaModel pesertaModel);
  Future<void> deletePeserta(int idPeserta);

  Future<PrestasiModel> getPrestasi();
  Future<PrestasiModel> createPrestasi(PrestasiModel prestasiModel);
  Future<PrestasiModel> updatePrestasi(PrestasiModel prestasiModel);
  Future<void> deletePrestasi(int idPrestasi);

  Future<RincianBiayaKegiatanModel> getRincianBiayaKegiatan();
  Future<RincianBiayaKegiatanModel> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<RincianBiayaKegiatanModel> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<RincianLaporanModel> getRincianLaporan();
  Future<RincianLaporanModel> createRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<RincianLaporanModel> updateRincianLaporan(RincianLaporanModel rincianLaporanModel);
  Future<void> deleteRincianLaporan(int idRincianL);

  Future<RiwayatMptModel> getRiwayatMpt();
  Future<RiwayatMptModel> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<RiwayatMptModel> updateRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<void> deleteRiwayatMpt(int idRiwayatMpt);

  Future<SessionModel> getSession();
  Future<SessionModel> createSession(SessionModel sessionModel);
  Future<SessionModel> updateSession(SessionModel sessionModel);
  Future<void> deleteSession(int idSession);

  Future<TertibAcaraModel> getTertibAcara();
  Future<TertibAcaraModel> createTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<TertibAcaraModel> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<void> deleteTertibAcara(int idTertibAcara);

  Future<UserModel> getUser();
  Future<UserModel> createUser(UserModel userModel);
  Future<UserModel> updateUser(UserModel userModel);
  Future<void> deleteUser(int idUser);

  Future<UsulanKegiatanModel> getUsulanKegiatan();
  Future<UsulanKegiatanModel> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<UsulanKegiatanModel> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> deleteUsulanKegiatan(int idUsulan);
}

class MipokaDataSourcesImpl extends MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});
  final http.Client client;

  // => BeritaModel Repositories
  final file = File('mipoka/assets/json_file/berita.json');

  @override
  Future<BeritaModel> createBerita(BeritaModel beritaModel) {
    // TODO: implement createBeritaModel
    throw UnimplementedError();
  }
  @override
  Future<BeritaModel> readBerita() async {
    String jsonContent = await file.readAsString();
    Map<String, dynamic> beritaMap = json.decode(jsonContent);

    BeritaModel beritaModel = BeritaModel.fromJson(beritaMap);
    return beritaModel;
  }
  @override
  Future<BeritaModel> updateBerita(BeritaModel beritaModel) {
    // TODO: implement updateBeritaModel
    throw UnimplementedError();
  }
  @override
  Future<void> deleteBerita(int beritaId) {
    // TODO: implement deleteBeritaModel
    throw UnimplementedError();
  }


  // => AdminModel Repositories
  @override
  Future<AdminModel> createAdmin(AdminModel adminModel) {
    // TODO: implement createAdminModel
    throw UnimplementedError();
  }
  @override
  Future<AdminModel> readAdmin() {
    // TODO: implement getAdminModel
    throw UnimplementedError();
  }
  @override
  Future<AdminModel> updateAdmin(AdminModel adminModel) {
    // TODO: implement updateAdminModel
    throw UnimplementedError();
  }
  @override
  Future<void> deleteAdmin(int adminId) {
    // TODO: implement deleteAdminModel
    throw UnimplementedError();
  }


  // => Biaya kegiatanModel
  @override
  Future<BiayaKegiatanModel> createBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<BiayaKegiatanModel> getBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement getBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<BiayaKegiatanModel> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel) {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<void> deleteBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }


  // => kegiatanModel
  @override
  Future<KegiatanModel> createKegiatan(KegiatanModel kegiatanModel) {
    // TODO: implement createKegiatan
    throw UnimplementedError();
  }
  @override
  Future<KegiatanModel> getKegiatan() {
    // TODO: implement getKegiatan
    throw UnimplementedError();
  }
  @override
  Future<KegiatanModel> updateKegiatan(KegiatanModel kegiatanModel) {
    // TODO: implement updateKegiatan
    throw UnimplementedError();
  }
  @override
  Future<void> deleteKegiatan(int idKegiatan) {
    // TODO: implement deleteKegiatan
    throw UnimplementedError();
  }


  // => LampiranModel Laporan
  @override
  Future<LampiranLaporanModel> createLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) {
    // TODO: implement createLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<LampiranLaporanModel> getLampiranLaporan() {
    // TODO: implement getLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<LampiranLaporanModel> updateLampiranLaporan(LampiranLaporanModel lampiranLaporanModel) {
    // TODO: implement updateLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<void> deleteLampiranLaporan(int idLampiranLaporan) {
    // TODO: implement deleteLampiranLaporan
    throw UnimplementedError();
  }


  // => LampiranModel
  @override
  Future<LampiranModel> createLampiran(LampiranModel lampiranModel) {
    // TODO: implement createLampiran
    throw UnimplementedError();
  }
  @override
  Future<LampiranModel> getLampiran() {
    // TODO: implement getLampiran
    throw UnimplementedError();
  }
  @override
  Future<LampiranModel> updateLampiran(LampiranModel lampiranModel) {
    // TODO: implement updateLampiran
    throw UnimplementedError();
  }
  @override
  Future<void> deleteLampiran(int idLampiran) {
    // TODO: implement deleteLampiran
    throw UnimplementedError();
  }


  // => Ormawa
  @override
  Future<OrmawaModel> createOrmawa(OrmawaModel ormawaModel) {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }
  @override
  Future<OrmawaModel> getOrmawa() {
    // TODO: implement getOrmawa
    throw UnimplementedError();
  }
  @override
  Future<OrmawaModel> updateOrmawa(OrmawaModel ormawaModel) {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }
  @override
  Future<void> deleteOrmawa(int idOrmawa) {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }


  // => Panitia pesertaModel Laporan
  @override
  Future<PanitiaPesertaLaporanModel> createPanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) {
    // TODO: implement createPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<PanitiaPesertaLaporanModel> getPanitiaPesertaL() {
    // TODO: implement getPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<PanitiaPesertaLaporanModel> updatePanitiaPesertaL(PanitiaPesertaLaporanModel panitiaPesertaLaporanModel) {
    // TODO: implement updatePanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<void> deletePanitiaPesertaL(int idPanitiaPesertaLaporan) {
    // TODO: implement deletePanitiaPesertaL
    throw UnimplementedError();
  }


  // => PartisipanModel
  @override
  Future<PartisipanModel> createPartisipan(PartisipanModel partisipanModel) {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }
  @override
  Future<PartisipanModel> getPartisipan() {
    // TODO: implement getPartisipan
    throw UnimplementedError();
  }
  @override
  Future<PartisipanModel> updatePartisipan(PartisipanModel partisipanModel) {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }
  @override
  Future<void> deletePartisipan(int idPartisipan) {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }


  // => Periode
  @override
  Future<PeriodeModel> createPeriode(PeriodeModel periodeModel) {
    // TODO: implement createPeriode
    throw UnimplementedError();
  }

  @override
  Future<void> deletePeriode(PeriodeModel periodeModel) {
    // TODO: implement deletePeriode
    throw UnimplementedError();
  }

  @override
  Future<PeriodeModel> getPeriode() {
    // TODO: implement getPeriode
    throw UnimplementedError();
  }

  @override
  Future<PeriodeModel> updatePeriode(PeriodeModel periodeModel) {
    // TODO: implement updatePeriode
    throw UnimplementedError();
  }


  // => pesertaModel
  @override
  Future<PesertaModel>createPeserta(PesertaModel pesertaModel) {
    // TODO: implement createPeserta
    throw UnimplementedError();
  }
  @override
  Future<PesertaModel>getPeserta() {
    // TODO: implement getPeserta
    throw UnimplementedError();
  }
  @override
  Future<PesertaModel>updatePeserta(PesertaModel pesertaModel) {
    // TODO: implement updatePeserta
    throw UnimplementedError();
  }
  @override
  Future<void> deletePeserta(int idPeserta) {
    // TODO: implement deletePeserta
    throw UnimplementedError();
  }


  // => PrestasiModel
  @override
  Future<PrestasiModel> createPrestasi(PrestasiModel prestasiModel) {
    // TODO: implement createPrestasi
    throw UnimplementedError();
  }
  @override
  Future<PrestasiModel> getPrestasi() {
    // TODO: implement getPrestasi
    throw UnimplementedError();
  }
  @override
  Future<PrestasiModel> updatePrestasi(PrestasiModel prestasiModel) {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }
  @override
  Future<void> deletePrestasi(int idPrestasi) {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }


  // => Rincian Biaya kegiatanModel
  @override
  Future<RincianBiayaKegiatanModel> createRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<RincianBiayaKegiatanModel> getRincianBiayaKegiatan() {
    // TODO: implement getRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<RincianBiayaKegiatanModel> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel) {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }


  // => Rincian Laporan
  @override
  Future<RincianLaporanModel> createRincianLaporan(RincianLaporanModel rincianLaporanModel) {
    // TODO: implement createRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<RincianLaporanModel> getRincianLaporan() {
    // TODO: implement getRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<RincianLaporanModel> updateRincianLaporan(RincianLaporanModel rincianLaporanModel) {
    // TODO: implement updateRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<void> deleteRincianLaporan(int idRincianL) {
    // TODO: implement deleteRincianLaporan
    throw UnimplementedError();
  }


  // => Riwayat MPT
  @override
  Future<RiwayatMptModel> createRiwayatMpt(RiwayatMptModel riwayatMptModel) {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<RiwayatMptModel> getRiwayatMpt() {
    // TODO: implement getRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<RiwayatMptModel> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<void> deleteRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }


  // => SessionModel
  @override
  Future<SessionModel> createSession(SessionModel sessionModel) {
    // TODO: implement createSession
    throw UnimplementedError();
  }
  @override
  Future<SessionModel> getSession() {
    // TODO: implement getSession
    throw UnimplementedError();
  }
  @override
  Future<SessionModel> updateSession(SessionModel sessionModel) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }
  @override
  Future<void> deleteSession(int idSession) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }


  // => Tertib Acara
  @override
  Future<TertibAcaraModel> createTertibAcara(TertibAcaraModel tertibAcaraModel) {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<TertibAcaraModel> getTertibAcara() {
    // TODO: implement getTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<TertibAcaraModel> updateTertibAcara(TertibAcaraModel tertibAcaraModel) {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<void> deleteTertibAcara(int idTertibAcara) {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }


  // => UserModel
  @override
  Future<UserModel> createUser(UserModel userModel) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  @override
  Future<UserModel> updateUser(UserModel userModel) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  @override
  Future<void> deleteUser(int idUser) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }


  // => Usulan
  @override
  Future<UsulanKegiatanModel> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<UsulanKegiatanModel> getUsulanKegiatan() {
    // TODO: implement getUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUsulanKegiatan(int idUsulan) {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<UsulanKegiatanModel> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel) {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }
}