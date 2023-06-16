import 'package:mipoka/mipoka/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required int idUser,
    required int idOrmawa,
    required int idOrmawaB,
    required String email,
    required String username,
    required String password,
    required String namaLengkap,
    required String nim,
    required String noHp,
    required String image,
    required int mpt,
    required String semester,
    required String kelas,
    required String periodeMpt,
    required String status,
    required String prodi,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
    idUser: idUser,
    idOrmawa: idOrmawa,
    idOrmawaB: idOrmawaB,
    email: email,
    username: username,
    password: password,
    namaLengkap: namaLengkap,
    nim: nim,
    noHp: noHp,
    image: image,
    mpt: mpt,
    semester: semester,
    kelas: kelas,
    periodeMpt: periodeMpt,
    status: status,
    prodi: prodi,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

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
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['idUser'],
      idOrmawa: json['idOrmawa'],
      idOrmawaB: json['idOrmawaB'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      namaLengkap: json['namaLengkap'],
      nim: json['nim'],
      noHp: json['noHp'],
      image: json['image'],
      mpt: json['mpt'],
      semester: json['semester'],
      kelas: json['kelas'],
      periodeMpt: json['periodeMpt'],
      status: json['status'],
      prodi: json['prodi'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idOrmawa': idOrmawa,
      'idOrmawaB': idOrmawaB,
      'email': email,
      'username': username,
      'password': password,
      'namaLengkap': namaLengkap,
      'nim': nim,
      'noHp': noHp,
      'image': image,
      'mpt': mpt,
      'semester': semester,
      'kelas': kelas,
      'periodeMpt': periodeMpt,
      'status': status,
      'prodi': prodi,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
