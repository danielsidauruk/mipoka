import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PesertaKegiatanLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  PesertaKegiatanLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<PesertaKegiatanLaporan>>> readAllPesertaKegiatanLaporan() {
    return mipokaRepositories.readAllPesertaKegiatanLaporan();
  }

  Future<Either<Failure, PesertaKegiatanLaporan>> readPesertaKegiatanLaporan(int idPesertaKegiatanLaporan) {
    return mipokaRepositories.readPesertaKegiatanLaporan(idPesertaKegiatanLaporan);
  }

  Future<Either<Failure, String>> createPesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    return mipokaRepositories.createPesertaKegiatanLaporan(pesertaKegiatanLaporan);
  }

  Future<Either<Failure, String>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    return mipokaRepositories.updatePesertaKegiatanLaporan(pesertaKegiatanLaporan);
  }

  Future<Either<Failure, String>> deletePesertaKegiatanLaporan(int idPesertaKegiatanLaporan) {
    return mipokaRepositories.deletePesertaKegiatanLaporan(idPesertaKegiatanLaporan);
  }
}
