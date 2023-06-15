import 'package:dartz/dartz.dart';
import 'package:mipoka/core/use_case.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class BeritaUseCase extends UseCase<List<Berita>, NoParams> {
  final MipokaRepositories mipokaRepositories;
  BeritaUseCase({required this.mipokaRepositories});

  @override
  Future<Either<Failure, List<Berita>>> readBerita(NoParams params) {
    return mipokaRepositories.readBerita();
  }
}