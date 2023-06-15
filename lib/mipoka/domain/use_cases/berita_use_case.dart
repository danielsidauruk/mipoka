import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class BeritaUseCase{
  final MipokaRepositories mipokaRepositories;
  BeritaUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Berita>>> readBerita() {
    return mipokaRepositories.readBerita();
  }

  Future<Either<Failure, String>> createBerita(Berita berita) {
    return mipokaRepositories.createBerita(berita);
  }

  Future<Either<Failure, String>> updateBerita(Berita berita) {
    return mipokaRepositories.updateBerita(berita);
  }

  Future<Either<Failure, void>> deleteBerita(int beritaId) {
    return mipokaRepositories.deleteBerita(beritaId);
  }
}