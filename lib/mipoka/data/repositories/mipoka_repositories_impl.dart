import 'package:dartz/dartz.dart';
import 'package:mipoka/core/exception.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/domain/entities/admin.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/periode.dart';
import 'package:mipoka/mipoka/domain/entities/peserta.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class MipokaRepositoriesImpl extends MipokaRepositories {
  final MipokaDataSources mipokaDataSources;

  MipokaRepositoriesImpl({required this.mipokaDataSources});

  // => Berita Repositories
  @override
  Future<Either<Failure, String>> createBerita(Berita berita) async {
    try {
      return Right(
          await mipokaDataSources.createBerita(BeritaModel.fromEntity(berita)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Berita>>> readBerita() async {
    try {
      return Right(await mipokaDataSources.readBerita());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateBerita(Berita berita) async {
    try {
      return Right(
          await mipokaDataSources.updateBerita(BeritaModel.fromEntity(berita)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteBerita(int beritaId) async {
    try {
      return Right(await mipokaDataSources.deleteBerita(beritaId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Admin Repositories
  @override
  Future<Either<Failure, String>> createAdmin(Admin admin) {
    // TODO: implement createAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Admin>>> readAdmin() {
    // TODO: implement getAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateAdmin(Admin admin) {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteAdmin(int adminId) {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }

  // => Biaya Kegiatan
  @override
  Future<Either<Failure, String>> createBiayaKegiatan(
      BiayaKegiatan biayaKegiatan) {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BiayaKegiatan>>> getBiayaKegiatan(
      String namaBiayaKegiatan) {
    // TODO: implement getBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateBiayaKegiatan(
      BiayaKegiatan biayaKegiatan) {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteBiayaKegiatan(
      String namaBiayaKegiatan) {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }

  // => Kegiatan
  @override
  Future<Either<Failure, String>> createKegiatan(Kegiatan kegiatan) {
    // TODO: implement createKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Kegiatan>>> getKegiatan() {
    // TODO: implement getKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateKegiatan(Kegiatan kegiatan) {
    // TODO: implement updateKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteKegiatan(int idKegiatan) {
    // TODO: implement deleteKegiatan
    throw UnimplementedError();
  }

  // => Lampiran Laporan
  @override
  Future<Either<Failure, String>> createLampiranLaporan(
      LampiranLaporan lampiranLaporan) {
    // TODO: implement createLampiranLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LampiranLaporan>>> getLampiranLaporan() {
    // TODO: implement getLampiranLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateLampiranLaporan(
      LampiranLaporan lampiranLaporan) {
    // TODO: implement updateLampiranLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteLampiranLaporan(int idLampiranLaporan) {
    // TODO: implement deleteLampiranLaporan
    throw UnimplementedError();
  }

  // => Lampiran
  @override
  Future<Either<Failure, String>> createLampiran(Lampiran lampiran) {
    // TODO: implement createLampiran
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Lampiran>>> getLampiran() {
    // TODO: implement getLampiran
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateLampiran(Lampiran lampiran) {
    // TODO: implement updateLampiran
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteLampiran(int idLampiran) {
    // TODO: implement deleteLampiran
    throw UnimplementedError();
  }

  // => Ormawa
  @override
  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa) {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Ormawa>>> getOrmawa() {
    // TODO: implement getOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa) {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa) {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }

  // => Panitia Peserta Laporan
  @override
  Future<Either<Failure, String>> createPanitiaPesertaL(
      PanitiaPesertaL panitiaPesertaL) {
    // TODO: implement createPanitiaPesertaL
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PanitiaPesertaL>>> getPanitiaPesertaL() {
    // TODO: implement getPanitiaPesertaL
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updatePanitiaPesertaL(
      PanitiaPesertaL panitiaPesertaL) {
    // TODO: implement updatePanitiaPesertaL
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePanitiaPesertaL(int idPanitiaPesertaL) {
    // TODO: implement deletePanitiaPesertaL
    throw UnimplementedError();
  }

  // => Partisipan
  @override
  Future<Either<Failure, String>> createPartisipan(Partisipan partisipan) {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Partisipan>>> getPartisipan() {
    // TODO: implement getPartisipan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updatePartisipan(Partisipan partisipan) {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePartisipan(int idPartisipan) {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }

  // => Periode
  @override
  Future<Either<Failure, String>> createPeriode(Periode periode) {
    // TODO: implement createPeriode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Periode>>> getPeriode() {
    // TODO: implement getPeriode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updatePeriode(Periode periode) {
    // TODO: implement updatePeriode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePeriode(Periode periode) {
    // TODO: implement deletePeriode
    throw UnimplementedError();
  }

  // => Peserta
  @override
  Future<Either<Failure, String>> createPeserta(Peserta peserta) {
    // TODO: implement createPeserta
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Peserta>>> getPeserta() {
    // TODO: implement getPeserta
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updatePeserta(Peserta peserta) {
    // TODO: implement updatePeserta
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePeserta(int idPeserta) {
    // TODO: implement deletePeserta
    throw UnimplementedError();
  }

  // => Prestasi
  @override
  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi) {
    // TODO: implement createPrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Prestasi>>> getPrestasi() {
    // TODO: implement getPrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi) {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePrestasi(int idPrestasi) {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }

  // => Rincian Biaya Kegiatan
  @override
  Future<Either<Failure, String>> createRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan) {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RincianBiayaKegiatan>>>
      getRincianBiayaKegiatan() {
    // TODO: implement getRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan) {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteRincianBiayaKegiatan(
      int idRincianBiayaKegiatan) {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }

  // => Rincian Laporan
  @override
  Future<Either<Failure, String>> createRincianLaporan(
      RincianLaporan rincianLaporan) {
    // TODO: implement createRincianLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RincianLaporan>>> getRincianLaporan() {
    // TODO: implement getRincianLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateRincianLaporan(
      RincianLaporan rincianLaporan) {
    // TODO: implement updateRincianLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteRincianLaporan(int idRincianL) {
    // TODO: implement deleteRincianLaporan
    throw UnimplementedError();
  }

  // => Riwayat MPT
  @override
  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RiwayatMpt>>> getRiwayatMpt() {
    // TODO: implement getRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }

  // => Session
  @override
  Future<Either<Failure, String>> createSession(Session session) {
    // TODO: implement createSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Session>>> getSession() {
    // TODO: implement getSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateSession(Session session) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteSession(int idSession) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }

  // => Tertib Acara
  @override
  Future<Either<Failure, String>> createTertibAcara(TertibAcara tertibAcara) {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TertibAcara>>> getTertibAcara() {
    // TODO: implement getTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateTertibAcara(TertibAcara tertibAcara) {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara) {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }

  // => User
  @override
  Future<Either<Failure, String>> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteUser(int idUser) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  // => Usulan

  @override
  Future<Either<Failure, String>> createUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> getUsulanKegiatan() {
    // TODO: implement getUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan) {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }
}
