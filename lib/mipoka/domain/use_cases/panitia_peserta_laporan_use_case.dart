import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PanitiaPesertaLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  PanitiaPesertaLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<PanitiaPesertaLaporan>>> readPanitiaPesertaL() {
    return mipokaRepositories.readPanitiaPesertaLaporan();
  }

  Future<Either<Failure, String>> createPanitiaPesertaL(PanitiaPesertaLaporan panitiaPesertaL) {
    return mipokaRepositories.createPanitiaPesertaLaporan(panitiaPesertaL);
  }

  Future<Either<Failure, String>> updatePanitiaPesertaLaporan(PanitiaPesertaLaporan panitiaPesertaL) {
    return mipokaRepositories.updatePanitiaPesertaLaporan(panitiaPesertaL);
  }

  Future<Either<Failure, String>> deletePanitiaPesertaLaporan(int idPanitiaPesertaL) {
    return mipokaRepositories.deletePanitiaPesertaLaporan(idPanitiaPesertaL);
  }
}
