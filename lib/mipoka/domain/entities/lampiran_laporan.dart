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

  LampiranLaporan updateWith({
    int? idLampiran,
    String? lampiranA,
    String? lampiranB,
    String? lampiranC,
    String? lampiranD,
  }) {
    return LampiranLaporan(
      idLampiran: idLampiran ?? this.idLampiran,
      lampiranA: lampiranA ?? this.lampiranA,
      lampiranB: lampiranB ?? this.lampiranB,
      lampiranC: lampiranC ?? this.lampiranC,
      lampiranD: lampiranD ?? this.lampiranD,
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
