import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class LaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  LaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Laporan>>> readLaporan() {
    return mipokaRepositories.readLaporan();
  }

  Future<Either<Failure, String>> createLaporan(Laporan laporan) {
    return mipokaRepositories.createLaporan(laporan);
  }

  Future<Either<Failure, String>> updateLaporan(Laporan laporan) {
    return mipokaRepositories.updateLaporan(laporan);
  }

  Future<Either<Failure, String>> deleteLaporan(int idLaporan) {
    return mipokaRepositories.deleteLaporan(idLaporan);
  }
}