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

  Future<Either<Failure, Admin>> readAdmin();
  Future<Either<Failure, Admin>> createAdmin(Admin admin);
  Future<Either<Failure, Admin>> updateAdmin(Admin admin);
  Future<Either<Failure, void>> deleteAdmin(int adminId);

  Future<Either<Failure, BiayaKegiatan>> getBiayaKegiatan(String namaBiayaKegiatan);
  Future<Either<Failure, BiayaKegiatan>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, BiayaKegiatan>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan);
  Future<Either<Failure, void>> deleteBiayaKegiatan(String namaBiayaKegiatan);

  Future<Either<Failure, Kegiatan>> getKegiatan();
  Future<Either<Failure, Kegiatan>> createKegiatan(Kegiatan kegiatan);
  Future<Either<Failure, Kegiatan>> updateKegiatan(Kegiatan kegiatan);
  Future<Either<Failure, void>> deleteKegiatan(int idKegiatan);

  Future<Either<Failure, Lampiran>> getLampiran();
  Future<Either<Failure, Lampiran>> createLampiran(Lampiran lampiran);
  Future<Either<Failure, Lampiran>> updateLampiran(Lampiran lampiran);
  Future<Either<Failure, void>> deleteLampiran(int idLampiran);

  Future<Either<Failure, LampiranLaporan>> getLampiranLaporan();
  Future<Either<Failure, LampiranLaporan>> createLampiranLaporan(LampiranLaporan lampiranLaporan);
  Future<Either<Failure, LampiranLaporan>> updateLampiranLaporan(LampiranLaporan lampiranLaporan);
  Future<Either<Failure, void>> deleteLampiranLaporan(int idLampiranLaporan);

  Future<Either<Failure, Ormawa>> getOrmawa();
  Future<Either<Failure, Ormawa>> createOrmawa(Ormawa ormawa);
  Future<Either<Failure, Ormawa>> updateOrmawa(Ormawa ormawa);
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa);

  Future<Either<Failure, PanitiaPesertaL>> getPanitiaPesertaL();
  Future<Either<Failure, PanitiaPesertaL>> createPanitiaPesertaL(PanitiaPesertaL panitiaPesertaL);
  Future<Either<Failure, PanitiaPesertaL>> updatePanitiaPesertaL(PanitiaPesertaL panitiaPesertaL);
  Future<Either<Failure, void>> deletePanitiaPesertaL(int idPanitiaPesertaL);

  Future<Either<Failure, Partisipan>> getPartisipan();
  Future<Either<Failure, Partisipan>> createPartisipan(Partisipan partisipan);
  Future<Either<Failure, Partisipan>> updatePartisipan(Partisipan partisipan);
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan);

  Future<Either<Failure, Periode>> getPeriode();
  Future<Either<Failure, Periode>> createPeriode(Periode periode);
  Future<Either<Failure, Periode>> updatePeriode(Periode periode);
  Future<Either<Failure, void>> deletePeriode(Periode periode);

  Future<Either<Failure, Peserta>> getPeserta();
  Future<Either<Failure, Peserta>> createPeserta(Peserta peserta);
  Future<Either<Failure, Peserta>> updatePeserta(Peserta peserta);
  Future<Either<Failure, void>> deletePeserta(int idPeserta);

  Future<Either<Failure, Prestasi>> getPrestasi();
  Future<Either<Failure, Prestasi>> createPrestasi(Prestasi prestasi);
  Future<Either<Failure, Prestasi>> updatePrestasi(Prestasi prestasi);
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi);

  Future<Either<Failure, RincianBiayaKegiatan>> getRincianBiayaKegiatan();
  Future<Either<Failure, RincianBiayaKegiatan>> createRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, RincianBiayaKegiatan>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan);
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<Either<Failure, RincianLaporan>> getRincianLaporan();
  Future<Either<Failure, RincianLaporan>> createRincianLaporan(RincianLaporan rincianLaporan);
  Future<Either<Failure, RincianLaporan>> updateRincianLaporan(RincianLaporan rincianLaporan);
  Future<Either<Failure, void>> deleteRincianLaporan(int idRincianL);

  Future<Either<Failure, RiwayatMpt>> getRiwayatMpt();
  Future<Either<Failure, RiwayatMpt>> createRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, RiwayatMpt>> updateRiwayatMpt(RiwayatMpt riwayatMpt);
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt);

  Future<Either<Failure, Session>> getSession();
  Future<Either<Failure, Session>> createSession(Session session);
  Future<Either<Failure, Session>> updateSession(Session session);
  Future<Either<Failure, void>> deleteSession(int idSession);

  Future<Either<Failure, TertibAcara>> getTertibAcara();
  Future<Either<Failure, TertibAcara>> createTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, TertibAcara>> updateTertibAcara(TertibAcara tertibAcara);
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara);

  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, void>> deleteUser(int idUser);

  Future<Either<Failure, UsulanKegiatan>> getUsulanKegiatan();
  Future<Either<Failure, UsulanKegiatan>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, UsulanKegiatan>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan);
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan);
}
