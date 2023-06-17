import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class LampiranUseCase {
  final MipokaRepositories mipokaRepositories;

  LampiranUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Lampiran>>> readLampiran() {
    return mipokaRepositories.readLampiran();
  }

  Future<Either<Failure, String>> createLampiran(Lampiran lampiran) {
    return mipokaRepositories.createLampiran(lampiran);
  }

  Future<Either<Failure, String>> updateLampiran(Lampiran lampiran) {
    return mipokaRepositories.updateLampiran(lampiran);
  }

  Future<Either<Failure, String>> deleteLampiran(int idLampiran) {
    return mipokaRepositories.deleteLampiran(idLampiran);
  }
}
