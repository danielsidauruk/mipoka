import 'package:equatable/equatable.dart';

class Lampiran extends Equatable {
  final int idLampiran;
  final String? lampiranA;
  final String? lampiranB;
  final String? lampiranC;
  final String? lampiranD;

  const Lampiran({
    required this.idLampiran,
    this.lampiranA,
    this.lampiranB,
    this.lampiranC,
    this.lampiranD,
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
