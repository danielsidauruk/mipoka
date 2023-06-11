import 'package:mipoka/mipoka/domain/entities/admin.dart';

class AdminModel extends Admin {
  const AdminModel({
    required int idAdmin,
    required String nip,
    required String username,
    required String password,
    required String noHp,
    required String role,
  }) : super(
    idAdmin: idAdmin,
    nip: nip,
    username: username,
    password: password,
    noHp: noHp,
    role: role,
  );

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      idAdmin: json['id_admin'],
      nip: json['nip'],
      username: json['username'],
      password: json['password'],
      noHp: json['no_hp'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_admin': idAdmin,
      'nip': nip,
      'username': username,
      'password': password,
      'no_hp': noHp,
      'role': role,
    };
  }
}
