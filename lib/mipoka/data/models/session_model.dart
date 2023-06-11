import 'package:mipoka/mipoka/domain/entities/session.dart';

class SessionModel extends Session {
  const SessionModel({
    required int idSession,
    required int userId,
    required String ruangan,
    required String gedung,
    required String idOrmawa,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime date,
    required String kegiatan,
    required String perlengkapan,
    required String lain,
    required String status,
    required String keterangan,
    required DateTime updatedAt,
    required DateTime createdAt,
    required String updatedBy,
  }) : super(
    idSession: idSession,
    userId: userId,
    ruangan: ruangan,
    gedung: gedung,
    idOrmawa: idOrmawa,
    startTime: startTime,
    endTime: endTime,
    date: date,
    kegiatan: kegiatan,
    perlengkapan: perlengkapan,
    lain: lain,
    status: status,
    keterangan: keterangan,
    updatedAt: updatedAt,
    createdAt: createdAt,
    updatedBy: updatedBy,
  );

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      idSession: json['idSession'],
      userId: json['userId'],
      ruangan: json['ruangan'],
      gedung: json['gedung'],
      idOrmawa: json['idOrmawa'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      date: DateTime.parse(json['date']),
      kegiatan: json['kegiatan'],
      perlengkapan: json['perlengkapan'],
      lain: json['lain'],
      status: json['status'],
      keterangan: json['keterangan'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idSession': idSession,
      'userId': userId,
      'ruangan': ruangan,
      'gedung': gedung,
      'idOrmawa': idOrmawa,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'date': date.toIso8601String(),
      'kegiatan': kegiatan,
      'perlengkapan': perlengkapan,
      'lain': lain,
      'status': status,
      'keterangan': keterangan,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedBy': updatedBy,
    };
  }
}
