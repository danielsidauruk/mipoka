import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class NamaKegiatanMptUseCase {
  final MipokaRepositories mipokaRepositories;

  NamaKegiatanMptUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<NamaKegiatanMpt>>> readAllNamaKegiatanMpt(int id) {
    return mipokaRepositories.readAllNamaKegiatanMpt(id);
  }

  Future<Either<Failure, NamaKegiatanMpt>> readNamaKegiatanMpt(int idNamaKegiatanMpt) {
    return mipokaRepositories.readNamaKegiatanMpt(idNamaKegiatanMpt);
  }

  Future<Either<Failure, void>> createNamaKegiatanMpt(NamaKegiatanMpt namaKegiatanMpt) {
    return mipokaRepositories.createNamaKegiatanMpt(namaKegiatanMpt);
  }

  Future<Either<Failure, void>> updateNamaKegiatanMpt(NamaKegiatanMpt namaKegiatanMpt) {
    return mipokaRepositories.updateNamaKegiatanMpt(namaKegiatanMpt);
  }

  Future<Either<Failure, void>> deleteNamaKegiatanMpt(int idNamaKegiatanMpt) {
    return mipokaRepositories.deleteNamaKegiatanMpt(idNamaKegiatanMpt);
  }
}