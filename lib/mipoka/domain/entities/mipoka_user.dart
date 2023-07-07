import 'package:equatable/equatable.dart';

class MipokaUser extends Equatable{
  final String nim;
  final List<int> ormawa;
  final String email;
  final String namaLengkap;
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
    required this.nim,
    required this.ormawa,
    required this.email,
    required this.namaLengkap,
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
    String? nim,
    List<int>? ormawa,
    String? email,
    String? namaLengkap,
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
        nim: nim ?? this.nim,
        ormawa: ormawa ?? this.ormawa,
        email: email ?? this.email,
        namaLengkap: namaLengkap ?? this.namaLengkap,
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
    nim,
    ormawa,
    email,
    namaLengkap,
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
