import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PeriodeUseCase {
  final MipokaRepositories mipokaRepositories;

  PeriodeUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Periode>>> readPeriode() {
    return mipokaRepositories.readAllPeriodeMpt();
  }

  Future<Either<Failure, String>> createPeriode(Periode periode) {
    return mipokaRepositories.createPeriodeMpt(periode);
  }

  Future<Either<Failure, String>> updatePeriode(Periode periode) {
    return mipokaRepositories.updatePeriodeMpt(periode);
  }

  Future<Either<Failure, String>> deletePeriode(int idPeriode) {
    return mipokaRepositories.deletePeriodeMpt(idPeriode);
  }
}
