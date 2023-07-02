import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class KegiatanMptUseCase {
  final MipokaRepositories mipokaRepositories;

  KegiatanMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<KegiatanPerPeriodeMpt>>> readAllKegiatanMpt(String filter) {
    return mipokaRepositories.readAllKegiatanMpt(filter);
  }

  Future<Either<Failure, KegiatanPerPeriodeMpt>> readKegiatanMpt(int idKegiatanMpt) {
    return mipokaRepositories.readKegiatanMpt(idKegiatanMpt);
  }

  Future<Either<Failure, void>> createKegiatan(KegiatanPerPeriodeMpt kegiatan) {
    return mipokaRepositories.createKegiatanMpt(kegiatan);
  }

  Future<Either<Failure, void>> updateKegiatanMpt(KegiatanPerPeriodeMpt kegiatan) {
    return mipokaRepositories.updateKegiatanMpt(kegiatan);
  }

  Future<Either<Failure, void>> deleteKegiatanMpt(int idKegiatan) {
    return mipokaRepositories.deleteKegiatanMpt(idKegiatan);
  }
}
