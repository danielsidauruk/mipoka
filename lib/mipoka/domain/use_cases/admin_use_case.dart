import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/admin.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class AdminUseCase {
  final MipokaRepositories mipokaRepositories;

  AdminUseCase({required this.mipokaRepositories});

  Future<Either<Failure, Admin>> readAdmin(int idAdmin) {
    return mipokaRepositories.readAdmin(idAdmin);
  }

  Future<Either<Failure, String>> createAdmin(Admin admin) {
    return mipokaRepositories.createAdmin(admin);
  }

  Future<Either<Failure, String>> updateAdmin(Admin admin) {
    return mipokaRepositories.updateAdmin(admin);
  }

  Future<Either<Failure, String>> deleteAdmin(int adminId) {
    return mipokaRepositories.deleteAdmin(adminId);
  }
}