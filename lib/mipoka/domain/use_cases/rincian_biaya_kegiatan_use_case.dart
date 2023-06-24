import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RincianBiayaKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  RincianBiayaKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<BiayaKegiatan>>> readRincianBiayaKegiatan() {
    return mipokaRepositories.readRincianBiayaKegiatan();
  }

  Future<Either<Failure, String>> createRincianBiayaKegiatan(BiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.createRincianBiayaKegiatan(rincianBiayaKegiatan);
  }

  Future<Either<Failure, String>> updateRincianBiayaKegiatan(BiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.updateRincianBiayaKegiatan(rincianBiayaKegiatan);
  }

  Future<Either<Failure, String>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    return mipokaRepositories.deleteRincianBiayaKegiatan(idRincianBiayaKegiatan);
  }
}
