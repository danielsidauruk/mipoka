import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class NotifikasiUseCase {
  final MipokaRepositories mipokaRepositories;

  NotifikasiUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Notifikasi>>> readAllNotifikasi(String filter) {
    return mipokaRepositories.readAllNotifikasi(filter);
  }

  Future<Either<Failure, Notifikasi>> readNotifikasi(int idNotifikasi) {
    return mipokaRepositories.readNotifikasi(idNotifikasi);
  }

  Future<Either<Failure, void>> createNotifikasi(Notifikasi notifikasi) {
    return mipokaRepositories.createNotifikasi(notifikasi);
  }

  Future<Either<Failure, void>> updateNotifikasi(Notifikasi notifikasi) {
    return mipokaRepositories.updateNotifikasi(notifikasi);
  }

  Future<Either<Failure, void>> deleteNotifikasi(int idNotifikasi) {
    return mipokaRepositories.deleteNotifikasi(idNotifikasi);
  }
}