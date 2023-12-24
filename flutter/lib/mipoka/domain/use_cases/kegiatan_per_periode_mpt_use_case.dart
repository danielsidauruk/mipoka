import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class KegiatanPerPeriodeMptUseCase {
  final MipokaRepositories mipokaRepositories;

  KegiatanPerPeriodeMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<KegiatanPerPeriodeMpt>>> readAllKegiatanPerPeriodeMpt(String filter) {
    return mipokaRepositories.readAllKegiatanPerPeriodeMpt(filter);
  }

  Future<Either<Failure, KegiatanPerPeriodeMpt>> readKegiatanPerPeriodeMpt(int idKegiatanMpt) {
    return mipokaRepositories.readKegiatanPerPeriodeMpt(idKegiatanMpt);
  }

  Future<Either<Failure, void>> createKegiatanPerPeriodeMpt(KegiatanPerPeriodeMpt kegiatan) {
    return mipokaRepositories.createKegiatanPerPeriodeMpt(kegiatan);
  }

  Future<Either<Failure, void>> updateKegiatanPerPeriodeMpt(KegiatanPerPeriodeMpt kegiatan) {
    return mipokaRepositories.updateKegiatanPerPeriodeMpt(kegiatan);
  }

  Future<Either<Failure, void>> deleteKegiatanPerPeriodeMpt(int idKegiatan) {
    return mipokaRepositories.deleteKegiatanPerPeriodeMpt(idKegiatan);
  }
}
