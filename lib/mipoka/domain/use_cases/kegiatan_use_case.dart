import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class KegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  KegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Kegiatan>>> readKegiatan() {
    return mipokaRepositories.readKegiatan();
  }

  Future<Either<Failure, String>> createKegiatan(Kegiatan kegiatan) {
    return mipokaRepositories.createKegiatan(kegiatan);
  }

  Future<Either<Failure, String>> updateKegiatan(Kegiatan kegiatan) {
    return mipokaRepositories.updateKegiatan(kegiatan);
  }

  Future<Either<Failure, String>> deleteKegiatan(int idKegiatan) {
    return mipokaRepositories.deleteKegiatan(idKegiatan);
  }
}
