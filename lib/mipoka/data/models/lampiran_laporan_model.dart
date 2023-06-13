import 'package:mipoka/mipoka/domain/entities/lampiran_laporan.dart';

class LampiranLaporanModel extends LampiranLaporan {
  const LampiranLaporanModel({
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

  Map<String, dynamic> toJson() {
    return {
      'idLampiran': idLampiran,
      'lampiranA': lampiranA,
      'lampiranB': lampiranB,
      'lampiranC': lampiranC,
      'lampiranD': lampiranD,
    };
  }

  static LampiranLaporanModel fromJson(Map<String, dynamic> json) {
    return LampiranLaporanModel(
      idLampiran: json['idLampiran'],
      lampiranA: json['lampiranA'],
      lampiranB: json['lampiranB'],
      lampiranC: json['lampiranC'],
      lampiranD: json['lampiranD'],
    );
  }
}