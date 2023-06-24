import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';

// => Just Updated
class MipokaUserModel extends MipokaUser {
  final OrmawaModel ormawaModel;

  const MipokaUserModel({
    required super.idUser,
    required super.idOrmawa,
    required super.idOrmawaB,
    required super.email,
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
    required this.ormawaModel
  }) : super(ormawa: ormawaModel);

  factory MipokaUserModel.fromEntity(MipokaUser user) {
    return MipokaUserModel(
      idUser: user.idUser,
      idOrmawa: user.idOrmawa,
      idOrmawaB: user.idOrmawaB,
      email: user.email,
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
      ormawaModel: OrmawaModel.fromEntity(user.ormawa),
    );
  }

  factory MipokaUserModel.fromJson(Map<String, dynamic> json) => MipokaUserModel(
    idUser: json["idUser"],
    idOrmawa: json["idOrmawa"],
    idOrmawaB: json["idOrmawaB"],
    email: json["email"],
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
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    ormawaModel: OrmawaModel.fromJson(json["ormawa"]),
  );

  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    "idOrmawa": idOrmawa,
    "idOrmawaB": idOrmawaB,
    "email": email,
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "ormawa": ormawaModel?.toJson(),
  };
}
