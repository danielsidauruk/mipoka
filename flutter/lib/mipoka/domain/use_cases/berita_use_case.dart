import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class BeritaUseCase {
  final MipokaRepositories mipokaRepositories;
  BeritaUseCase({required this.mipokaRepositories});

  Future<Either<Failure, Berita>> readBerita(int idBerita) {
    return mipokaRepositories.readBerita(idBerita);
  }

  Future<Either<Failure, List<Berita>>> readAllBerita(String filter) {
    return mipokaRepositories.readAllBerita(filter);
  }

  Future<Either<Failure, void>> createBerita(Berita berita) {
    return mipokaRepositories.createBerita(berita);
  }

  Future<Either<Failure, void>> updateBerita(Berita berita) {
    return mipokaRepositories.updateBerita(berita);
  }

  Future<Either<Failure, void>> deleteBerita(int beritaId) {
    return mipokaRepositories.deleteBerita(beritaId);
  }
}
