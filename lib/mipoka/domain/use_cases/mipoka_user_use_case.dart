import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class MipokaUserUseCase {
  final MipokaRepositories mipokaRepositories;

  MipokaUserUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<MipokaUser>>> readAllMipokaUser() {
    return mipokaRepositories.readAllMipokaUser();
  }

  Future<Either<Failure, MipokaUser>> readMipokaUser(String idMipokaUser) {
    return mipokaRepositories.readMipokaUser(idMipokaUser);
  }

  Future<Either<Failure, void>> createMipokaUser(MipokaUser mipokaUser) {
    return mipokaRepositories.createMipokaUser(mipokaUser);
  }

  Future<Either<Failure, void>> updateMipokaUser(MipokaUser mipokaUser) {
    return mipokaRepositories.updateMipokaUser(mipokaUser);
  }

  Future<Either<Failure, void>> deleteMipokaUser(String idMipokaUser) {
    return mipokaRepositories.deleteMipokaUser(idMipokaUser);
  }
}
