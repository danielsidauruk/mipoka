import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RiwayatMptUseCase {
  final MipokaRepositories mipokaRepositories;

  RiwayatMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<RiwayatMpt>>> readRiwayatMpt() {
    return mipokaRepositories.readRiwayatMpt();
  }

  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt) {
    return mipokaRepositories.createRiwayatMpt(riwayatMpt);
  }

  Future<Either<Failure, String>> updateRiwayatMpt(RiwayatMpt riwayatMpt) {
    return mipokaRepositories.updateRiwayatMpt(riwayatMpt);
  }

  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt) {
    return mipokaRepositories.deleteRiwayatMpt(idRiwayatMpt);
  }
}
