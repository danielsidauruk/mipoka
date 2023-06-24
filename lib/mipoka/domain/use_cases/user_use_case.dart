import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class UserUseCase {
  final MipokaRepositories mipokaRepositories;

  UserUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<MipokaUser>>> readUser() {
    return mipokaRepositories.readUser();
  }

  Future<Either<Failure, String>> createUser(MipokaUser user) {
    return mipokaRepositories.createUser(user);
  }

  Future<Either<Failure, String>> updateUser(MipokaUser user) {
    return mipokaRepositories.updateUser(user);
  }

  Future<Either<Failure, String>> deleteUser(int idUser) {
    return mipokaRepositories.deleteUser(idUser);
  }
}
