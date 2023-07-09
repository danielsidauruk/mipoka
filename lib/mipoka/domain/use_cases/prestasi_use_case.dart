import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PrestasiUseCase {
  final MipokaRepositories mipokaRepositories;

  PrestasiUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Prestasi>>> readAllPrestasi(String filter) {
    return mipokaRepositories.readAllPrestasi(filter);
  }

  Future<Either<Failure, Prestasi>> readPrestasi(int idPrestasi) {
    return mipokaRepositories.readPrestasi(idPrestasi);
  }

  Future<Either<Failure, void>> createPrestasi(Prestasi prestasi) {
    return mipokaRepositories.createPrestasi(prestasi);
  }

  Future<Either<Failure, void>> updatePrestasi(Prestasi prestasi) {
    return mipokaRepositories.updatePrestasi(prestasi);
  }

  Future<Either<Failure, void>> deletePrestasi(int idPrestasi) {
    return mipokaRepositories.deletePrestasi(idPrestasi);
  }
}
