import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';

// => Just Updated
class TertibAcaraModel extends TertibAcara {
  const TertibAcaraModel({
    required super.idTertibAcara,
    required super.waktuMulai,
    required super.waktuSelesai,
    required super.aktivitas,
    required super.keterangan,
  });

  factory TertibAcaraModel.fromEntity(TertibAcara tertibAcara) {
    return TertibAcaraModel(
      idTertibAcara: tertibAcara.idTertibAcara,
      waktuMulai: tertibAcara.waktuMulai,
      waktuSelesai: tertibAcara.waktuSelesai,
      aktivitas: tertibAcara.aktivitas,
      keterangan: tertibAcara.keterangan,
    );
  }

  factory TertibAcaraModel.fromJson(Map<String, dynamic> json) => TertibAcaraModel(
    idTertibAcara: json["idTertibAcara"],
    waktuMulai: json["waktuMulai"],
    waktuSelesai: json["waktuSelesai"],
    aktivitas: json["aktivitas"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "idTertibAcara": idTertibAcara,
    "waktuMulai": waktuMulai,
    "waktuSelesai": waktuSelesai,
    "aktivitas": aktivitas,
    "keterangan": keterangan,
  };
}
