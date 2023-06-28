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
  Future<Either<Failure, Berita>> readBerita(int idBerita) async {
    try {
      return Right(await mipokaDataSources.readBerita(idBerita));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Berita>>> readAllBerita() async {
    try {
      return Right(await mipokaDataSources.readAllBerita());
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
  Future<Either<Failure, String>> createAdmin(Admin admin) async {
    try {
      return Right(
          await mipokaDataSources.createAdmin(AdminModel.fromEntity(admin)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Admin>> readAdmin(int idAdmin) async {
    try {
      return Right(await mipokaDataSources.readAdmin(idAdmin));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateAdmin(Admin admin) async {
    try {
      return Right(
          await mipokaDataSources.updateAdmin(AdminModel.fromEntity(admin)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteAdmin(int adminId) async {
    try {
      return Right(await mipokaDataSources.deleteAdmin(adminId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // // => Biaya Kegiatan
  // @override
  // Future<Either<Failure, List<BiayaKegiatan>>> readAllBiayaKegiatan() async {
  //   try {
  //     return Right(await mipokaDataSources.readAllBiayaKegiatan());
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, BiayaKegiatan>> readBiayaKegiatan(int biayaKegiatan) async {
  //   try {
  //     return Right(await mipokaDataSources.readBiayaKegiatan(biayaKegiatan));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> createBiayaKegiatan(
  //     BiayaKegiatan biayaKegiatan) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .createBiayaKegiatan(BiayaKegiatanModel.fromEntity(biayaKegiatan)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> updateBiayaKegiatan(
  //     BiayaKegiatan biayaKegiatan) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .updateBiayaKegiatan(BiayaKegiatanModel.fromEntity(biayaKegiatan)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> deleteBiayaKegiatan(
  //     int idNamaBiayaKegiatan) async {
  //   try {
  //     return Right(
  //         await mipokaDataSources.deleteBiayaKegiatan(idNamaBiayaKegiatan));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }

  // => Kegiatan MPT
  @override
  Future<Either<Failure, String>> createKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    try {
      return Right(await mipokaDataSources
          .createKegiatanMpt(KegiatanMptModel.fromEntity(kegiatanMpt)));
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
  Future<Either<Failure, String>> updateKegiatanMpt(KegiatanMpt kegiatanMpt) async {
    try {
      return Right(await mipokaDataSources
          .updateKegiatanMpt(KegiatanMptModel.fromEntity(kegiatanMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteKegiatanMpt(int idKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteKegiatanMpt(idKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Laporan
  @override
  Future<Either<Failure, String>> createLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources
          .createLaporan(LaporanModel.fromEntity(laporan)));
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
  Future<Either<Failure, List<Laporan>>> readAllLaporan() async {
    try {
      return Right(await mipokaDataSources.readAllLaporan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources
          .updateLaporan(LaporanModel.fromEntity(laporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteLaporan(int idLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteLaporan(idLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Ormawa
  @override
  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa) async {
    try {
      return Right(
          await mipokaDataSources.createOrmawa(OrmawaModel.fromEntity(ormawa)));
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
  Future<Either<Failure, List<Ormawa>>> readAllOrmawa() async {
    try {
      return Right(await mipokaDataSources.readAllOrmawa());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa) async {
    try {
      return Right(
          await mipokaDataSources.updateOrmawa(OrmawaModel.fromEntity(ormawa)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa) async {
    try {
      return Right(await mipokaDataSources.deleteOrmawa(idOrmawa));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // // => Partisipan
  // @override
  // Future<Either<Failure, String>> createPartisipan(
  //     Partisipan partisipan) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .createPartisipan(PartisipanModel.fromEntity(partisipan)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<Partisipan>>> readAllPartisipan() async {
  //   try {
  //     return Right(await mipokaDataSources.readAllPartisipan());
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, Partisipan>> readPartisipan(int idPartisipan) async {
  //   try {
  //     return Right(await mipokaDataSources.readPartisipan(idPartisipan));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> updatePartisipan(
  //     Partisipan partisipan) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .updatePartisipan(PartisipanModel.fromEntity(partisipan)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> deletePartisipan(int idPartisipan) async {
  //   try {
  //     return Right(await mipokaDataSources.deletePartisipan(idPartisipan));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }

  // => Periode MPT
  @override
  Future<Either<Failure, String>> createPeriodeMpt(PeriodeMpt periodeMpt) async {
    try {
      return Right(await mipokaDataSources
          .createPeriodeMpt(PeriodeMptModel.fromEntity(periodeMpt)));
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
  Future<Either<Failure, String>> updatePeriodeMpt(PeriodeMpt periode) async {
    try {
      return Right(await mipokaDataSources
          .updatePeriodeMpt(PeriodeMptModel.fromEntity(periode)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePeriodeMpt(int idPeriode) async {
    try {
      return Right(await mipokaDataSources.deletePeriodeMpt(idPeriode));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Peserta
  @override
  Future<Either<Failure, String>> createPesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) async {
    try {
      return Right(await mipokaDataSources
          .createPesertaKegiatanLaporan(PesertaKegiatanLaporanModel.fromEntity(pesertaKegiatanLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PesertaKegiatanLaporan>>> readAllPesertaKegiatanLaporan() async {
    try {
      return Right(await mipokaDataSources.readAllPesertaKegiatanLaporan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PesertaKegiatanLaporan>> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan) async {
    try {
      return Right(await mipokaDataSources.readPesertaKegiatanLaporan(idPesertaKegiatanLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) async {
    try {
      return Right(await mipokaDataSources
          .updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel.fromEntity(pesertaKegiatanLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePesertaKegiatanLaporan(int idPeserta) async {
    try {
      return Right(await mipokaDataSources.deletePeserta(idPeserta));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Prestasi
  @override
  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources
          .createPrestasi(PrestasiModel.fromEntity(prestasi)));
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
  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources
          .updatePrestasi(PrestasiModel.fromEntity(prestasi)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePrestasi(int idPrestasi) async {
    try {
      return Right(await mipokaDataSources.deletePrestasi(idPrestasi));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Revisi Laporan
  @override
  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan) async {
    try {
      return Right(await mipokaDataSources.readRevisiLaporan(idRevisiLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan) async {
    try {
      return Right(await mipokaDataSources.createRevisiLaporan(RevisiLaporanModel.fromEntity(revisiLaporan)));
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
  @override
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteRevisiLaporan(idRevisiLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Revisi Usulan
  @override
  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan) async {
    try {
      return Right(await mipokaDataSources.readRevisiUsulan(idRevisiUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan) async {
    try {
      return Right(await mipokaDataSources.createRevisiUsulan(RevisiUsulanModel.fromEntity(revisiUsulan)));
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
  @override
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan) async {
    try {
      return Right(await mipokaDataSources.deleteRevisiUsulan(idRevisiUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Rincian Biaya Kegiatan
  @override
  Future<Either<Failure, void>> createRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.createRincianBiayaKegiatan(
          RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RincianBiayaKegiatan>> readRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.readRincianBiayaKegiatan(
          idRincianBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateRincianBiayaKegiatan(
          RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources
          .deleteRincianBiayaKegiatan(idRincianBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Riwayat MPT
  @override
  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources
          .createRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
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
  Future<Either<Failure, String>> updateRiwayatMpt(
      RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources
          .updateRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt) async {
    try {
      return Right(await mipokaDataSources.deleteRiwayatMpt(idRiwayatMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Session
  @override
  Future<Either<Failure, String>> createSession(Session session) async {
    try {
      return Right(await mipokaDataSources
          .createSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Session>>> readAllSession() async {
    try {
      return Right(await mipokaDataSources.readAllSession());
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
  Future<Either<Failure, String>> updateSession(Session session) async {
    try {
      return Right(await mipokaDataSources
          .updateSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteSession(int idSession) async {
    try {
      return Right(await mipokaDataSources.deleteSession(idSession));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // // => Tertib Acara
  // @override
  // Future<Either<Failure, String>> createTertibAcara(
  //     TertibAcara tertibAcara) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .createTertibAcara(TertibAcaraModel.fromEntity(tertibAcara)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<TertibAcara>>> readAllTertibAcara() async {
  //   try {
  //     return Right(await mipokaDataSources.readAllTertibAcara());
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, TertibAcara>> readTertibAcara(int idTertibAcara) async {
  //   try {
  //     return Right(await mipokaDataSources.readTertibAcara(idTertibAcara));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> updateTertibAcara(
  //     TertibAcara tertibAcara) async {
  //   try {
  //     return Right(await mipokaDataSources
  //         .updateTertibAcara(TertibAcaraModel.fromEntity(tertibAcara)));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara) async {
  //   try {
  //     return Right(await mipokaDataSources.deleteTertibAcara(idTertibAcara));
  //   } on ServerException {
  //     return const Left(ServerFailure());
  //   }
  // }

  // => Mipoka User
  @override
  Future<Either<Failure, String>> createMipokaUser(MipokaUser user) async {
    try {
      return Right(
          await mipokaDataSources.createMipokaUser(MipokaUserModel.fromEntity(user)));
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
  Future<Either<Failure, String>> updateMipokaUser(MipokaUser user) async {
    try {
      return Right(
          await mipokaDataSources.updateMipokaUser(MipokaUserModel.fromEntity(user)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteMipokaUser(String idMipokaUser) async {
    try {
      return Right(await mipokaDataSources.deleteMipokaUser(idMipokaUser));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Usulan
  @override
  Future<Either<Failure, String>> createUsulanKegiatan(UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.createUsulanKegiatan(
          UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(
      int idUsulanKegiatan) async {
    try {
      return Right(
          await mipokaDataSources.readUsulanKegiatan(idUsulanKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan() async {
    try {
      return Right(await mipokaDataSources.readAllUsulanKegiatan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateUsulanKegiatan(
          UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan) async {
    try {
      return Right(await mipokaDataSources.deleteUsulanKegiatan(idUsulan));
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
  Future<Either<Failure, void>> deleteBiayaKegiatan(int idBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteBiayaKegiatan(idBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) async {
    // TODO: implement deleteTertibAcara
    throw UnimplementedError();
  }
}
