import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int idUser;
  final int idOrmawa;
  final int idOrmawaB;
  final String email;
  final String username;
  final String password;
  final String namaLengkap;
  final String nim;
  final String noHp;
  final String image;
  final int mpt;
  final String semester;
  final String kelas;
  final String periodeMpt;
  final String status;
  final String prodi;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.idUser,
    required this.idOrmawa,
    required this.idOrmawaB,
    required this.email,
    required this.username,
    required this.password,
    required this.namaLengkap,
    required this.nim,
    required this.noHp,
    required this.image,
    required this.mpt,
    required this.semester,
    required this.kelas,
    required this.periodeMpt,
    required this.status,
    required this.prodi,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    int? idUser,
    int? idOrmawa,
    int? idOrmawaB,
    String? email,
    String? username,
    String? password,
    String? namaLengkap,
    String? nim,
    String? noHp,
    String? image,
    int? mpt,
    String? semester,
    String? kelas,
    String? periodeMpt,
    String? status,
    String? prodi,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      idUser: idUser ?? this.idUser,
      idOrmawa: idOrmawa ?? this.idOrmawa,
      idOrmawaB: idOrmawaB ?? this.idOrmawaB,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      nim: nim ?? this.nim,
      noHp: noHp ?? this.noHp,
      image: image ?? this.image,
      mpt: mpt ?? this.mpt,
      semester: semester ?? this.semester,
      kelas: kelas ?? this.kelas,
      periodeMpt: periodeMpt ?? this.periodeMpt,
      status: status ?? this.status,
      prodi: prodi ?? this.prodi,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    idUser,
    idOrmawa,
    idOrmawaB,
    email,
    username,
    password,
    namaLengkap,
    nim,
    noHp,
    image,
    mpt,
    semester,
    kelas,
    periodeMpt,
    status,
    prodi,
    createdAt,
    updatedAt,
  ];
}
