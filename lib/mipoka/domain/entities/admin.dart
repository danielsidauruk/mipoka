import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/admin_model.dart';

class Admin extends Equatable {
  final int idAdmin;
  final String nip;
  final String username;
  final String password;
  final String noHp;
  final String role;

  const Admin({
    required this.idAdmin,
    required this.nip,
    required this.username,
    required this.password,
    required this.noHp,
    required this.role,
  });

  Admin updateWith({
    int? idAdmin,
    String? nip,
    String? username,
    String? password,
    String? noHp,
    String? role,
  }) {
    return Admin(
      idAdmin: idAdmin ?? this.idAdmin,
      nip: nip ?? this.nip,
      username: username ?? this.username,
      password: password ?? this.password,
      noHp: noHp ?? this.noHp,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [
    idAdmin,
    nip,
    username,
    password,
    noHp,
    role,
  ];
}