import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
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

abstract class MipokaRepositories {
  Future<Either<Failure, List<Berita>>> readAllBerita(String filter);
  Future<Either<Failure, Berita>> readBerita(int idBerita);
  Future<Either<Failure, void>> createBerita(Berita berita);
  Future<Either<Failure, void>> updateBerita(Berita berita);
  Future<Either<Failure, void>> deleteBerita(int beritaId);

  Future<Either<Failure, Admin>> readAdmin(int idAdmin);
  Future<Either<Failure, void>> createAdmin(Admin admin);
  Future<Either<Failure, void>> updateAdmin(Admin admin);
  Future<Either<Failure, void>> deleteAdmin(int adminId);

  Future<Either<Failure, void>> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatan biayaKegiatan,
  });
  Future<Either<Failure, void>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, void>> deleteBiayaKegiatan(int idNamaBiayaKegiatan);

  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt();
  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt);
  Future<Either<Failure, void>> createKegiatanMpt(KegiatanMpt kegiatanMpt);
  Future<Either<Failure, void>> updateKegiatanMpt(KegiatanMpt kegiatanMpt);
  Future<Either<Failure, void>> deleteKegiatanMpt(int idKegiatanMpt);

  Future<Either<Failure, List<Laporan>>> readAllLaporan(String filter);
  Future<Either<Failure, Laporan>> readLaporan(int idLaporan);
  Future<Either<Failure, void>> createLaporan(Laporan laporan);
  Future<Either<Failure, void>> updateLaporan(Laporan laporan);
  Future<Either<Failure, void>> deleteLaporan(int idLaporan);

  Future<Either<Failure, List<Ormawa>>> readAllOrmawa();
  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa);
  Future<Either<Failure, void>> createOrmawa(Ormawa ormawa);
  Future<Either<Failure, void>> updateOrmawa(Ormawa ormawa);
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa);

  Future<Either<Failure, void>> createPartisipan({
    required int idUsulanKegiatan,
    required Partisipan partisipan,
  });
  Future<Either<Failure, void>> updatePartisipan(Partisipan partisipan);
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan);

  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt();
  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt);
  Future<Either<Failure, void>> createPeriodeMpt(PeriodeMpt periodeMpt);
  Future<Either<Failure, void>> updatePeriodeMpt(PeriodeMpt periodeMpt);
  Future<Either<Failure, void>> deletePeriodeMpt(int idPeriode);

  Future<Either<Failure, void>> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporan pesertaKegiatanLaporan,
  });
  Future<Either<Failure, void>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan);
  Future<Either<Failure, void>> deletePesertaKegiatanLaporan(int idPeserta);

  Future<Either<Failure, List<Prestasi>>> readAllPrestasi();
  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi);
  Future<Either<Failure, void>> createPrestasi(Prestasi prestasi);
  Future<Either<Failure, void>> updatePrestasi(Prestasi prestasi);
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi);

  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan);
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan);
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan);
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan);

  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan);
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan);
  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan);
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan);

  Future<Either<Failure, void>> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatan rincianBiayaKegiatan,
  });
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<Either<Failure, List<RiwayatMpt>>> readAllRiwayatMpt();
  Future<Either<Failure, RiwayatMpt>> readRiwayatMpt(int idRiwayatMpt);
  Future<Either<Failure, void>> createRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, void>> updateRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt);

  Future<Either<Failure, List<Session>>> readAllSession(String filter);
  Future<Either<Failure, Session>> readSession(int idSession);
  Future<Either<Failure, void>> createSession(Session session);
  Future<Either<Failure, void>> updateSession(Session session);
  Future<Either<Failure, void>> deleteSession(int idSession);

  Future<Either<Failure, void>> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcara tertibAcara,
  });
  Future<Either<Failure, void>> updateTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara);

  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser();
  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser);
  Future<Either<Failure, void>> createMipokaUser(MipokaUser mipokaUser);
  Future<Either<Failure, void>> updateMipokaUser(MipokaUser mipokaUser);
  Future<Either<Failure, void>> deleteMipokaUser(String idMipokaUser);

  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan(String filter);
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan);
  Future<Either<Failure, void>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, void>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan);
}