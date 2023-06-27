import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RincianBiayaKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  RincianBiayaKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, RincianBiayaKegiatan>> readRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    return mipokaRepositories.readRincianBiayaKegiatan(idRincianBiayaKegiatan);
  }

  Future<Either<Failure, void>> createRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.createRincianBiayaKegiatan(rincianBiayaKegiatan);
  }

  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.updateRincianBiayaKegiatan(rincianBiayaKegiatan);
  }

  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.deleteRincianBiayaKegiatan(rincianBiayaKegiatan);
  }
}
