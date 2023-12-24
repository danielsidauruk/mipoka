import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class JenisKegiatanMptUseCase {
  MipokaRepositories mipokaRepositories;

  JenisKegiatanMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<JenisKegiatanMpt>>> readAllJenisKegiatanMpt(String filter) {
    return mipokaRepositories.readAllJenisKegiatanMpt(filter);
  }

  Future<Either<Failure, JenisKegiatanMpt>> readJenisKegiatanMpt(int idJenisKegiatanMpt) {
    return mipokaRepositories.readJenisKegiatanMpt(idJenisKegiatanMpt);
  }

  Future<Either<Failure, void>> createJenisKegiatanMpt(JenisKegiatanMpt jenisKegiatanMpt) {
    return mipokaRepositories.createJenisKegiatanMpt(jenisKegiatanMpt);
  }

  Future<Either<Failure, void>> updateJenisKegiatanMpt(JenisKegiatanMpt jenisKegiatanMpt) {
    return mipokaRepositories.updateJenisKegiatanMpt(jenisKegiatanMpt);
  }

  Future<Either<Failure, void>> deleteJenisKegiatanMpt(int idJenisKegiatan) {
    return mipokaRepositories.deleteJenisKegiatanMpt(idJenisKegiatan);
  }
}