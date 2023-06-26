import 'package:equatable/equatable.dart';

class MipokaUser extends Equatable{
  final int idUser;
  final List<int> idOrmawa;
  final String email;
  final String namaLengkap;
  final String nim;
  final String noHp;
  final String image;
  final int pointMpt;
  final int semester;
  final String kelas;
  final String periodeMpt;
  final String statusMpt;
  final String prodi;
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;

  const MipokaUser({
    required this.idUser,
    required this.idOrmawa,
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
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  MipokaUser copyWith({
    int? idUser,
    List<int>? idOrmawa,
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
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
  }) =>
      MipokaUser(
        idUser: idUser ?? this.idUser,
        idOrmawa: idOrmawa ?? this.idOrmawa,
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
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idOrmawa,
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
    createdAt,
    updatedAt,
    createdBy,
    updatedBy,
  ];
}
