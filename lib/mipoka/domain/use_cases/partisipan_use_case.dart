import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PartisipanUseCase {
  final MipokaRepositories mipokaRepositories;

  PartisipanUseCase({required this.mipokaRepositories});

  // Future<Either<Failure, List<Partisipan>>> readAllPartisipan() {
  //   return mipokaRepositories.readAllPartisipan();
  // }
  //
  // Future<Either<Failure, Partisipan>> readPartisipan(int idPartisipan){
  //   return mipokaRepositories.readPartisipan(idPartisipan);
  // }
  //
  // Future<Either<Failure, String>> createPartisipan(Partisipan partisipan) {
  //   return mipokaRepositories.createPartisipan(partisipan);
  // }
  //
  // Future<Either<Failure, String>> updatePartisipan(Partisipan partisipan) {
  //   return mipokaRepositories.updatePartisipan(partisipan);
  // }
  //
  // Future<Either<Failure, String>> deletePartisipan(int idPartisipan) {
  //   return mipokaRepositories.deletePartisipan(idPartisipan);
  // }
}
