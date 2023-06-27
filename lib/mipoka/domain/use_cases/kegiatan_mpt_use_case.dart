import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class KegiatanMptUseCase {
  final MipokaRepositories mipokaRepositories;

  KegiatanMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<KegiatanMpt>>> readAllKegiatanMpt() {
    return mipokaRepositories.readAllKegiatanMpt();
  }

  Future<Either<Failure, KegiatanMpt>> readKegiatanMpt(int idKegiatanMpt) {
    return mipokaRepositories.readKegiatanMpt(idKegiatanMpt);
  }

  Future<Either<Failure, String>> createKegiatan(KegiatanMpt kegiatan) {
    return mipokaRepositories.createKegiatanMpt(kegiatan);
  }

  Future<Either<Failure, String>> updateKegiatanMpt(KegiatanMpt kegiatan) {
    return mipokaRepositories.updateKegiatanMpt(kegiatan);
  }

  Future<Either<Failure, String>> deleteKegiatanMpt(int idKegiatan) {
    return mipokaRepositories.deleteKegiatanMpt(idKegiatan);
  }
}
