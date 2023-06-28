import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class BiayaKegiatanUseCase {
  final MipokaRepositories mipokaRepositories;

  BiayaKegiatanUseCase({required this.mipokaRepositories});

  // Future<Either<Failure, List<BiayaKegiatan>>> readAllBiayaKegiatan() {
  //   return mipokaRepositories.readAllBiayaKegiatan();
  // }
  //
  // Future<Either<Failure, BiayaKegiatan>> readBiayaKegiatan(int biayaKegiatan) {
  //   return mipokaRepositories.readBiayaKegiatan(biayaKegiatan);
  // }
  //
  // Future<Either<Failure, String>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
  //   return mipokaRepositories.createBiayaKegiatan(biayaKegiatan);
  // }
  //
  // Future<Either<Failure, String>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) {
  //   return mipokaRepositories.updateBiayaKegiatan(biayaKegiatan);
  // }
  //
  // Future<Either<Failure, String>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) {
  //   return mipokaRepositories.deleteBiayaKegiatan(idNamaBiayaKegiatan);
  // }
}
