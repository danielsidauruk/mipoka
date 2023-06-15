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

  Future<Either<Failure, Berita>> createBerita(Berita berita) {
    return mipokaRepositories.createBerita(berita);
  }
}