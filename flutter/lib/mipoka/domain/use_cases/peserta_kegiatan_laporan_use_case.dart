import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class PesertaKegiatanLaporanUseCase {
  final MipokaRepositories mipokaRepositories;

  PesertaKegiatanLaporanUseCase({required this.mipokaRepositories});

  Future<Either<Failure, void>> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporan pesertaKegiatanLaporan,
  }) {
    return mipokaRepositories.createPesertaKegiatanLaporan(
      idLaporan: idLaporan,
      pesertaKegiatanLaporan: pesertaKegiatanLaporan,
    );
  }

  Future<Either<Failure, void>> updatePesertaKegiatanLaporan(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    return mipokaRepositories.updatePesertaKegiatanLaporan(pesertaKegiatanLaporan);
  }

  Future<Either<Failure, void>> deletePesertaKegiatanLaporan(int idPesertaKegiatanLaporan) {
    return mipokaRepositories.deletePesertaKegiatanLaporan(idPesertaKegiatanLaporan);
  }
}
