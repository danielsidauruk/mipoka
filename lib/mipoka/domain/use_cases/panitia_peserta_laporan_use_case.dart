import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PanitiaPesertaLUseCase {
  final MipokaRepositories mipokaRepositories;

  PanitiaPesertaLUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<PanitiaPesertaL>>> readPanitiaPesertaL() {
    return mipokaRepositories.readPanitiaPesertaL();
  }

  Future<Either<Failure, String>> createPanitiaPesertaL(PanitiaPesertaL panitiaPesertaL) {
    return mipokaRepositories.createPanitiaPesertaL(panitiaPesertaL);
  }

  Future<Either<Failure, String>> updatePanitiaPesertaL(PanitiaPesertaL panitiaPesertaL) {
    return mipokaRepositories.updatePanitiaPesertaL(panitiaPesertaL);
  }

  Future<Either<Failure, String>> deletePanitiaPesertaL(int idPanitiaPesertaL) {
    return mipokaRepositories.deletePanitiaPesertaL(idPanitiaPesertaL);
  }
}
