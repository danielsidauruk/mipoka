import 'package:equatable/equatable.dart';

class Admin extends Equatable {
  final int idAdmin;
  final String email;
  final String namaLengkap;
  final String nip;
  final String image;
  final String noHp;
  final String role;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Admin({
    required this.idAdmin,
    required this.email,
    required this.namaLengkap,
    required this.nip,
    required this.image,
    required this.noHp,
    required this.role,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Admin copyWith({
    int? idAdmin,
    String? email,
    String? namaLengkap,
    String? nip,
    String? image,
    String? noHp,
    String? role,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Admin(
        idAdmin: idAdmin ?? this.idAdmin,
        email: email ?? this.email,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        nip: nip ?? this.nip,
        image: image ?? this.image,
        noHp: noHp ?? this.noHp,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idAdmin,
    email,
    namaLengkap,
    nip,
    image,
    noHp,
    role,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
