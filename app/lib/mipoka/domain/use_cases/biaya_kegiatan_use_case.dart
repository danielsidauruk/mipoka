import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class BiayaKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  BiayaKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, void>> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatan biayaKegiatan,
  }) {
    return mipokaRepositories.createBiayaKegiatan(
      idUsulanKegiatan: idUsulanKegiatan,
      biayaKegiatan: biayaKegiatan,
    );
  }

  Future<Either<Failure, void>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
    return mipokaRepositories.updateBiayaKegiatan(biayaKegiatan);
  }

  Future<Either<Failure, void>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) {
    return mipokaRepositories.deleteBiayaKegiatan(idNamaBiayaKegiatan);
  }
}
