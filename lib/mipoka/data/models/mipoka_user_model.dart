import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';

class MipokaUserModel extends MipokaUser {
  const MipokaUserModel({
    required super.idUser,
    required super.idOrmawa,
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
  });

  factory MipokaUserModel.fromEntity(MipokaUser entity) {
    return MipokaUserModel(
      idUser: entity.idUser,
      idOrmawa: entity.idOrmawa,
      email: entity.email,
      namaLengkap: entity.namaLengkap,
      nim: entity.nim,
      noHp: entity.noHp,
      image: entity.image,
      pointMpt: entity.pointMpt,
      semester: entity.semester,
      kelas: entity.kelas,
      periodeMpt: entity.periodeMpt,
      statusMpt: entity.statusMpt,
      prodi: entity.prodi,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      createdBy: entity.createdBy,
      updatedBy: entity.updatedBy,
    );
  }

  factory MipokaUserModel.fromJson(Map<String, dynamic> json) => MipokaUserModel(
    idUser: json["id_user"],
    idOrmawa: List<int>.from(json["id_ormawa"].map((x) => x)),
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
    "id_ormawa": List<dynamic>.from(idOrmawa.map((x) => x)),
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
