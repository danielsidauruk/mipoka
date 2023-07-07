import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';

class MipokaUserModel extends MipokaUser {
  const MipokaUserModel({
    required super.nim,
    required super.ormawa,
    required super.email,
    required super.namaLengkap,
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

  factory MipokaUserModel.fromEntity(MipokaUser mipokaUser) {
    return MipokaUserModel(
      nim: mipokaUser.nim,
      ormawa: mipokaUser.ormawa,
      email: mipokaUser.email,
      namaLengkap: mipokaUser.namaLengkap,
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
    nim: json["nim"],
    ormawa: List<int>.from(json["id_ormawa"].map((x) => x)),
    email: json["email"],
    namaLengkap: json["nama_lengkap"],
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
    "nim": nim,
    "id_ormawa": List<dynamic>.from(ormawa.map((x) => x)),
    "email": email,
    "nama_lengkap": namaLengkap,
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
