import 'package:mipoka/mipoka/domain/entities/admin.dart';

class AdminModel extends Admin {
  const AdminModel({
    required super.idAdmin,
    required super.email,
    required super.namaLengkap,
    required super.nip,
    required super.image,
    required super.noHp,
    required super.role,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory AdminModel.fromEntity(Admin admin) {
    return AdminModel(
      idAdmin: admin.idAdmin,
      email: admin.email,
      namaLengkap: admin.namaLengkap,
      nip: admin.nip,
      image: admin.image,
      noHp: admin.noHp,
      role: admin.role,
      createdAt: admin.createdAt,
      createdBy: admin.createdBy,
      updatedAt: admin.updatedAt,
      updatedBy: admin.updatedBy,
    );
  }

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
    idAdmin: json["id_admin"],
    email: json["email"],
    namaLengkap: json["nama_lengkap"],
    nip: json["nip"],
    image: json["image"],
    noHp: json["no_hp"],
    role: json["role"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_admin": idAdmin,
    "email": email,
    "nama_lengkap": namaLengkap,
    "nip": nip,
    "image": image,
    "no_hp": noHp,
    "role": role,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
