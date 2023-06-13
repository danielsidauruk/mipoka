import 'package:dartz/dartz.dart';
import 'package:mipoka/core/use_case.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class ReadBerita extends UseCase<Berita, NoParams> {
  final MipokaRepositories mipokaRepositories;
  ReadBerita({required this.mipokaRepositories});

  @override
  Future<Either<Failure, Berita>> call(NoParams params) {
    return mipokaRepositories.readBerita();
  }
}