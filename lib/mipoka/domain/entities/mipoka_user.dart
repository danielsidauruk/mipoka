import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';

class MipokaUser extends Equatable{
  final String idUser;
  final List<Ormawa> ormawa;
  final String email;
  final String namaLengkap;
  final String nim;
  final String noHp;
  final String? image;
  final int pointMpt;
  final int semester;
  final String kelas;
  final String? periodeMpt;
  final String statusMpt;
  final String prodi;
  // final String role;
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;

  const MipokaUser({
    required this.idUser,
    required this.ormawa,
    required this.email,
    required this.namaLengkap,
    required this.nim,
    required this.noHp,
    required this.image,
    required this.pointMpt,
    required this.semester,
    required this.kelas,
    required this.periodeMpt,
    required this.statusMpt,
    required this.prodi,
    // required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  MipokaUser copyWith({
    String? idUser,
    List<Ormawa>? ormawa,
    String? email,
    String? namaLengkap,
    String? nim,
    String? noHp,
    String? image,
    int? pointMpt,
    int? semester,
    String? kelas,
    String? periodeMpt,
    String? statusMpt,
    String? prodi,
    // String? role,
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
  }) =>
      MipokaUser(
        idUser: idUser ?? this.idUser,
        ormawa: ormawa ?? this.ormawa,
        email: email ?? this.email,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        nim: nim ?? this.nim,
        noHp: noHp ?? this.noHp,
        image: image ?? this.image,
        pointMpt: pointMpt ?? this.pointMpt,
        semester: semester ?? this.semester,
        kelas: kelas ?? this.kelas,
        periodeMpt: periodeMpt ?? this.periodeMpt,
        statusMpt: statusMpt ?? this.statusMpt,
        prodi: prodi ?? this.prodi,
        // role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idUser,
    ormawa,
    email,
    namaLengkap,
    nim,
    noHp,
    image,
    pointMpt,
    semester,
    kelas,
    periodeMpt,
    statusMpt,
    prodi,
    // role,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy,
  ];
}