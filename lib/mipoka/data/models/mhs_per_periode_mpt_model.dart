import 'package:mipoka/mipoka/data/models/kegiatan_per_periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/periode_mpt_model.dart';
import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';

class MhsPerPeriodeMptModel extends MhsPerPeriodeMpt{
  final MipokaUserModel mipokaUserModel;
  final PeriodeMptModel periodeMptModel;
  final KegiatanPerPeriodeMptModel kegiatanPerPeriodeMptModel;

  const MhsPerPeriodeMptModel({
    required super.idMhsPerPeriodeMpt,
    required this.mipokaUserModel,
    required this.periodeMptModel,
    required this.kegiatanPerPeriodeMptModel,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  }) : super (
    mipokaUser: mipokaUserModel,
    periodeMpt: periodeMptModel,
    kegiatanPerPeriodeMpt: kegiatanPerPeriodeMptModel,
  );

  factory MhsPerPeriodeMptModel.fromEntity(MhsPerPeriodeMpt mhsPerPeriodeMpt) {
    return MhsPerPeriodeMptModel(
      idMhsPerPeriodeMpt: mhsPerPeriodeMpt.idMhsPerPeriodeMpt,
      mipokaUserModel: MipokaUserModel.fromEntity(mhsPerPeriodeMpt.mipokaUser),
      periodeMptModel: PeriodeMptModel.fromEntity(mhsPerPeriodeMpt.periodeMpt),
      kegiatanPerPeriodeMptModel: KegiatanPerPeriodeMptModel.fromEntity(mhsPerPeriodeMpt.kegiatanPerPeriodeMpt),
      createdAt: mhsPerPeriodeMpt.createdAt,
      createdBy: mhsPerPeriodeMpt.createdBy,
      updatedAt: mhsPerPeriodeMpt.updatedAt,
      updatedBy: mhsPerPeriodeMpt.updatedBy,
    );
  }

  factory MhsPerPeriodeMptModel.fromJson(Map<String, dynamic> json) => MhsPerPeriodeMptModel(
    idMhsPerPeriodeMpt: json["id_mhs_per_periode_mpt"],
    mipokaUserModel: MipokaUserModel.fromJson(json["user"]),
    periodeMptModel: PeriodeMptModel.fromJson(json["periode_mpt"]),
    kegiatanPerPeriodeMptModel: KegiatanPerPeriodeMptModel.fromJson(json["kegiatan_per_periode_mpt"]),
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_mhs_per_periode_mpt": idMhsPerPeriodeMpt,
    "user": mipokaUserModel.toJson(),
    "periode_mpt": periodeMptModel.toJson(),
    "kegiatan_per_periode_mpt": kegiatanPerPeriodeMptModel.toJson(),
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
