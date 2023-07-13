import 'dart:js_interop';

import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';

class MipokaUserModel extends MipokaUser {
  final List<OrmawaModel> ormawaModel;

  const MipokaUserModel({
    required super.idUser,
    required this.ormawaModel,
    required super.email,
    required super.namaLengkap,
    required super.nim,
    required super.noHp,
    required super.image,
    required super.pointMpt,
    required super.semester,
    required super.kelas,
    required super.periodeMpt,
    required super.statusMpt,
    required super.prodi,
    required super.createdAt,
    required super.updatedAt,
    required super.createdBy,
    required super.updatedBy,
  }) : super (ormawa: ormawaModel);

  factory MipokaUserModel.fromEntity(MipokaUser mipokaUser) {
    return MipokaUserModel(
      idUser: mipokaUser.idUser,
      ormawaModel: mipokaUser.ormawa.map((ormawa) =>
          OrmawaModel.fromEntity(ormawa)).toList(),
      email: mipokaUser.email,
      namaLengkap: mipokaUser.namaLengkap,
      nim: mipokaUser.nim,
      noHp: mipokaUser.noHp,
      image: mipokaUser.image,
      pointMpt: mipokaUser.pointMpt,
      semester: mipokaUser.semester,
      kelas: mipokaUser.kelas,
      periodeMpt: mipokaUser.periodeMpt,
      statusMpt: mipokaUser.statusMpt,
      prodi: mipokaUser.prodi,
      createdAt: mipokaUser.createdAt,
      updatedAt: mipokaUser.updatedAt,
      createdBy: mipokaUser.createdBy,
      updatedBy: mipokaUser.updatedBy,
    );
  }

  factory MipokaUserModel.fromJson(Map<String, dynamic> json) => MipokaUserModel(
    idUser: json["id_user"],
    ormawaModel: List<OrmawaModel>.from(json["ormawa"].map((x) => OrmawaModel.fromJson(x))),
    email: json["email"],
    namaLengkap: json["nama_lengkap"],
    nim: json["nim"],
    noHp: json["no_hp"],
    image: json["image"],
    pointMpt: json["point_mpt"],
    semester: json["semester"],
    kelas: json["kelas"],
    periodeMpt: json["periode_mpt"],
    statusMpt: json["status_mpt"],
    prodi: json["prodi"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "ormawa": List<dynamic>.from(ormawaModel.map((x) => x.toJson())),
    "email": email,
    "nama_lengkap": namaLengkap,
    "nim": nim,
    "no_hp": noHp,
    "image": image,
    "point_mpt": pointMpt,
    "semester": semester,
    "kelas": kelas,
    "periode_mpt": periodeMpt,
    "status_mpt": statusMpt,
    "prodi": prodi,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}