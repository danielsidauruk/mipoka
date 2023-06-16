import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/lampiran_model.dart';

class Lampiran extends Equatable {
  final int idLampiran;
  final String lampiranA;
  final String lampiranB;
  final String lampiranC;
  final String lampiranD;

  const Lampiran({
    required this.idLampiran,
    required this.lampiranA,
    required this.lampiranB,
    required this.lampiranC,
    required this.lampiranD,
  });

  LampiranModel toLampiranModel() {
    return LampiranModel(
      idLampiran: idLampiran,
      lampiranA: lampiranA,
      lampiranB: lampiranB,
      lampiranC: lampiranC,
      lampiranD: lampiranD,
    );
  }

  Lampiran updateWith({
    int? idLampiran,
    String? lampiranA,
    String? lampiranB,
    String? lampiranC,
    String? lampiranD,
  }) {
    return Lampiran(
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
