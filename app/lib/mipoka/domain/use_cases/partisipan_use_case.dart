import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PartisipanUseCase {
  final MipokaRepositories mipokaRepositories;

  PartisipanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, void>> createPartisipan({
    required int idUsulanKegiatan,
    required Partisipan partisipan,
  }) {
    return mipokaRepositories.createPartisipan(
      idUsulanKegiatan: idUsulanKegiatan,
      partisipan: partisipan,
    );
  }

  Future<Either<Failure, void>> updatePartisipan(Partisipan partisipan) {
    return mipokaRepositories.updatePartisipan(partisipan);
  }

  Future<Either<Failure, void>> deletePartisipan(int idPartisipan) {
    return mipokaRepositories.deletePartisipan(idPartisipan);
  }
}
