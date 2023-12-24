import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';

class NotifikasiModel extends Notifikasi{
  const NotifikasiModel({
    required super.idNotifikasi,
    required super.teksNotifikasi,
    required super.tglNotifikasi,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory NotifikasiModel.fromEntity(Notifikasi notifikasi) {
    return NotifikasiModel(
      idNotifikasi: notifikasi.idNotifikasi,
      teksNotifikasi: notifikasi.teksNotifikasi,
      tglNotifikasi: notifikasi.tglNotifikasi,
      createdAt: notifikasi.createdAt,
      createdBy: notifikasi.createdBy,
      updatedAt: notifikasi.updatedAt,
      updatedBy: notifikasi.updatedBy,
    );
  }

  factory NotifikasiModel.fromJson(Map<String, dynamic> json) => NotifikasiModel(
    idNotifikasi: json["id_notifikasi"],
    teksNotifikasi: json["teks_notifikasi"],
    tglNotifikasi: json["tgl_notifikasi"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_notifikasi": idNotifikasi,
    "teks_notifikasi": teksNotifikasi,
    "tgl_notifikasi": tglNotifikasi,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}