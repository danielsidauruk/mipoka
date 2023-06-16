import 'package:mipoka/mipoka/domain/entities/lampiran.dart';

class LampiranModel extends Lampiran {
  const LampiranModel({
    required int idLampiran,
    required String lampiranA,
    required String lampiranB,
    required String lampiranC,
    required String lampiranD,
  }) : super(
    idLampiran: idLampiran,
    lampiranA: lampiranA,
    lampiranB: lampiranB,
    lampiranC: lampiranC,
    lampiranD: lampiranD,
  );

  factory LampiranModel.fromEntity(Lampiran lampiran) {
    return LampiranModel(
      idLampiran: lampiran.idLampiran,
      lampiranA: lampiran.lampiranA,
      lampiranB: lampiran.lampiranB,
      lampiranC: lampiran.lampiranC,
      lampiranD: lampiran.lampiranD,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idLampiran': idLampiran,
      'lampiranA': lampiranA,
      'lampiranB': lampiranB,
      'lampiranC': lampiranC,
      'lampiranD': lampiranD,
    };
  }

  static LampiranModel fromJson(Map<String, dynamic> json) {
    return LampiranModel(
      idLampiran: json['idLampiran'],
      lampiranA: json['lampiranA'],
      lampiranB: json['lampiranB'],
      lampiranC: json['lampiranC'],
      lampiranD: json['lampiranD'],
    );
  }
}