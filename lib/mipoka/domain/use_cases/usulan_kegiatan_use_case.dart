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

  Future<Either<Failure, void>> createUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    return mipokaRepositories.createUsulanKegiatan(usulanKegiatan);
  }

  Future<Either<Failure, void>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) {
    return mipokaRepositories.updateUsulanKegiatan(usulanKegiatan);
  }

  Future<Either<Failure, void>> deleteUsulanKegiatan(int idUsulan) {
    return mipokaRepositories.deleteUsulanKegiatan(idUsulan);
  }
}
