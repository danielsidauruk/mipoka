import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/lampiran_laporan_model.dart';

class LampiranLaporan extends Equatable {
  final int idLampiran;
  final String lampiranA;
  final String lampiranB;
  final String lampiranC;
  final String lampiranD;

  const LampiranLaporan({
    required this.idLampiran,
    required this.lampiranA,
    required this.lampiranB,
    required this.lampiranC,
    required this.lampiranD,
  });

  LampiranLaporanModel toLampiranLaporanModel() {
    return LampiranLaporanModel(
      idLampiran: idLampiran,
      lampiranA: lampiranA,
      lampiranB: lampiranB,
      lampiranC: lampiranC,
      lampiranD: lampiranD,
    );
  }

  @override
  List<Object?> get props => [
    idLampiran,
    lampiranA,
    lampiranB,
    lampiranC,
    lampiranD,
  ];
}
