import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PeriodeMptUseCase {
  final MipokaRepositories mipokaRepositories;

  PeriodeMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<PeriodeMpt>>> readAllPeriodeMpt() {
    return mipokaRepositories.readAllPeriodeMpt();
  }

  Future<Either<Failure, PeriodeMpt>> readPeriodeMpt(int idPeriodeMpt) {
    return mipokaRepositories.readPeriodeMpt(idPeriodeMpt);
  }

  Future<Either<Failure, String>> createPeriodeMpt(PeriodeMpt periodeMpt) {
    return mipokaRepositories.createPeriodeMpt(periodeMpt);
  }

  Future<Either<Failure, String>> updatePeriode(PeriodeMpt periodeMpt) {
    return mipokaRepositories.updatePeriodeMpt(periodeMpt);
  }

  Future<Either<Failure, String>> deletePeriode(int idPeriodeMpt) {
    return mipokaRepositories.deletePeriodeMpt(idPeriodeMpt);
  }
}
