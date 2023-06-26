import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PesertaUseCase {
  final MipokaRepositories mipokaRepositories;

  PesertaUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Peserta>>> readPeserta() {
    return mipokaRepositories.readPeserta();
  }

  Future<Either<Failure, String>> createPeserta(Peserta peserta) {
    return mipokaRepositories.createPeserta(peserta);
  }

  Future<Either<Failure, String>> updatePeserta(Peserta peserta) {
    return mipokaRepositories.updatePeserta(peserta);
  }

  Future<Either<Failure, String>> deletePeserta(int idPeserta) {
    return mipokaRepositories.deletePeserta(idPeserta);
  }
}
