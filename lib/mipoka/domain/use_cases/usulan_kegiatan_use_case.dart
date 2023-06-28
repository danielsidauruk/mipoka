import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class UsulanKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  UsulanKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<UsulanKegiatan>>> readAllUsulanKegiatan() {
    return mipokaRepositories.readAllUsulanKegiatan();
  }

  Future<Either<Failure, UsulanKegiatan>> readUsulanKegiatan(int idUsulanKegiatan) {
    return mipokaRepositories.readUsulanKegiatan(idUsulanKegiatan);
  }

  Future<Either<Failure, String>> createUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    return mipokaRepositories.createUsulanKegiatan(usulanKegiatan);
  }

  Future<Either<Failure, String>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    return mipokaRepositories.updateUsulanKegiatan(usulanKegiatan);
  }

  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan) {
    return mipokaRepositories.deleteUsulanKegiatan(idUsulan);
  }

  Future<Either<Failure, void>> deletePartisipan
      ({required int idUsulanKegiatan, required int idPartisipan}) {
    return mipokaRepositories.deletePartisipan(
      idUsulanKegiatan: idUsulanKegiatan,
      idPartisipan: idPartisipan,
    );
  }

  Future<Either<Failure, void>> deleteBiayaKegiatan
      ({required int idUsulanKegiatan, required int idBiayaKegiatan}) {
    return mipokaRepositories.deleteBiayaKegiatan(
      idUsulanKegiatan: idUsulanKegiatan,
      idBiayaKegiatan: idBiayaKegiatan,
    );
  }
}
