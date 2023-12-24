import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RevisiUsulanUseCase {
  MipokaRepositories mipokaRepositories;

  RevisiUsulanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, RevisiUsulan>> readRevisiUsulan(int idRevisiUsulan) {
    return mipokaRepositories.readRevisiUsulan(idRevisiUsulan);
  }

  Future<Either<Failure, void>> createRevisiUsulan(RevisiUsulan revisiUsulan) {
    return mipokaRepositories.createRevisiUsulan(revisiUsulan);
  }

  Future<Either<Failure, void>> updateRevisiUsulan(RevisiUsulan revisiUsulan) {
    return mipokaRepositories.updateRevisiUsulan(revisiUsulan);
  }
  Future<Either<Failure, void>> deleteRevisiUsulan(int idRevisiUsulan) {
    return mipokaRepositories.deleteRevisiLaporan(idRevisiUsulan);
  }
}