import 'package:equatable/equatable.dart';

class Prestasi extends Equatable {
  final int idPrestasi;
  final int idOrmawa;
  final String idUser;
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
    required this.idOrmawa,
    required this.idUser,
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
    int? idOrmawa,
    String? idUser,
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
        idOrmawa: idOrmawa ?? this.idOrmawa,
        idUser: idUser ?? this.idUser,
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
    idOrmawa,
    idUser,
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
