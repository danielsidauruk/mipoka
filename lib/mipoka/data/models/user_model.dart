import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';

class UserModel extends User {
  final OrmawaModel? ormawaModel;

  const UserModel({
    required super.idUser,
    required super.idOrmawa,
    required super.idOrmawaB,
    required super.email,
    required super.username,
    required super.password,
    required super.namaLengkap,
    required super.nim,
    required super.noHp,
    required super.image,
    required super.mpt,
    required super.semester,
    required super.kelas,
    required super.periodeMpt,
    required super.status,
    required super.prodi,
    required super.createdAt,
    required super.updatedAt,
    this.ormawaModel
  }) : super(ormawa: ormawaModel);

  factory UserModel.fromEntity(User user) {
    return UserModel(
      idUser: user.idUser,
      idOrmawa: user.idOrmawa,
      idOrmawaB: user.idOrmawaB,
      email: user.email,
      username: user.username,
      password: user.password,
      namaLengkap: user.namaLengkap,
      nim: user.nim,
      noHp: user.noHp,
      image: user.image,
      mpt: user.mpt,
      semester: user.semester,
      kelas: user.kelas,
      periodeMpt: user.periodeMpt,
      status: user.status,
      prodi: user.prodi,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      ormawaModel: user.ormawa != null ? OrmawaModel.fromEntity(user.ormawa!) : null,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    idUser: json["idUser"],
    idOrmawa: json["idOrmawa"],
    idOrmawaB: json["idOrmawaB"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    namaLengkap: json["namaLengkap"],
    nim: json["nim"],
    noHp: json["noHp"],
    image: json["image"],
    mpt: json["mpt"],
    semester: json["semester"],
    kelas: json["kelas"],
    periodeMpt: json["periodeMpt"],
    status: json["status"],
    prodi: json["prodi"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    ormawaModel: json.containsKey("ormawa") ? OrmawaModel.fromJson(json["ormawa"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    "idOrmawa": idOrmawa,
    "idOrmawaB": idOrmawaB,
    "email": email,
    "username": username,
    "password": password,
    "namaLengkap": namaLengkap,
    "nim": nim,
    "noHp": noHp,
    "image": image,
    "mpt": mpt,
    "semester": semester,
    "kelas": kelas,
    "periodeMpt": periodeMpt,
    "status": status,
    "prodi": prodi,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "ormawa": ormawaModel?.toJson(),
  };
}
