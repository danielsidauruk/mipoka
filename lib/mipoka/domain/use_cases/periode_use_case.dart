import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/periode.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PeriodeUseCase {
  final MipokaRepositories mipokaRepositories;

  PeriodeUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Periode>>> readPeriode() {
    return mipokaRepositories.readPeriode();
  }

  Future<Either<Failure, String>> createPeriode(Periode periode) {
    return mipokaRepositories.createPeriode(periode);
  }

  Future<Either<Failure, String>> updatePeriode(Periode periode) {
    return mipokaRepositories.updatePeriode(periode);
  }

  Future<Either<Failure, String>> deletePeriode(int idPeriode) {
    return mipokaRepositories.deletePeriode(idPeriode);
  }
}
