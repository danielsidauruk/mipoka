import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';

class MhsPerPeriodeMptModel extends MhsPerPeriodeMpt{
  const MhsPerPeriodeMptModel({
    required super.idMhsPerPeriodeMpt,
    required super.idUser,
    required super.idPeriodeMpt,
    required super.idKegiatanPerPeriodeMpt,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory MhsPerPeriodeMptModel.fromEntity(MhsPerPeriodeMpt mhsPerPeriodeMpt) {
    return MhsPerPeriodeMptModel(
      idMhsPerPeriodeMpt: mhsPerPeriodeMpt.idMhsPerPeriodeMpt,
      idUser: mhsPerPeriodeMpt.idUser,
      idPeriodeMpt: mhsPerPeriodeMpt.idPeriodeMpt,
      idKegiatanPerPeriodeMpt: mhsPerPeriodeMpt.idKegiatanPerPeriodeMpt,
      createdAt: mhsPerPeriodeMpt.createdAt,
      createdBy: mhsPerPeriodeMpt.createdBy,
      updatedAt: mhsPerPeriodeMpt.updatedAt,
      updatedBy: mhsPerPeriodeMpt.updatedBy,
    );
  }

  factory MhsPerPeriodeMptModel.fromJson(Map<String, dynamic> json) => MhsPerPeriodeMptModel(
    idMhsPerPeriodeMpt: json["id_mhs_per_periode_mpt"],
    idUser: json["id_user"],
    idPeriodeMpt: json["id_periode_mpt"],
    idKegiatanPerPeriodeMpt: json["id_kegiatan_per_periode_mpt"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_mhs_per_periode_mpt": idMhsPerPeriodeMpt,
    "id_user": idUser,
    "id_periode_mpt": idPeriodeMpt,
    "id_kegiatan_per_periode_mpt": idKegiatanPerPeriodeMpt,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
