import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class TertibAcaraUseCase {
  final MipokaRepositories mipokaRepositories;

  TertibAcaraUseCase({required this.mipokaRepositories});

  Future<Either<Failure, void>> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcara tertibAcara,
  }) {
    return mipokaRepositories.createTertibAcara(
      idUsulanKegiatan: idUsulanKegiatan,
      tertibAcara: tertibAcara,
    );
  }

  Future<Either<Failure, void>> updateTertibAcara(TertibAcara tertibAcara) {
    return mipokaRepositories.updateTertibAcara(tertibAcara);
  }

  Future<Either<Failure, void>> deleteTertibAcara(int idTertibAcara) {
    return mipokaRepositories.deleteTertibAcara(idTertibAcara);
  }
}
