import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
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

abstract class MipokaRepositories {
  Future<Either<Failure, List<Berita>>> readBerita();
  Future<Either<Failure, String>> createBerita(Berita berita);
  Future<Either<Failure, String>> updateBerita(Berita berita);
  Future<Either<Failure, String>> deleteBerita(int beritaId);

  Future<Either<Failure, List<Admin>>> readAdmin();
  Future<Either<Failure, String>> createAdmin(Admin admin);
  Future<Either<Failure, String>> updateAdmin(Admin admin);
  Future<Either<Failure, String>> deleteAdmin(int adminId);

  Future<Either<Failure, List<BiayaKegiatan>>> readBiayaKegiatan(String namaBiayaKegiatan);
  Future<Either<Failure, String>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, String>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, String>> deleteBiayaKegiatan(int idNamaBiayaKegiatan);

  Future<Either<Failure, List<Kegiatan>>> readKegiatan();
  Future<Either<Failure, String>> createKegiatan(Kegiatan kegiatan);
  Future<Either<Failure, String>> updateKegiatan(Kegiatan kegiatan);
  Future<Either<Failure, String>> deleteKegiatan(int idKegiatan);

  Future<Either<Failure, List<Lampiran>>> readLampiran();
  Future<Either<Failure, String>> createLampiran(Lampiran lampiran);
  Future<Either<Failure, String>> updateLampiran(Lampiran lampiran);
  Future<Either<Failure, String>> deleteLampiran(int idLampiran);

  Future<Either<Failure, List<LampiranLaporan>>> readLampiranLaporan();
  Future<Either<Failure, String>> createLampiranLaporan(
      LampiranLaporan lampiranLaporan);
  Future<Either<Failure, String>> updateLampiranLaporan(
      LampiranLaporan lampiranLaporan);
  Future<Either<Failure, String>> deleteLampiranLaporan(int idLampiranLaporan);

  Future<Either<Failure, List<Ormawa>>> readOrmawa();
  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa);
  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa);
  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa);

  Future<Either<Failure, List<PanitiaPesertaL>>> readPanitiaPesertaL();
  Future<Either<Failure, String>> createPanitiaPesertaL(
      PanitiaPesertaL panitiaPesertaL);
  Future<Either<Failure, String>> updatePanitiaPesertaL(
      PanitiaPesertaL panitiaPesertaL);
  Future<Either<Failure, String>> deletePanitiaPesertaL(int idPanitiaPesertaL);

  Future<Either<Failure, List<Partisipan>>> readPartisipan();
  Future<Either<Failure, String>> createPartisipan(Partisipan partisipan);
  Future<Either<Failure, String>> updatePartisipan(Partisipan partisipan);
  Future<Either<Failure, String>> deletePartisipan(int idPartisipan);

  Future<Either<Failure, List<Periode>>> readPeriode();
  Future<Either<Failure, String>> createPeriode(Periode periode);
  Future<Either<Failure, String>> updatePeriode(Periode periode);
  Future<Either<Failure, String>> deletePeriode(int idPeriode);

  Future<Either<Failure, List<Peserta>>> readPeserta();
  Future<Either<Failure, String>> createPeserta(Peserta peserta);
  Future<Either<Failure, String>> updatePeserta(Peserta peserta);
  Future<Either<Failure, String>> deletePeserta(int idPeserta);

  Future<Either<Failure, List<Prestasi>>> readPrestasi();
  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi);
  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi);
  Future<Either<Failure, String>> deletePrestasi(int idPrestasi);

  Future<Either<Failure, List<RincianBiayaKegiatan>>> readRincianBiayaKegiatan();
  Future<Either<Failure, String>> createRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, String>> updateRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, String>> deleteRincianBiayaKegiatan(
      int idRincianBiayaKegiatan);

  Future<Either<Failure, List<RincianLaporan>>> readRincianLaporan();
  Future<Either<Failure, String>> createRincianLaporan(
      RincianLaporan rincianLaporan);
  Future<Either<Failure, String>> updateRincianLaporan(
      RincianLaporan rincianLaporan);
  Future<Either<Failure, String>> deleteRincianLaporan(int idRincianL);

  Future<Either<Failure, List<RiwayatMpt>>> readRiwayatMpt();
  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, String>> updateRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt);

  Future<Either<Failure, List<Session>>> readSession();
  Future<Either<Failure, String>> createSession(Session session);
  Future<Either<Failure, String>> updateSession(Session session);
  Future<Either<Failure, String>> deleteSession(int idSession);

  Future<Either<Failure, List<TertibAcara>>> readTertibAcara();
  Future<Either<Failure, String>> createTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, String>> updateTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara);

  Future<Either<Failure, List<User>>> readUser();
  Future<Either<Failure, String>> createUser(User user);
  Future<Either<Failure, String>> updateUser(User user);
  Future<Either<Failure, String>> deleteUser(int idUser);

  Future<Either<Failure, List<UsulanKegiatan>>> readUsulanKegiatan();
  Future<Either<Failure, String>> createUsulanKegiatan(
      UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, String>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan);
}
