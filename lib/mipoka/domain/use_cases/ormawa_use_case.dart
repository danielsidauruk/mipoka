import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class OrmawaUseCase {
  final MipokaRepositories mipokaRepositories;

  OrmawaUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Ormawa>>> readAllOrmawa() {
    return mipokaRepositories.readAllOrmawa();
  }

  Future<Either<Failure, Ormawa>> readOrmawa(int idOrmawa) {
    return mipokaRepositories.readOrmawa(idOrmawa);
  }

  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa) {
    return mipokaRepositories.createOrmawa(ormawa);
  }

  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa) {
    return mipokaRepositories.updateOrmawa(ormawa);
  }

  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa) {
    return mipokaRepositories.deleteOrmawa(idOrmawa);
  }
}
