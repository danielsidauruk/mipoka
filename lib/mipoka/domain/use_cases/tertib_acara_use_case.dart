import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class TertibAcaraUseCase {
  final MipokaRepositories mipokaRepositories;

  TertibAcaraUseCase({required this.mipokaRepositories});

  // Future<Either<Failure, List<TertibAcara>>> readAllTertibAcara() {
  //   return mipokaRepositories.readAllTertibAcara();
  // }
  //
  // Future<Either<Failure, TertibAcara>> readTertibAcara(int idTertibAcara) {
  //   return mipokaRepositories.readTertibAcara(idTertibAcara);
  // }
  //
  // Future<Either<Failure, String>> createTertibAcara(TertibAcara tertibAcara) {
  //   return mipokaRepositories.createTertibAcara(tertibAcara);
  // }
  //
  // Future<Either<Failure, String>> updateTertibAcara(TertibAcara tertibAcara) {
  //   return mipokaRepositories.updateTertibAcara(tertibAcara);
  // }
  //
  // Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara) {
  //   return mipokaRepositories.deleteTertibAcara(idTertibAcara);
  // }
}
