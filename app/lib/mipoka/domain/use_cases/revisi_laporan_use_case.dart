import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RevisiLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  RevisiLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, RevisiLaporan>> readRevisiLaporan(int idRevisiLaporan) {
    return mipokaRepositories.readRevisiLaporan(idRevisiLaporan);
  }
  Future<Either<Failure, void>> createRevisiLaporan(RevisiLaporan revisiLaporan) {
    return mipokaRepositories.createRevisiLaporan(revisiLaporan);
  }
  Future<Either<Failure, void>> updateRevisiLaporan(RevisiLaporan revisiLaporan) {
    return mipokaRepositories.updateRevisiLaporan(revisiLaporan);
  }
  Future<Either<Failure, void>> deleteRevisiLaporan(int idRevisiLaporan) {
    return mipokaRepositories.deleteRevisiLaporan(idRevisiLaporan);
  }
}