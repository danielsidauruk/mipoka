import 'package:dartz/dartz.dart';
import 'package:mipoka/core/exception.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
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
import 'package:mipoka/mipoka/domain/entities/admin.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class MipokaRepositoriesImpl implements MipokaRepositories {
  final MipokaDataSources mipokaDataSources;

  MipokaRepositoriesImpl({required this.mipokaDataSources});


  // TODO: => Berita Repositories
  @override
  Future<Either<Failure, void>> createBerita(Berita berita) {
    // TODO: implement createBerita
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteBerita(int beritaId) {
    // TODO: implement deleteBerita
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Berita>>> readAllBerita() {
    // TODO: implement readAllBerita
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Berita>> readBerita(int idBerita) {
    // TODO: implement readBerita
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateBerita(Berita berita) {
    // TODO: implement updateBerita
    throw UnimplementedError();
  }


  // TODO: => Berita Repositories
  @override
  Future<Either<Failure, void>> createAdmin(Admin admin) {
    // TODO: implement createAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteAdmin(int adminId) {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Admin>> readAdmin(int idAdmin) {
    // TODO: implement readAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateAdmin(Admin admin) {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }


  // TODO: => BiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createBiayaKegiatan({required int idUsulanKegiatan, required BiayaKegiatan biayaKegiatan}) {
    // TODO: implement createBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) {
    // TODO: implement deleteBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
    // TODO: implement updateBiayaKegiatan
    throw UnimplementedError();
  }


  // TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createKegiatanMpt(KegiatanMpt kegiatanMpt) {
    // TODO: implement createKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteKegiatanMpt(int idKegiatanMpt) {
    // TODO: implement deleteKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt() {
    // TODO: implement readAllKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt) {
    // TODO: implement readKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateKegiatanMpt(KegiatanMpt kegiatanMpt) {
    // TODO: implement updateKegiatanMpt
    throw UnimplementedError();
  }


  // TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createLaporan(Laporan laporan) {
    // TODO: implement createLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteLaporan(int idLaporan) {
    // TODO: implement deleteLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Laporan>>> readAllLaporan() {
    // TODO: implement readAllLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Laporan>> readLaporan(int idLaporan) {
    // TODO: implement readLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateLaporan(Laporan laporan) {
    // TODO: implement updateLaporan
    throw UnimplementedError();
  }


  // TODO: => Ormawa Repositories
  @override
  Future<Either<Failure, void>> createOrmawa(Ormawa ormawa) {
    // TODO: implement createOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa) {
    // TODO: implement deleteOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Ormawa>>> readAllOrmawa() {
    // TODO: implement readAllOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa) {
    // TODO: implement readOrmawa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateOrmawa(Ormawa ormawa) {
    // TODO: implement updateOrmawa
    throw UnimplementedError();
  }


  // TODO: => Partisipan Repositories
  @override
  Future<Either<Failure, void>> createPartisipan({required int idUsulanKegiatan, required Partisipan partisipan}) {
    // TODO: implement createPartisipan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan) {
    // TODO: implement deletePartisipan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePartisipan(Partisipan partisipan) {
    // TODO: implement updatePartisipan
    throw UnimplementedError();
  }

  // TODO: => PeriodeMpt Repositories
  @override
  Future<Either<Failure, void>> createPeriodeMpt(PeriodeMpt periodeMpt) {
    // TODO: implement createPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePeriodeMpt(int idPeriode) {
    // TODO: implement deletePeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt() {
    // TODO: implement readAllPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt) {
    // TODO: implement readPeriodeMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePeriodeMpt(PeriodeMpt periodeMpt) {
    // TODO: implement updatePeriodeMpt
    throw UnimplementedError();
  }

  // TODO: => PesertaKegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createPesertaKegiatanLaporan({required int idLaporan, required PesertaKegiatanLaporan pesertaKegiatanLaporan}) {
    // TODO: implement createPesertaKegiatanLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePesertaKegiatanLaporan(int idPeserta) {
    // TODO: implement deletePesertaKegiatanLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    // TODO: implement updatePesertaKegiatanLaporan
    throw UnimplementedError();
  }


  // TODO: => Prestasi Repositories
  @override
  Future<Either<Failure, void>> createPrestasi(Prestasi prestasi) {
    // TODO: implement createPrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi) {
    // TODO: implement deletePrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Prestasi>>> readAllPrestasi() {
    // TODO: implement readAllPrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi) {
    // TODO: implement readPrestasi
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePrestasi(Prestasi prestasi) {
    // TODO: implement updatePrestasi
    throw UnimplementedError();
  }


// TODO: => RevisiLaporan Repositories
  @override
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan) {
    // TODO: implement createRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan) {
    // TODO: implement deleteRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan) {
    // TODO: implement readRevisiLaporan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan) {
    // TODO: implement updateRevisiLaporan
    throw UnimplementedError();
  }


  // TODO: => RevisiUsulan Repositories
  @override
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan) {
    // TODO: implement createRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan) {
    // TODO: implement deleteRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan) {
    // TODO: implement readRevisiUsulan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan) {
    // TODO: implement updateRevisiUsulan
    throw UnimplementedError();
  }


  // TODO: => RincianBiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createRincianBiayaKegiatan({required int idLaporan, required RincianBiayaKegiatan rincianBiayaKegiatan}) {
    // TODO: implement createRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    // TODO: implement deleteRincianBiayaKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    // TODO: implement updateRincianBiayaKegiatan
    throw UnimplementedError();
  }


  // TODO: => RiwayatMpt Repositories
  @override
  Future<Either<Failure, void>> createRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement createRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement deleteRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RiwayatMpt>>> readAllRiwayatMpt() {
    // TODO: implement readAllRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RiwayatMpt>> readRiwayatMpt(int idRiwayatMpt) {
    // TODO: implement readRiwayatMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateRiwayatMpt(RiwayatMpt riwayatMpt) {
    // TODO: implement updateRiwayatMpt
    throw UnimplementedError();
  }


  // TODO: => Session Repositories
  @override
  Future<Either<Failure, void>> createSession(Session session) {
    // TODO: implement createSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteSession(int idSession) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Session>>> readAllSession() {
    // TODO: implement readAllSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Session>> readSession(int idSession) {
    // TODO: implement readSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateSession(Session session) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }


  // TODO: => TertibAcara Repositories
  @override
  Future<Either<Failure, void>> createTertibAcara({required int idUsulanKegiatan, required TertibAcara tertibAcara}) {
    // TODO: implement createTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateTertibAcara(TertibAcara tertibAcara) {
    // TODO: implement updateTertibAcara
    throw UnimplementedError();
  }


  // TODO: => MipokaUser Repositories
  @override
  Future<Either<Failure, void>> createMipokaUser(MipokaUser mipokaUser) {
    // TODO: implement createMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteMipokaUser(String idMipokaUser) {
    // TODO: implement deleteMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser() {
    // TODO: implement readAllMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser) {
    // TODO: implement readMipokaUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateMipokaUser(MipokaUser mipokaUser) {
    // TODO: implement updateMipokaUser
    throw UnimplementedError();
  }


  // TODO: => UsulanKegiatan Repositories
  @override
  Future<Either<Failure, void>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan) {
    // TODO: implement createUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan) {
    // TODO: implement deleteUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan() {
    // TODO: implement readAllUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan) {
    // TODO: implement readUsulanKegiatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan) {
    // TODO: implement updateUsulanKegiatan
    throw UnimplementedError();
  }
}
