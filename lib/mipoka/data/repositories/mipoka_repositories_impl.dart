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
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
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
      return Right(await mipokaDataSources.createBerita(
          BeritaModel.fromEntity(berita)),
      );
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBerita(int beritaId) async {
    try {
      return Right(await mipokaDataSources.deleteBerita(beritaId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Berita>>> readAllBerita(String filter) async {
    try {
      return Right(await mipokaDataSources.readAllBerita(filter));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Berita>> readBerita(int idBerita) async {
    try {
      return Right(await mipokaDataSources.readBerita(idBerita));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBerita(Berita berita) async {
    try {
      return Right(await mipokaDataSources.updateBerita(
          BeritaModel.fromEntity(berita)),);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Berita Repositories
  @override
  Future<Either<Failure, void>> createAdmin(Admin admin) async {
    try {
      return Right(await mipokaDataSources.createAdmin(
          AdminModel.fromEntity(admin)),
      );
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAdmin(int adminId) async {
    try {
      return Right(await mipokaDataSources.deleteAdmin(adminId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Admin>> readAdmin(int idAdmin) async {
    // TODO: implement readAdmin
    try {
      return Right(await mipokaDataSources.readAdmin(idAdmin));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateAdmin(Admin admin) async {
    try {
      return Right(await mipokaDataSources.updateAdmin(AdminModel.fromEntity(admin)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => BiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatan biayaKegiatan,
  }) async {
    try {
      return Right(await mipokaDataSources.createBiayaKegiatan(
        idUsulanKegiatan: idUsulanKegiatan,
        biayaKegiatanModel: BiayaKegiatanModel.fromEntity(biayaKegiatan),
      ));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteBiayaKegiatan(idNamaBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateBiayaKegiatan(BiayaKegiatanModel.fromEntity(biayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // TODO: => JenisKegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createJenisKegiatanMpt(JenisKegiatanMpt jenisKegiatanMpt) {
    // TODO: implement createJenisKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteJenisKegiatanMpt(int idJenisKegiatanMpt) {
    // TODO: implement deleteJenisKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<JenisKegiatanMpt>>> readJenisKegiatanMpt() {
    // TODO: implement readJenisKegiatanMpt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateJenisKegiatanMpt(JenisKegiatanMpt jenisKegiatanMpt) {
    // TODO: implement updateJenisKegiatanMpt
    throw UnimplementedError();
  }


// TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    try {
      return Right(await mipokaDataSources.createKegiatanMpt(KegiatanMptModel.fromEntity(kegiatanMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteKegiatanMpt(int idKegiatanMpt) async {
    try {
      return Right(await mipokaDataSources.deleteKegiatanMpt(idKegiatanMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt() async {
    try {
      return Right(await mipokaDataSources.readAllKegiatanMpt());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt) async {
    try {
      return Right(await mipokaDataSources.readKegiatanMpt(idKegiatanMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    try {
      return Right(await mipokaDataSources.updateKegiatanMpt(KegiatanMptModel.fromEntity(kegiatanMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => KegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources.createLaporan(LaporanModel.fromEntity(laporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteLaporan(int idLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteLaporan(idLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Laporan>>> readAllLaporan(String filter) async {
    try {
      return Right(await mipokaDataSources.readAllLaporan(filter));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Laporan>> readLaporan(int idLaporan) async {
    try {
      return Right(await mipokaDataSources.readLaporan(idLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources.updateLaporan(LaporanModel.fromEntity(laporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Ormawa Repositories
  @override
  Future<Either<Failure, void>> createOrmawa(Ormawa ormawa) async {
    try {
      return Right(await mipokaDataSources.createOrmawa(OrmawaModel.fromEntity(ormawa)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrmawa(int idOrmawa) async {
    try {
      return Right(await mipokaDataSources.deleteOrmawa(idOrmawa));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Ormawa>>> readAllOrmawa() async {
    try {
      return Right(await mipokaDataSources.readAllOrmawa());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa) async {
    try {
      return Right(await mipokaDataSources.readOrmawa(idOrmawa));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateOrmawa(Ormawa ormawa) async {
    try {
      return Right(await mipokaDataSources.updateOrmawa(OrmawaModel.fromEntity(ormawa)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Partisipan Repositories
  @override
  Future<Either<Failure, void>> createPartisipan({required int idUsulanKegiatan, required Partisipan partisipan}) async {
    try {
      return Right(await mipokaDataSources.createPartisipan(
        idUsulanKegiatan: idUsulanKegiatan,
        partisipanModel: PartisipanModel.fromEntity(partisipan),
      ));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePartisipan(int idPartisipan) async {
    try {
      return Right(await mipokaDataSources.deletePartisipan(idPartisipan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePartisipan(Partisipan partisipan) async {
    try {
      return Right(await mipokaDataSources.updatePartisipan(PartisipanModel.fromEntity(partisipan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

// TODO: => PeriodeMpt Repositories
  @override
  Future<Either<Failure, void>> createPeriodeMpt(PeriodeMpt periodeMpt) async {
    try {
      return Right(await mipokaDataSources.createPeriodeMpt(PeriodeMptModel.fromEntity(periodeMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePeriodeMpt(int idPeriode) async {
    try {
      return Right(await mipokaDataSources.deletePeriodeMpt(idPeriode));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt() async {
    try {
      return Right(await mipokaDataSources.readAllPeriodeMpt());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt) async {
    try {
      return Right(await mipokaDataSources.readPeriodeMpt(idPeriodeMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePeriodeMpt(PeriodeMpt periodeMpt) async {
    try {
      return Right(await mipokaDataSources.updatePeriodeMpt(PeriodeMptModel.fromEntity(periodeMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

// TODO: => PesertaKegiatanMpt Repositories
  @override
  Future<Either<Failure, void>> createPesertaKegiatanLaporan({required int idLaporan, required PesertaKegiatanLaporan pesertaKegiatanLaporan}) async {
    try {
      return Right(await mipokaDataSources.createPesertaKegiatanLaporan(
        idLaporan: idLaporan,
        pesertaKegiatanLaporanModel: PesertaKegiatanLaporanModel.fromEntity(pesertaKegiatanLaporan),
      ));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePesertaKegiatanLaporan(int idPeserta) async {
    try {
      return Right(await mipokaDataSources.deletePesertaKegiatanLaporan(idPeserta));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) async {
    try {
      return Right(await mipokaDataSources.updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel.fromEntity(pesertaKegiatanLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Prestasi Repositories
  @override
  Future<Either<Failure, void>> createPrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources.createPrestasi(PrestasiModel.fromEntity(prestasi)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deletePrestasi(int idPrestasi) async {
    try {
      return Right(await mipokaDataSources.deletePrestasi(idPrestasi));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Prestasi>>> readAllPrestasi() async {
    try {
      return Right(await mipokaDataSources.readAllPrestasi());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi) async {
    try {
      return Right(await mipokaDataSources.readPrestasi(idPrestasi));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources.updatePrestasi(PrestasiModel.fromEntity(prestasi)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RevisiLaporan Repositories
  @override
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan) async {
    try {
      return Right(await mipokaDataSources.createRevisiLaporan(RevisiLaporanModel.fromEntity(revisiLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteRevisiLaporan(idRevisiLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan) async {
    try {
      return Right(await mipokaDataSources.readRevisiLaporan(idRevisiLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan) async {
    try {
      return Right(await mipokaDataSources.updateRevisiLaporan(RevisiLaporanModel.fromEntity(revisiLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RevisiUsulan Repositories
  @override
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan) async {
    try {
      return Right(await mipokaDataSources.createRevisiUsulan(RevisiUsulanModel.fromEntity(revisiUsulan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan) async {
    try {
      return Right(await mipokaDataSources.deleteRevisiUsulan(idRevisiUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan) async {
    try {
      return Right(await mipokaDataSources.readRevisiUsulan(idRevisiUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan) async {
    try {
      return Right(await mipokaDataSources.updateRevisiUsulan(RevisiUsulanModel.fromEntity(revisiUsulan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RincianBiayaKegiatan Repositories
  @override
  Future<Either<Failure, void>> createRincianBiayaKegiatan({required int idLaporan, required RincianBiayaKegiatan rincianBiayaKegiatan}) async {
    try {
      return Right(await mipokaDataSources.createRincianBiayaKegiatan(
          idLaporan: idLaporan,
          rincianBiayaKegiatanModel: RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)),
      );
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteRincianBiayaKegiatan(idRincianBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateRincianBiayaKegiatan(RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => RiwayatMpt Repositories
  @override
  Future<Either<Failure, void>> createRiwayatMpt(RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources.createRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRiwayatMpt(int idRiwayatMpt) async {
    try {
      return Right(await mipokaDataSources.deleteRiwayatMpt(idRiwayatMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RiwayatMpt>>> readAllRiwayatMpt() async {
    try {
      return Right(await mipokaDataSources.readAllRiwayatMpt());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RiwayatMpt>> readRiwayatMpt(int idRiwayatMpt) async {
    try {
      return Right(await mipokaDataSources.readRiwayatMpt(idRiwayatMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRiwayatMpt(RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources.updateRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => Session Repositories
  @override
  Future<Either<Failure, void>> createSession(Session session) async {
    try {
      return Right(await mipokaDataSources.createSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession(int idSession) async {
    try {
      return Right(await mipokaDataSources.deleteSession(idSession));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Session>>> readAllSession(String filter) async {
    try {
      return Right(await mipokaDataSources.readAllSession(filter));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Session>> readSession(int idSession) async {
    try {
      return Right(await mipokaDataSources.readSession(idSession));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateSession(Session session) async {
    try {
      return Right(await mipokaDataSources.updateSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => TertibAcara Repositories
  @override
  Future<Either<Failure, void>> createTertibAcara({required int idUsulanKegiatan, required TertibAcara tertibAcara}) async {
    try {
      return Right(await mipokaDataSources.createTertibAcara(
        idUsulanKegiatan: idUsulanKegiatan,
        tertibAcaraModel: TertibAcaraModel.fromEntity(tertibAcara),
      ));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) async {
    try {
      return Right(await mipokaDataSources.deleteTertibAcara(idTertibAcara));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTertibAcara(TertibAcara tertibAcara) async {
    try {
      return Right(await mipokaDataSources.updateTertibAcara(TertibAcaraModel.fromEntity(tertibAcara)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => MipokaUser Repositories
  @override
  Future<Either<Failure, void>> createMipokaUser(MipokaUser mipokaUser) async {
    try {
      return Right(await mipokaDataSources.createMipokaUser(MipokaUserModel.fromEntity(mipokaUser)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMipokaUser(String idMipokaUser) async {
    try {
      return Right(await mipokaDataSources.deleteMipokaUser(idMipokaUser));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser() async {
    try {
      return Right(await mipokaDataSources.readAllMipokaUser());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser) async {
    try {
      return Right(await mipokaDataSources.readMipokaUser(idMipokaUser));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMipokaUser(MipokaUser mipokaUser) async {
    try {
      return Right(await mipokaDataSources.updateMipokaUser(MipokaUserModel.fromEntity(mipokaUser)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


// TODO: => UsulanKegiatan Repositories
  @override
  Future<Either<Failure, void>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.createUsulanKegiatan(UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan) async {
    try {
      return Right(await mipokaDataSources.deleteUsulanKegiatan(idUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan(String filter) async {
    try {
      return Right(await mipokaDataSources.readAllUsulanKegiatan(filter));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.readUsulanKegiatan(idUsulanKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateUsulanKegiatan(UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateUsulanKegiatan(UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
