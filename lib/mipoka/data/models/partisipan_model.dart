import 'package:mipoka/mipoka/domain/entities/partisipan.dart';

class PartisipanModel extends Partisipan {
  const PartisipanModel({
    required super.idPartisipan,
    required super.noInduk,
    required super.namaPartisipan,
    required super.nik,
    required super.tempatLahir,
    required super.tglLahir,
    required super.peranPartisipan,
    required super.dasarPengiriman,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory PartisipanModel.fromEntity(Partisipan entity) {
    return PartisipanModel(
      idPartisipan: entity.idPartisipan,
      noInduk: entity.noInduk,
      namaPartisipan: entity.namaPartisipan,
      nik: entity.nik,
      tempatLahir: entity.tempatLahir,
      tglLahir: entity.tglLahir,
      peranPartisipan: entity.peranPartisipan,
      dasarPengiriman: entity.dasarPengiriman,
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
      updatedAt: entity.updatedAt,
      updatedBy: entity.updatedBy,
    );
  }

  factory PartisipanModel.fromJson(Map<String, dynamic> json) => PartisipanModel(
    idPartisipan: json["id_partisipan"],
    noInduk: json["no_induk"],
    namaPartisipan: json["nama_partisipan"],
    nik: json["nik"],
    tempatLahir: json["tempat_lahir"],
    tglLahir: json["tgl_lahir"],
    peranPartisipan: json["peran_partisipan"],
    dasarPengiriman: json["dasar_pengiriman"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_partisipan": idPartisipan,
    "no_induk": noInduk,
    "nama_partisipan": namaPartisipan,
    "nik": nik,
    "tempat_lahir": tempatLahir,
    "tgl_lahir": tglLahir,
    "peran_partisipan": peranPartisipan,
    "dasar_pengiriman": dasarPengiriman,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
