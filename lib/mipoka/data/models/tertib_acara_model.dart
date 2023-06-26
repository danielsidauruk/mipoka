import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';

class TertibAcaraModel extends TertibAcara {
  const TertibAcaraModel({
    required super.idTertibAcara,
    required super.usulan,
    required super.waktuMulai,
    required super.waktuSelesai,
    required super.aktivitas,
    required super.keterangan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory TertibAcaraModel.fromEntity(TertibAcara tertibAcara) {
    return TertibAcaraModel(
      idTertibAcara: tertibAcara.idTertibAcara,
      usulan: tertibAcara.usulan,
      waktuMulai: tertibAcara.waktuMulai,
      waktuSelesai: tertibAcara.waktuSelesai,
      aktivitas: tertibAcara.aktivitas,
      keterangan: tertibAcara.keterangan,
      createdAt: tertibAcara.createdAt,
      createdBy: tertibAcara.createdBy,
      updatedAt: tertibAcara.updatedAt,
      updatedBy: tertibAcara.updatedBy,
    );
  }

  factory TertibAcaraModel.fromJson(Map<String, dynamic> json) => TertibAcaraModel(
    idTertibAcara: json["id_tertib_acara"],
    usulan: json["usulan"],
    waktuMulai: json["waktu_mulai"],
    waktuSelesai: json["waktu_selesai"],
    aktivitas: json["aktivitas"],
    keterangan: json["keterangan"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_tertib_acara": idTertibAcara,
    "usulan": usulan,
    "waktu_mulai": waktuMulai,
    "waktu_selesai": waktuSelesai,
    "aktivitas": aktivitas,
    "keterangan": keterangan,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
