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
