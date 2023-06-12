import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
    idLampiran,
    lampiranA,
    lampiranB,
    lampiranC,
    lampiranD,
  ];
}
