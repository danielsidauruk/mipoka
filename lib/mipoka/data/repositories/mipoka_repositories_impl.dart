import 'package:dartz/dartz.dart';
import 'package:mipoka/core/exception.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
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
      return Right(await mipokaDataSources.createBerita(berita.toBeritaModel()));
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
      return Right(await mipokaDataSources.updateBerita(berita.toBeritaModel()));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, void>> deleteBerita(int beritaId) {
    // TODO: implement deleteBerita
    throw UnimplementedError();
  }


  // => Admin Repositories
  @override
  Future<Either<Failure, Admin>> createAdmin(Admin admin) {
    // TODO: implement createAdmin
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Admin>> readAdmin() {
    // TODO: implement getAdmin
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Admin>> updateAdmin(Admin admin) {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteAdmin(int adminId) {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }


  // => Biaya Kegiatan
  @override
  Future<Either<Failure, BiayaKegiatan>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, BiayaKegiatan>> getBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement getBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, BiayaKegiatan>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteBiayaKegiatan(String namaBiayaKegiatan) {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }


  // => Kegiatan
  @override
  Future<Either<Failure, Kegiatan>> createKegiatan(Kegiatan kegiatan) {
    // TODO: implement createKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Kegiatan>> getKegiatan() {
    // TODO: implement getKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Kegiatan>> updateKegiatan(Kegiatan kegiatan) {
    // TODO: implement updateKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteKegiatan(int idKegiatan) {
    // TODO: implement deleteKegiatan
    throw UnimplementedError();
  }


  // => Lampiran Laporan
  @override
  Future<Either<Failure, LampiranLaporan>> createLampiranLaporan(LampiranLaporan lampiranLaporan) {
    // TODO: implement createLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, LampiranLaporan>> getLampiranLaporan() {
    // TODO: implement getLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, LampiranLaporan>> updateLampiranLaporan(LampiranLaporan lampiranLaporan) {
    // TODO: implement updateLampiranLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteLampiranLaporan(int idLampiranLaporan) {
    // TODO: implement deleteLampiranLaporan
    throw UnimplementedError();
  }


  // => Lampiran
  @override
  Future<Either<Failure, Lampiran>> createLampiran(Lampiran lampiran) {
    // TODO: implement createLampiran
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Lampiran>> getLampiran() {
    // TODO: implement getLampiran
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Lampiran>> updateLampiran(Lampiran lampiran) {
    // TODO: implement updateLampiran
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteLampiran(int idLampiran) {
    // TODO: implement deleteLampiran
    throw UnimplementedError();
  }


  // => Ormawa
  @override
  Future<Either<Failure, Ormawa>> createOrmawa(Ormawa ormawa) {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Ormawa>> getOrmawa() {
    // TODO: implement getOrmawa
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Ormawa>> updateOrmawa(Ormawa ormawa) {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa) {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }


  // => Panitia Peserta Laporan
  @override
  Future<Either<Failure, PanitiaPesertaL>> createPanitiaPesertaL(PanitiaPesertaL panitiaPesertaL) {
    // TODO: implement createPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, PanitiaPesertaL>> getPanitiaPesertaL() {
    // TODO: implement getPanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, PanitiaPesertaL>> updatePanitiaPesertaL(PanitiaPesertaL panitiaPesertaL) {
    // TODO: implement updatePanitiaPesertaL
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deletePanitiaPesertaL(int idPanitiaPesertaL) {
    // TODO: implement deletePanitiaPesertaL
    throw UnimplementedError();
  }


  // => Partisipan
  @override
  Future<Either<Failure, Partisipan>> createPartisipan(Partisipan partisipan) {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Partisipan>> getPartisipan() {
    // TODO: implement getPartisipan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Partisipan>> updatePartisipan(Partisipan partisipan) {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan) {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }


  // => Periode
  @override
  Future<Either<Failure, Periode>> createPeriode(Periode periode) {
    // TODO: implement createPeriode
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Periode>> getPeriode() {
    // TODO: implement getPeriode
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Periode>> updatePeriode(Periode periode) {
    // TODO: implement updatePeriode
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deletePeriode(Periode periode) {
    // TODO: implement deletePeriode
    throw UnimplementedError();
  }


  // => Peserta
  @override
  Future<Either<Failure, Peserta>> createPeserta(Peserta peserta) {
    // TODO: implement createPeserta
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Peserta>> getPeserta() {
    // TODO: implement getPeserta
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Peserta>> updatePeserta(Peserta peserta) {
    // TODO: implement updatePeserta
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deletePeserta(int idPeserta) {
    // TODO: implement deletePeserta
    throw UnimplementedError();
  }


  // => Prestasi
  @override
  Future<Either<Failure, Prestasi>> createPrestasi(Prestasi prestasi) {
    // TODO: implement createPrestasi
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Prestasi>> getPrestasi() {
    // TODO: implement getPrestasi
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Prestasi>> updatePrestasi(Prestasi prestasi) {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi) {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }


  // => Rincian Biaya Kegiatan
  @override
  Future<Either<Failure, RincianBiayaKegiatan>> createRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RincianBiayaKegiatan>> getRincianBiayaKegiatan() {
    // TODO: implement getRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RincianBiayaKegiatan>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }


  // => Rincian Laporan
  @override
  Future<Either<Failure, RincianLaporan>> createRincianLaporan(RincianLaporan rincianLaporan) {
    // TODO: implement createRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RincianLaporan>> getRincianLaporan() {
    // TODO: implement getRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RincianLaporan>> updateRincianLaporan(RincianLaporan rincianLaporan) {
    // TODO: implement updateRincianLaporan
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteRincianLaporan(int idRincianL) {
    // TODO: implement deleteRincianLaporan
    throw UnimplementedError();
  }


  // => Riwayat MPT
  @override
  Future<Either<Failure, RiwayatMpt>> createRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RiwayatMpt>> getRiwayatMpt() {
    // TODO: implement getRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, RiwayatMpt>> updateRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }


  // => Session
  @override
  Future<Either<Failure, Session>> createSession(Session session) {
    // TODO: implement createSession
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Session>> getSession() {
    // TODO: implement getSession
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, Session>> updateSession(Session session) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteSession(int idSession) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }


  // => Tertib Acara
  @override
  Future<Either<Failure, TertibAcara>> createTertibAcara(TertibAcara tertibAcara) {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, TertibAcara>> getTertibAcara() {
    // TODO: implement getTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, TertibAcara>> updateTertibAcara(TertibAcara tertibAcara) {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }


  // => User
  @override
  Future<Either<Failure, User>> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, User>> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> deleteUser(int idUser) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }


  // => Usulan

  @override
  Future<Either<Failure, UsulanKegiatan>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan) {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> getUsulanKegiatan() {
    // TODO: implement getUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan) {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan) {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }

}