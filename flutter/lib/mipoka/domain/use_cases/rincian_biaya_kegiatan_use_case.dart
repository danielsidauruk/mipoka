import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class RincianBiayaKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  RincianBiayaKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, void>> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatan rincianBiayaKegiatan,
  }) {
    return mipokaRepositories.createRincianBiayaKegiatan(
      idLaporan: idLaporan,
      rincianBiayaKegiatan: rincianBiayaKegiatan,
    );
  }

  Future<Either<Failure, void>> updateRincianBiayaKegiatan(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return mipokaRepositories.updateRincianBiayaKegiatan(rincianBiayaKegiatan);
  }

  Future<Either<Failure, void>> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) {
    return mipokaRepositories.deleteRincianBiayaKegiatan(idRincianBiayaKegiatan);
  }
}
