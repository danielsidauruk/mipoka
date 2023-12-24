import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';

class Prestasi extends Equatable {
  final int idPrestasi;
  final MipokaUser mipokaUser;
  final Ormawa ormawa;
  final String namaKegiatan;
  final String waktuPenyelenggaraan;
  final String tingkat;
  final String prestasiDicapai;
  final String unggahSertifikat;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Prestasi({
    required this.idPrestasi,
    required this.ormawa,
    required this.mipokaUser,
    required this.namaKegiatan,
    required this.waktuPenyelenggaraan,
    required this.tingkat,
    required this.prestasiDicapai,
    required this.unggahSertifikat,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Prestasi copyWith({
    int? idPrestasi,
    MipokaUser? mipokaUser,
    Ormawa? ormawa,
    String? namaKegiatan,
    String? waktuPenyelenggaraan,
    String? tingkat,
    String? prestasiDicapai,
    String? unggahSertifikat,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Prestasi(
        idPrestasi: idPrestasi ?? this.idPrestasi,
        mipokaUser: mipokaUser ?? this.mipokaUser,
        ormawa:ormawa ?? this.ormawa,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        waktuPenyelenggaraan: waktuPenyelenggaraan ?? this.waktuPenyelenggaraan,
        tingkat: tingkat ?? this.tingkat,
        prestasiDicapai: prestasiDicapai ?? this.prestasiDicapai,
        unggahSertifikat: unggahSertifikat ?? this.unggahSertifikat,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idPrestasi,
    mipokaUser,
    ormawa,
    namaKegiatan,
    waktuPenyelenggaraan,
    tingkat,
    prestasiDicapai,
    unggahSertifikat,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
