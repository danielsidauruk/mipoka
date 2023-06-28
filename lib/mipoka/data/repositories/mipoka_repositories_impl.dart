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
  Future<Either<Failure, void>> createBerita(Berita berita) async {
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBerita(int beritaId) async {
    // TODO: implement deleteBerita
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Berita>>> readAllBerita() async {
    // TODO: implement readAllBerita
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Berita>> readBerita(int idBerita) async {
    // TODO: implement readBerita
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBerita(Berita berita) async {
    // TODO: implement updateBerita
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Berita Repositories
  @override
  Future<Either<Failure, void>> createAdmin(Admin admin) async {
    // TODO: implement createAdmin
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAdmin(int adminId) async {
    // TODO: implement deleteAdmin
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Admin>> readAdmin(int idAdmin) async {
    // TODO: implement readAdmin
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateAdmin(Admin admin) async {
    // TODO: implement updateAdmin
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => BiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createBiayaKegiatan({required int idUsulanKegiatan, required BiayaKegiatan biayaKegiatan}) async {
    // TODO: implement createBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) async {
    // TODO: implement deleteBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) async {
    // TODO: implement updateBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    // TODO: implement createKegiatanMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteKegiatanMpt(int idKegiatanMpt) async {
    // TODO: implement deleteKegiatanMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt() async {
    // TODO: implement readAllKegiatanMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt) async {
    // TODO: implement readKegiatanMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    // TODO: implement updateKegiatanMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createLaporan(Laporan laporan) async {
    // TODO: implement createLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteLaporan(int idLaporan) async {
    // TODO: implement deleteLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Laporan>>> readAllLaporan() async {
    // TODO: implement readAllLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Laporan>> readLaporan(int idLaporan) async {
    // TODO: implement readLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateLaporan(Laporan laporan) async {
    // TODO: implement updateLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Ormawa Repositories
  @override
  Future<Either<Failure, void>> createOrmawa(Ormawa ormawa) async {
    // TODO: implement createOrmawa
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa) async {
    // TODO: implement deleteOrmawa
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Ormawa>>> readAllOrmawa() async {
    // TODO: implement readAllOrmawa
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa) async {
    // TODO: implement readOrmawa
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateOrmawa(Ormawa ormawa) async {
    // TODO: implement updateOrmawa
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Partisipan Repositories
  @override
  Future<Either<Failure, void>> createPartisipan({required int idUsulanKegiatan, required Partisipan partisipan}) async {
    // TODO: implement createPartisipan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan) async {
    // TODO: implement deletePartisipan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePartisipan(Partisipan partisipan) async {
    // TODO: implement updatePartisipan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

// TODO: => PeriodeMpt Repositories
  @override
  Future<Either<Failure, void>> createPeriodeMpt(PeriodeMpt periodeMpt) async {
    // TODO: implement createPeriodeMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePeriodeMpt(int idPeriode) async {
    // TODO: implement deletePeriodeMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt() async {
    // TODO: implement readAllPeriodeMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt) async {
    // TODO: implement readPeriodeMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePeriodeMpt(PeriodeMpt periodeMpt) async {
    // TODO: implement updatePeriodeMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

// TODO: => PesertaKegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createPesertaKegiatanLaporan({required int idLaporan, required PesertaKegiatanLaporan pesertaKegiatanLaporan}) async {
    // TODO: implement createPesertaKegiatanLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePesertaKegiatanLaporan(int idPeserta) async {
    // TODO: implement deletePesertaKegiatanLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) async {
    // TODO: implement updatePesertaKegiatanLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Prestasi Repositories
  @override
  Future<Either<Failure, void>> createPrestasi(Prestasi prestasi) async {
    // TODO: implement createPrestasi
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi) async {
    // TODO: implement deletePrestasi
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Prestasi>>> readAllPrestasi() async {
    // TODO: implement readAllPrestasi
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi) async {
    // TODO: implement readPrestasi
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePrestasi(Prestasi prestasi) async {
    // TODO: implement updatePrestasi
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RevisiLaporan Repositories
  @override
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan) async {
    // TODO: implement createRevisiLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan) async {
    // TODO: implement deleteRevisiLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan) async {
    // TODO: implement readRevisiLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan) async {
    // TODO: implement updateRevisiLaporan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RevisiUsulan Repositories
  @override
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan) async {
    // TODO: implement createRevisiUsulan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan) async {
    // TODO: implement deleteRevisiUsulan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan) async {
    // TODO: implement readRevisiUsulan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan) async {
    // TODO: implement updateRevisiUsulan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RincianBiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createRincianBiayaKegiatan({required int idLaporan, required RincianBiayaKegiatan rincianBiayaKegiatan}) async {
    // TODO: implement createRincianBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    // TODO: implement deleteRincianBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) async {
    // TODO: implement updateRincianBiayaKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RiwayatMpt Repositories
  @override
  Future<Either<Failure, void>> createRiwayatMpt(RiwayatMpt riwayatMpt) async {
    // TODO: implement createRiwayatMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt) async {
    // TODO: implement deleteRiwayatMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RiwayatMpt>>> readAllRiwayatMpt() async {
    // TODO: implement readAllRiwayatMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RiwayatMpt>> readRiwayatMpt(int idRiwayatMpt) async {
    // TODO: implement readRiwayatMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRiwayatMpt(RiwayatMpt riwayatMpt) async {
    // TODO: implement updateRiwayatMpt
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Session Repositories
  @override
  Future<Either<Failure, void>> createSession(Session session) async {
    // TODO: implement createSession
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession(int idSession) async {
    // TODO: implement deleteSession
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Session>>> readAllSession() async {
    // TODO: implement readAllSession
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Session>> readSession(int idSession) async {
    // TODO: implement readSession
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateSession(Session session) async {
    // TODO: implement updateSession
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => TertibAcara Repositories
  @override
  Future<Either<Failure, void>> createTertibAcara({required int idUsulanKegiatan, required TertibAcara tertibAcara}) async {
    // TODO: implement createTertibAcara
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) async {
    // TODO: implement deleteTertibAcara
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTertibAcara(TertibAcara tertibAcara) async {
    // TODO: implement updateTertibAcara
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => MipokaUser Repositories
  @override
  Future<Either<Failure, void>> createMipokaUser(MipokaUser mipokaUser) async {
    // TODO: implement createMipokaUser
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMipokaUser(String idMipokaUser) async {
    // TODO: implement deleteMipokaUser
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser() async {
    // TODO: implement readAllMipokaUser
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser) async {
    // TODO: implement readMipokaUser
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMipokaUser(MipokaUser mipokaUser) async {
    // TODO: implement updateMipokaUser
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => UsulanKegiatan Repositories
  @override
  Future<Either<Failure, void>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan) async {
    // TODO: implement createUsulanKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan) async {
    // TODO: implement deleteUsulanKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan() async {
    // TODO: implement readAllUsulanKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan) async {
    // TODO: implement readUsulanKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan) async {
    // TODO: implement updateUsulanKegiatan
    try {
      return Right(await mipokaDataSources.);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
