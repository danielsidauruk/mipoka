import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PrestasiUseCase {
  final MipokaRepositories mipokaRepositories;

  PrestasiUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Prestasi>>> readPrestasi() {
    return mipokaRepositories.readPrestasi();
  }

  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi) {
    return mipokaRepositories.createPrestasi(prestasi);
  }

  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi) {
    return mipokaRepositories.updatePrestasi(prestasi);
  }

  Future<Either<Failure, String>> deletePrestasi(int idPrestasi) {
    return mipokaRepositories.deletePrestasi(idPrestasi);
  }
}
