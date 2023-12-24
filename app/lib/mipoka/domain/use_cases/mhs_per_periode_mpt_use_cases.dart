import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class MhsPerPeriodeMptUseCases {
  MipokaRepositories mipokaRepositories;

  MhsPerPeriodeMptUseCases({required this.mipokaRepositories});

  Future<Either<Failure, List<MhsPerPeriodeMpt>>> readAllMhsPerPeriodeMpt(String filter) async {
    return mipokaRepositories.readAllMhsPerPeriodeMpt(filter);
  }

  Future<Either<Failure, MhsPerPeriodeMpt>> readMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    return mipokaRepositories.readMhsPerPeriodeMpt(idMhsPerPeriodeMpt);
  }

  Future<Either<Failure, void>> createMhsPerPeriodeMpt(MhsPerPeriodeMpt mhsPerPeriodeMpt) async {
    return mipokaRepositories.createMhsPerPeriodeMpt(mhsPerPeriodeMpt);
  }

  Future<Either<Failure, void>> updateMhsPerPeriodeMpt(MhsPerPeriodeMpt mhsPerPeriodeMpt) async {
    return mipokaRepositories.updateMhsPerPeriodeMpt(mhsPerPeriodeMpt);
  }

  Future<Either<Failure, void>> deleteMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    return mipokaRepositories.deleteMhsPerPeriodeMpt(idMhsPerPeriodeMpt);
  }
}