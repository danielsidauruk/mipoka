import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class LampiranLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  LampiranLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<LampiranLaporan>>> readLampiranLaporan() {
    return mipokaRepositories.readLampiranLaporan();
  }

  Future<Either<Failure, String>> createLampiranLaporan(LampiranLaporan lampiranLaporan) {
    return mipokaRepositories.createLampiranLaporan(lampiranLaporan);
  }

  Future<Either<Failure, String>> updateLampiranLaporan(LampiranLaporan lampiranLaporan) {
    return mipokaRepositories.updateLampiranLaporan(lampiranLaporan);
  }

  Future<Either<Failure, String>> deleteLampiranLaporan(int idLampiranLaporan) {
    return mipokaRepositories.deleteLampiranLaporan(idLampiranLaporan);
  }
}
