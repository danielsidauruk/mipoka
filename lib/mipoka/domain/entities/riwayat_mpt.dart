import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';

// => Just Updated
class RiwayatMpt extends Equatable {
  final int idRiwayatMpt;
  final Kegiatan kegiatan;
  final MipokaUser user;
  final String status;
  final String file;
  final String hash;
  final String keteranganA;
  final String keteranganB;
  final DateTime mulai;
  final DateTime akhir;
  final DateTime updatedAt;
  final DateTime createdAt;

  const RiwayatMpt({
    required this.idRiwayatMpt,
    required this.kegiatan,
    required this.user,
    required this.status,
    required this.file,
    required this.hash,
    required this.keteranganA,
    required this.keteranganB,
    required this.mulai,
    required this.akhir,
    required this.updatedAt,
    required this.createdAt,
  });

  RiwayatMpt copyWith({
    int? idRiwayatMpt,
    Kegiatan? kegiatan,
    MipokaUser? user,
    String? status,
    String? file,
    String? hash,
    String? keteranganA,
    String? keteranganB,
    DateTime? mulai,
    DateTime? akhir,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) =>
      RiwayatMpt(
        idRiwayatMpt: idRiwayatMpt ?? this.idRiwayatMpt,
        kegiatan: kegiatan ?? this.kegiatan,
        user: user ?? this.user,
        status: status ?? this.status,
        file: file ?? this.file,
        hash: hash ?? this.hash,
        keteranganA: keteranganA ?? this.keteranganA,
        keteranganB: keteranganB ?? this.keteranganB,
        mulai: mulai ?? this.mulai,
        akhir: akhir ?? this.akhir,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [
    idRiwayatMpt,
    kegiatan,
    user,
    status,
    file,
    hash,
    keteranganA,
    keteranganB,
    mulai,
    akhir,
    updatedAt,
    createdAt,
  ];
}
