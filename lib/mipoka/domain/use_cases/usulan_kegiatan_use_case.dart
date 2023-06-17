import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class UsulanKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  UsulanKegiatanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<UsulanKegiatan>>> readUsulanKegiatan() {
    return mipokaRepositories.readUsulanKegiatan();
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
}
