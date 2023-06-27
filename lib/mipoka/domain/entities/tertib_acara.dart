import 'package:equatable/equatable.dart';

class TertibAcara extends Equatable{
  final int idTertibAcara;
  final String waktuMulai;
  final String waktuSelesai;
  final String aktivitas;
  final String keterangan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const TertibAcara({
    required this.idTertibAcara,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.aktivitas,
    required this.keterangan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  TertibAcara copyWith({
    int? idTertibAcara,
    String? waktuMulai,
    String? waktuSelesai,
    String? aktivitas,
    String? keterangan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      TertibAcara(
        idTertibAcara: idTertibAcara ?? this.idTertibAcara,
        waktuMulai: waktuMulai ?? this.waktuMulai,
        waktuSelesai: waktuSelesai ?? this.waktuSelesai,
        aktivitas: aktivitas ?? this.aktivitas,
        keterangan: keterangan ?? this.keterangan,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idTertibAcara,
    waktuMulai,
    waktuSelesai,
    aktivitas,
    keterangan,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
