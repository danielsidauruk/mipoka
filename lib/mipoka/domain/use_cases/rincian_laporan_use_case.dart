import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RincianLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  RincianLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<RincianLaporan>>> readRincianLaporan() {
    return mipokaRepositories.readRincianLaporan();
  }

  Future<Either<Failure, String>> createRincianLaporan(RincianLaporan rincianLaporan) {
    return mipokaRepositories.createRincianLaporan(rincianLaporan);
  }

  Future<Either<Failure, String>> updateRincianLaporan(RincianLaporan rincianLaporan) {
    return mipokaRepositories.updateRincianLaporan(rincianLaporan);
  }

  Future<Either<Failure, String>> deleteRincianLaporan(int idRincianL) {
    return mipokaRepositories.deleteRincianLaporan(idRincianL);
  }
}
