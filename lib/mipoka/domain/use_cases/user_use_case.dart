import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class UserUseCase {
  final MipokaRepositories mipokaRepositories;

  UserUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<User>>> readUser() {
    return mipokaRepositories.readUser();
  }

  Future<Either<Failure, String>> createUser(User user) {
    return mipokaRepositories.createUser(user);
  }

  Future<Either<Failure, String>> updateUser(User user) {
    return mipokaRepositories.updateUser(user);
  }

  Future<Either<Failure, String>> deleteUser(int idUser) {
    return mipokaRepositories.deleteUser(idUser);
  }
}
