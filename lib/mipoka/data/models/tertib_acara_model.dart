import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';

class TertibAcaraModel extends TertibAcara {
  const TertibAcaraModel({
    required int idTertibAcara,
    required TimeOfDay waktuMulai,
    required TimeOfDay waktuSelesai,
    required String aktivitas,
    required String keterangan,
  }) : super(
    idTertibAcara: idTertibAcara,
    waktuMulai: waktuMulai,
    waktuSelesai: waktuSelesai,
    aktivitas: aktivitas,
    keterangan: keterangan,
  );

  factory TertibAcaraModel.fromEntity(TertibAcara tertibAcara) {
    return TertibAcaraModel(
      idTertibAcara: tertibAcara.idTertibAcara,
      waktuMulai: tertibAcara.waktuMulai,
      waktuSelesai: tertibAcara.waktuSelesai,
      aktivitas: tertibAcara.aktivitas,
      keterangan: tertibAcara.keterangan,
    );
  }

  factory TertibAcaraModel.fromJson(Map<String, dynamic> json) {
    return TertibAcaraModel(
      idTertibAcara: json['idTertibAcara'],
      waktuMulai: TimeOfDay.fromDateTime(DateTime.parse(json['waktuMulai'])),
      waktuSelesai: TimeOfDay.fromDateTime(DateTime.parse(json['waktuSelesai'])),
      aktivitas: json['aktivitas'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idTertibAcara': idTertibAcara,
      'waktuMulai': '${waktuMulai.hour}:${waktuMulai.minute}',
      'waktuSelesai': '${waktuSelesai.hour}:${waktuSelesai.minute}',
      'aktivitas': aktivitas,
      'keterangan': keterangan,
    };
  }
}
