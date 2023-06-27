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
  Future<Either<Failure, List<Berita>>> readAllBerita();
  Future<Either<Failure, Berita>> readBerita(int idBerita);
  Future<Either<Failure, String>> createBerita(Berita berita);
  Future<Either<Failure, String>> updateBerita(Berita berita);
  Future<Either<Failure, String>> deleteBerita(int beritaId);

  Future<Either<Failure, Admin>> readAdmin(int idAdmin);
  Future<Either<Failure, String>> createAdmin(Admin admin);
  Future<Either<Failure, String>> updateAdmin(Admin admin);
  Future<Either<Failure, String>> deleteAdmin(int adminId);

  Future<Either<Failure, List<BiayaKegiatan>>> readAllBiayaKegiatan();
  Future<Either<Failure, BiayaKegiatan>> readBiayaKegiatan(int biayaKegiatan);
  Future<Either<Failure, String>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, String>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, String>> deleteBiayaKegiatan(int idNamaBiayaKegiatan);

  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt();
  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt);
  Future<Either<Failure, String>> createKegiatanMpt(KegiatanMpt kegiatanMpt);
  Future<Either<Failure, String>> updateKegiatanMpt(KegiatanMpt kegiatanMpt);
  Future<Either<Failure, String>> deleteKegiatanMpt(int idKegiatanMpt);

  Future<Either<Failure, List<Laporan>>> readAllLaporan();
  Future<Either<Failure, Laporan>> readLaporan(int idLaporan);
  Future<Either<Failure, String>> createLaporan(Laporan laporan);
  Future<Either<Failure, String>> updateLaporan(Laporan laporan);
  Future<Either<Failure, String>> deleteLaporan(int idLaporan);

  Future<Either<Failure, List<Ormawa>>> readAllOrmawa();
  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa);
  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa);
  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa);
  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa);

  Future<Either<Failure, List<Partisipan>>> readAllPartisipan();
  Future<Either<Failure, Partisipan>> readPartisipan(int idPartisipan);
  Future<Either<Failure, String>> createPartisipan(Partisipan partisipan);
  Future<Either<Failure, String>> updatePartisipan(Partisipan partisipan);
  Future<Either<Failure, String>> deletePartisipan(int idPartisipan);

  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt();
  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt);
  Future<Either<Failure, String>> createPeriodeMpt(PeriodeMpt periodeMpt);
  Future<Either<Failure, String>> updatePeriodeMpt(PeriodeMpt periodeMpt);
  Future<Either<Failure, String>> deletePeriodeMpt(int idPeriode);

  Future<Either<Failure, List<PesertaKegiatanLaporan>>> readAllPesertaKegiatanLaporan();
  Future<Either<Failure, PesertaKegiatanLaporan>> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan);
  Future<Either<Failure, String>> createPesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan);
  Future<Either<Failure, String>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan);
  Future<Either<Failure, String>> deletePesertaKegiatanLaporan(int idPeserta);

  Future<Either<Failure, List<Prestasi>>> readAllPrestasi();
  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi);
  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi);
  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi);
  Future<Either<Failure, String>> deletePrestasi(int idPrestasi);

  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan);
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan);
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan);
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan);

  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan);
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan);
  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan);
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan);

  Future<Either<Failure, RincianBiayaKegiatan>> readRincianBiayaKegiatan(int idRincianBiayaKegiatan);
  Future<Either<Failure, void>> createRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<Either<Failure, List<RiwayatMpt>>> readAllRiwayatMpt();
  Future<Either<Failure, RiwayatMpt>> readRiwayatMpt(int idRiwayatMpt);
  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, String>> updateRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt);

  Future<Either<Failure, List<Session>>> readAllSession();
  Future<Either<Failure, Session>> readSession(int idSession);
  Future<Either<Failure, String>> createSession(Session session);
  Future<Either<Failure, String>> updateSession(Session session);
  Future<Either<Failure, String>> deleteSession(int idSession);

  Future<Either<Failure, List<TertibAcara>>> readAllTertibAcara();
  Future<Either<Failure, TertibAcara>> readTertibAcara(int idTertibAcara);
  Future<Either<Failure, String>> createTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, String>> updateTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara);

  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser();
  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser);
  Future<Either<Failure, String>> createMipokaUser(MipokaUser mipokaUser);
  Future<Either<Failure, String>> updateMipokaUser(MipokaUser mipokaUser);
  Future<Either<Failure, String>> deleteMipokaUser(String idMipokaUser);

  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan();
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan);
  Future<Either<Failure, String>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, String>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan);
}
