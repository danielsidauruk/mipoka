import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RiwayatKegiatanMptUseCase {
  final MipokaRepositories mipokaRepositories;

  RiwayatKegiatanMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<RiwayatKegiatanMpt>>> readAllRiwayatKegiatanMpt() {
    return mipokaRepositories.readAllRiwayatKegiatanMpt();
  }

  Future<Either<Failure, RiwayatKegiatanMpt>> readRiwayatKegiatanMpt(int idRiwayatKegiatanMpt) {
    return mipokaRepositories.readRiwayatKegiatanMpt(idRiwayatKegiatanMpt);
  }

  Future<Either<Failure, void>> createRiwayatKegiatanMpt(RiwayatKegiatanMpt riwayatKegiatanMpt) {
    return mipokaRepositories.createRiwayatKegiatanMpt(riwayatKegiatanMpt);
  }

  Future<Either<Failure, void>> updateRiwayatKegiatanMpt(RiwayatKegiatanMpt riwayatKegiatanMpt) {
    return mipokaRepositories.updateRiwayatKegiatanMpt(riwayatKegiatanMpt);
  }

  Future<Either<Failure, void>> deleteRiwayatKegiatanMpt(int idRiwayatKegiatanMpt) {
    return mipokaRepositories.deleteRiwayatKegiatanMpt(idRiwayatKegiatanMpt);
  }
}
