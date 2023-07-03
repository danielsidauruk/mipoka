import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mipoka/mipoka/data/models/admin_model.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/data/models/jenis_kegaitan_mpt.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_per_periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/laporan_model.dart';
import 'package:mipoka/mipoka/data/models/mhs_per_periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/nama_kegiatan_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/notifikasi_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/periode_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/peserta_kegiatan_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/prestasi_model.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/revisi_usulan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/riwayat_kegiatan_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/session_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';

abstract class MipokaDataSources {
  Future<List<BeritaModel>> readAllBerita(String filter);
  Future<BeritaModel> readBerita(int idBerita);
  Future<void> createBerita(BeritaModel beritaModel);
  Future<void> updateBerita(BeritaModel beritaModel);
  Future<void> deleteBerita(int beritaId);

  Future<AdminModel> readAdmin(int idAdmin);
  Future<void> createAdmin(AdminModel adminModel);
  Future<void> updateAdmin(AdminModel adminModel);
  Future<void> deleteAdmin(int adminId);

  Future<void> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatanModel biayaKegiatanModel,
  });
  Future<void> updateBiayaKegiatan(BiayaKegiatanModel biayaKegiatanModel);
  Future<void> deleteBiayaKegiatan(int idNamaBiayaKegiatan);

  Future<List<JenisKegiatanMptModel>> readAllJenisKegiatanMpt(String filter);
  Future<JenisKegiatanMptModel> readJenisKegiatanMpt(int idJenisKegiatanMpt);
  Future<void> createJenisKegiatanMpt(JenisKegiatanMptModel jenisKegiatanMptModel);
  Future<void> updateJenisKegiatanMpt(JenisKegiatanMptModel jenisKegiatanMptModel);
  Future<void> deleteJenisKegiatanMpt(int idJenisKegiatanMpt);

  Future<List<KegiatanPerPeriodeMptModel>> readAllKegiatanPerPeriodeMpt(String filter);
  Future<KegiatanPerPeriodeMptModel> readKegiatanPerPeriodeMpt(int idKegiatanMpt);
  Future<void> createKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel);
  Future<void> updateKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel);
  Future<void> deleteKegiatanPerPeriodeMpt(int idKegiatanMpt);

  Future<List<LaporanModel>> readAllLaporan(String filter);
  Future<LaporanModel> readLaporan(int idLaporan);
  Future<void> createLaporan(LaporanModel laporanModel);
  Future<void> updateLaporan(LaporanModel laporanModel);
  Future<void> deleteLaporan(int idLaporan);

  Future<List<OrmawaModel>> readAllOrmawa();
  Future<OrmawaModel> readOrmawa(int idOrmawa);
  Future<void> createOrmawa(OrmawaModel ormawaModel);
  Future<void> updateOrmawa(OrmawaModel ormawaModel);
  Future<void> deleteOrmawa(int idOrmawa);

  Future<void> createPartisipan({
    required int idUsulanKegiatan,
    required PartisipanModel partisipanModel,
  });
  Future<void> updatePartisipan(PartisipanModel partisipanModel);
  Future<void> deletePartisipan(int idPartisipan);

  Future<List<PeriodeMptModel>> readAllPeriodeMpt();
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriodeMpt);
  Future<void> createPeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<void> updatePeriodeMpt(PeriodeMptModel periodeMptModel);
  Future<void> deletePeriodeMpt(int idPeriode);

  Future<void> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel,
  });
  Future<void> updatePesertaKegiatanLaporan(PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel);
  Future<void> deletePesertaKegiatanLaporan(int idPeserta);

  Future<List<PrestasiModel>> readAllPrestasi();
  Future<PrestasiModel> readPrestasi(int idPrestasi);
  Future<void> createPrestasi(PrestasiModel prestasiModel);
  Future<void> updatePrestasi(PrestasiModel prestasiModel);
  Future<void> deletePrestasi(int idPrestasi);

  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan);
  Future<void> createRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> updateRevisiLaporan(RevisiLaporanModel revisiLaporanModel);
  Future<void> deleteRevisiLaporan(int idRevisiLaporan);

  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan);
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel);
  Future<void> deleteRevisiUsulan(int idRevisiUsulan);

  Future<void> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatanModel rincianBiayaKegiatanModel,
  });
  Future<void> updateRincianBiayaKegiatan(RincianBiayaKegiatanModel rincianBiayaKegiatanModel);
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan);

  Future<List<RiwayatMptModel>> readAllRiwayatMpt();
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt);
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel);
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptMode);
  Future<void> deleteRiwayatMpt(int idRiwayatMpt);

  Future<List<SessionModel>> readAllSession(String filter);
  Future<SessionModel> readSession(int idSession);
  Future<void> createSession(SessionModel sessionModel);
  Future<void> updateSession(SessionModel sessionModel);
  Future<void> deleteSession(int idSession);

  Future<void> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcaraModel tertibAcaraModel,
  });
  Future<void> updateTertibAcara(TertibAcaraModel tertibAcaraModel);
  Future<void> deleteTertibAcara(int idTertibAcara);

  Future<List<MipokaUserModel>> readAllMipokaUser();
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser);
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel);
  Future<void> deleteMipokaUser(String idMipokaUser);

  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan(String filter);
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan);
  Future<void> createUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> updateUsulanKegiatan(UsulanKegiatanModel usulanKegiatanModel);
  Future<void> deleteUsulanKegiatan(int idUsulan);

  Future<List<MhsPerPeriodeMptModel>> readAllMhsPerPeriodeMpt(String filter);
  Future<MhsPerPeriodeMptModel> readMhsPerPeriodeMpt(int idMhsPerPeriodeMpt);
  Future<void> createMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel);
  Future<void> updateMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel);
  Future<void> deleteMhsPerPeriodeMpt(int idMhsPerPeriodeMpt);

  Future<List<NamaKegiatanMptModel>> readAllNamaKegiatanMpt(String filter);
  Future<NamaKegiatanMptModel> readNamaKegiatanMpt(int idNamaKegiatanMpt);
  Future<void> createNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel);
  Future<void> updateNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel);
  Future<void> deleteNamaKegiatanMpt(int idNamaKegiatanMpt);

  Future<List<NotifikasiModel>> readAllNotifikasi(String filter);
  Future<NotifikasiModel> readNotifikasi(int idNotifikasi);
  Future<void> createNotifikasi(NotifikasiModel notifikasiModel);
  Future<void> updateNotifikasi(NotifikasiModel notifikasiModel);
  Future<void> deleteNotifikasi(int idNotifikasi);
}

class MipokaDataSourcesImpl implements MipokaDataSources {
  MipokaDataSourcesImpl({required this.client});

  final http.Client client;

  @override
  Future<void> createBerita(BeritaModel beritaModel) async {
    if (kDebugMode) {
      print(beritaModel.toJson());
    }
  }

  @override
  Future<void> deleteBerita(int idBerita) async {
    if (kDebugMode) {
      print("Berita with id $idBerita has been deleted.");
    }
  }

  @override
  Future<List<BeritaModel>> readAllBerita(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/berita_list.json');
    List<dynamic> resultList = json.decode(response);

    List<BeritaModel> result =
    resultList.map((resultMap) => BeritaModel.fromJson(resultMap)).toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<BeritaModel> readBerita(int idBerita) async {
    final String response =
    await rootBundle.loadString('assets/json_file/berita.json');
    dynamic jsonDecode = json.decode(response);

    BeritaModel result = BeritaModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateBerita(BeritaModel beritaModel) async {
    if (kDebugMode) {
      print(beritaModel.toJson());
    }
  }


  /* => Admin DataSources */
  @override
  Future<void> createAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }
  }

  @override
  Future<void> deleteAdmin(int idAdmin) async {
    if (kDebugMode) {
      print("Admin with id $idAdmin has been deleted.");
    }
  }

  @override
  Future<AdminModel> readAdmin(int idAdmin) async {
    final String response =
    await rootBundle.loadString('assets/json_file/admin.json');
    dynamic jsonDecode = json.decode(response);

    AdminModel result = AdminModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateAdmin(AdminModel adminModel) async {
    if (kDebugMode) {
      print(adminModel.toJson());
    }
  }


  /* => BiayaKegiatan DataSources */
  @override
  Future<void> createBiayaKegiatan({
    required int idUsulanKegiatan,
    required BiayaKegiatanModel biayaKegiatanModel,
  }) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteBiayaKegiatan(int idBiayaKegiatan) async {
    if (kDebugMode) {
      print("BiayaKegiatan with id $idBiayaKegiatan has been deleted.");
    }
  }

  @override
  Future<void> updateBiayaKegiatan(
      BiayaKegiatanModel biayaKegiatanModel) async {
    if (kDebugMode) {
      print(biayaKegiatanModel.toJson());
    }
  }


  // => * JenisKegiatanMPT DataSources
  @override
  Future<void> createJenisKegiatanMpt(
      JenisKegiatanMptModel jenisKegiatanMptModel) async {
    if (kDebugMode) {
      print(jenisKegiatanMptModel.toJson());
    }
  }

  @override
  Future<void> deleteJenisKegiatanMpt(int idJenisKegiatanMpt) async {
    if (kDebugMode) {
      print("JenisKegiatanMpt with id $idJenisKegiatanMpt has been deleted.");
    }
  }

  @override
  Future<List<JenisKegiatanMptModel>> readAllJenisKegiatanMpt(
      String filter) async {
    final String response =
    await rootBundle.loadString(
        'assets/json_file/jenis_kegiatan_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<JenisKegiatanMptModel> result =
    resultList.map((resultMap) => JenisKegiatanMptModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<JenisKegiatanMptModel> readJenisKegiatanMpt(
      int idJenisKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/jenis_kegiatan_mpt.json');
    dynamic jsonDecode = json.decode(response);

    JenisKegiatanMptModel result = JenisKegiatanMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateJenisKegiatanMpt(
      JenisKegiatanMptModel jenisKegiatanMptModel) async {
    if (kDebugMode) {
      print(jenisKegiatanMptModel);
    }
  }


  // => * KegiatanMPT DataSources
  @override
  Future<void> createKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel) async {
    if (kDebugMode) {
      print(kegiatanMptModel.toJson());
    }
  }

  @override
  Future<void> deleteKegiatanPerPeriodeMpt(int idKegiatanMpt) async {
    if (kDebugMode) {
      print("KegiatanMpt with id $idKegiatanMpt has been deleted.");
    }
  }

  @override
  Future<List<KegiatanPerPeriodeMptModel>> readAllKegiatanPerPeriodeMpt(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/kegiatan_per_periode_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<KegiatanPerPeriodeMptModel> result =
    resultList.map((resultMap) => KegiatanPerPeriodeMptModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<KegiatanPerPeriodeMptModel> readKegiatanPerPeriodeMpt(int idKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/kegiatan_per_periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    KegiatanPerPeriodeMptModel result = KegiatanPerPeriodeMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateKegiatanPerPeriodeMpt(KegiatanPerPeriodeMptModel kegiatanMptModel) async {
    if (kDebugMode) {
      print(kegiatanMptModel.toJson());
    }
  }


  /* => Berita DataSources */
  @override
  Future<void> createLaporan(LaporanModel laporanModel) async {
    if (kDebugMode) {
      print(laporanModel.toJson());
    }
  }

  @override
  Future<void> deleteLaporan(int idLaporan) async {
    if (kDebugMode) {
      print("Laporan with id $idLaporan has been deleted.");
    }
  }

  @override
  Future<List<LaporanModel>> readAllLaporan(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/laporan_list.json');
    List<dynamic> resultList = json.decode(response);

    List<LaporanModel> result =
    resultList.map((resultMap) => LaporanModel.fromJson(resultMap)).toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<LaporanModel> readLaporan(int idLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/laporan.json');
    dynamic jsonDecode = json.decode(response);

    LaporanModel result = LaporanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateLaporan(LaporanModel laporanModel) async {
    if (kDebugMode) {
      print(laporanModel.toJson());
    }
  }


  //* => Ormawa DataSources */
  @override
  Future<void> createOrmawa(OrmawaModel ormawaModel) async {
    if (kDebugMode) {
      print(ormawaModel.toJson());
    }
  }

  @override
  Future<void> deleteOrmawa(int idOrmawa) async {
    if (kDebugMode) {
      print("Ormawa with id $idOrmawa has been deleted.");
    }
  }

  @override
  Future<List<OrmawaModel>> readAllOrmawa() async {
    final String response =
    await rootBundle.loadString('assets/json_file/ormawa_list.json');
    List<dynamic> resultList = json.decode(response);

    List<OrmawaModel> result =
    resultList.map((resultMap) => OrmawaModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<OrmawaModel> readOrmawa(int idOrmawa) async {
    final String response =
    await rootBundle.loadString('assets/json_file/ormawa.json');
    dynamic jsonDecode = json.decode(response);

    OrmawaModel result = OrmawaModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateOrmawa(OrmawaModel ormawaModel) async {
    if (kDebugMode) {
      print(ormawaModel.toJson());
    }
  }


  /* => Partisipan DataSources */
  @override
  Future<void> createPartisipan({
    required int idUsulanKegiatan,
    required PartisipanModel partisipanModel
  }) async {
    if (kDebugMode) {
      print(partisipanModel.toJson());
    }
  }

  @override
  Future<void> deletePartisipan(int idPartisipan) async {
    if (kDebugMode) {
      print("Partisipan with id $idPartisipan has been deleted.");
    }
  }

  @override
  Future<void> updatePartisipan(PartisipanModel partisipanModel) async {
    if (kDebugMode) {
      print(partisipanModel);
    }
  }


  /* PeriodeMpt DataSources */
  @override
  Future<void> createPeriodeMpt(PeriodeMptModel periodeMptModel) async {
    if (kDebugMode) {
      print(periodeMptModel.toJson());
    }
  }

  @override
  Future<void> deletePeriodeMpt(int idPeriode) async {
    if (kDebugMode) {
      print("Periode with id $idPeriode has been deleted.");
    }
  }

  @override
  Future<List<PeriodeMptModel>> readAllPeriodeMpt() async {
    final String response =
    await rootBundle.loadString('assets/json_file/periode_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<PeriodeMptModel> result =
    resultList.map((resultMap) => PeriodeMptModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<PeriodeMptModel> readPeriodeMpt(int idPeriodeMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    PeriodeMptModel result = PeriodeMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updatePeriodeMpt(PeriodeMptModel periodeMptModel) async {
    if (kDebugMode) {
      print(periodeMptModel.toJson());
    }
  }


  /* => PesertaKegiatanLaporan */
  @override
  Future<void> createPesertaKegiatanLaporan({
    required int idLaporan,
    required PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel
  }) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }
  }

  @override
  Future<void> deletePesertaKegiatanLaporan(int idPeserta) async {
    if (kDebugMode) {
      print("Peserta with id $idPeserta has been deleted.");
    }
  }

  @override
  Future<void> updatePesertaKegiatanLaporan(
      PesertaKegiatanLaporanModel pesertaKegiatanLaporanModel) async {
    if (kDebugMode) {
      print(pesertaKegiatanLaporanModel.toJson());
    }
  }


  /* Prestasi DataSources */
  @override
  Future<void> createPrestasi(PrestasiModel prestasiModel) async {
    if (kDebugMode) {
      print(prestasiModel.toJson());
    }
  }

  @override
  Future<void> deletePrestasi(int idPrestasi) async {
    if (kDebugMode) {
      print("Prestasi with id $idPrestasi has been deleted.");
    }
  }

  @override
  Future<List<PrestasiModel>> readAllPrestasi() async {
    final String response =
    await rootBundle.loadString('assets/json_file/prestasi_list.json');
    List<dynamic> resultList = json.decode(response);

    List<PrestasiModel> result =
    resultList.map((resultMap) => PrestasiModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<PrestasiModel> readPrestasi(int idPrestasi) async {
    final String response =
    await rootBundle.loadString('assets/json_file/prestasi.json');
    dynamic jsonDecode = json.decode(response);

    PrestasiModel result = PrestasiModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updatePrestasi(PrestasiModel prestasiModel) async {
    if (kDebugMode) {
      print(prestasiModel.toJson());
    }
  }


  /* => RevisiLaporan DataSources */
  @override
  Future<void> createRevisiLaporan(
      RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }

  @override
  Future<void> deleteRevisiLaporan(int idRevisiLaporan) async {
    if (kDebugMode) {
      print("RevisiLaporan with id $idRevisiLaporan has been deleted.");
    }
  }

  @override
  Future<RevisiLaporanModel> readRevisiLaporan(int idRevisiLaporan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_laporan.json');
    dynamic jsonDecode = json.decode(response);

    RevisiLaporanModel result = RevisiLaporanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateRevisiLaporan(
      RevisiLaporanModel revisiLaporanModel) async {
    if (kDebugMode) {
      print(revisiLaporanModel.toJson());
    }
  }


  /* => RevisiUsulan DataSources */
  @override
  Future<void> createRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }

  @override
  Future<void> deleteRevisiUsulan(int idRevisiUsulan) async {
    if (kDebugMode) {
      print("RevisiUsulan with id $idRevisiUsulan has been deleted.");
    }
  }

  @override
  Future<RevisiUsulanModel> readRevisiUsulan(int idRevisiUsulan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/revisi_usulan.json');
    dynamic jsonDecode = json.decode(response);

    RevisiUsulanModel result = RevisiUsulanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateRevisiUsulan(RevisiUsulanModel revisiUsulanModel) async {
    if (kDebugMode) {
      print(revisiUsulanModel.toJson());
    }
  }


  /* => RincianBiayaKegiatan DataSources */
  @override
  Future<void> createRincianBiayaKegiatan({
    required int idLaporan,
    required RincianBiayaKegiatanModel rincianBiayaKegiatanModel
  }) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteRincianBiayaKegiatan(int idRincianBiayaKegiatan) async {
    if (kDebugMode) {
      print(
          "RincianBiayaKegiatan with id $idRincianBiayaKegiatan has been deleted.");
    }
  }

  @override
  Future<void> updateRincianBiayaKegiatan(
      RincianBiayaKegiatanModel rincianBiayaKegiatanModel) async {
    if (kDebugMode) {
      print(rincianBiayaKegiatanModel.toJson());
    }
  }


  /* => RiwayatMpt */
  @override
  Future<void> createRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    if (kDebugMode) {
      print(riwayatMptModel.toJson());
    }
  }

  @override
  Future<void> deleteRiwayatMpt(int idRiwayatMpt) async {
    if (kDebugMode) {
      print("RiwayatMpt with id $idRiwayatMpt has been deleted.");
    }
  }

  @override
  Future<List<RiwayatMptModel>> readAllRiwayatMpt() async {
    final String response =
    await rootBundle.loadString('assets/json_file/riwayat_kegiatan_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<RiwayatMptModel> result =
    resultList.map((resultMap) => RiwayatMptModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<RiwayatMptModel> readRiwayatMpt(int idRiwayatMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/riwayat_kegiatan_mpt.json');
    dynamic jsonDecode = json.decode(response);

    RiwayatMptModel result = RiwayatMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateRiwayatMpt(RiwayatMptModel riwayatMptModel) async {
    if (kDebugMode) {
      print(riwayatMptModel.toJson());
    }
  }


  /* => Session DataSources */
  @override
  Future<void> createSession(SessionModel sessionModel) async {
    if (kDebugMode) {
      print(sessionModel.toJson());
    }
  }

  @override
  Future<void> deleteSession(int idSession) async {
    if (kDebugMode) {
      print("Session with id $idSession has been deleted.");
    }
  }

  @override
  Future<List<SessionModel>> readAllSession(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/session_list.json');
    List<dynamic> resultList = json.decode(response);

    List<SessionModel> result =
    resultList.map((resultMap) => SessionModel.fromJson(resultMap)).toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<SessionModel> readSession(int idSession) async {
    final String response =
    await rootBundle.loadString('assets/json_file/session.json');
    dynamic jsonDecode = json.decode(response);

    SessionModel result = SessionModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateSession(SessionModel sessionModel) async {
    if (kDebugMode) {
      print(sessionModel.toJson());
    }
  }


  /* => TertibAcara */
  @override
  Future<void> createTertibAcara({
    required int idUsulanKegiatan,
    required TertibAcaraModel tertibAcaraModel
  }) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }
  }

  @override
  Future<void> deleteTertibAcara(int idTertibAcara) async {
    if (kDebugMode) {
      print("TertibAcara with id $idTertibAcara has been deleted.");
    }
  }

  @override
  Future<void> updateTertibAcara(TertibAcaraModel tertibAcaraModel) async {
    if (kDebugMode) {
      print(tertibAcaraModel.toJson());
    }
  }


  /* => MipokaUser DataSources */
  @override
  Future<void> createMipokaUser(MipokaUserModel mipokaUserModel) async {
    if (kDebugMode) {
      print(mipokaUserModel.toJson());
    }
  }

  @override
  Future<void> deleteMipokaUser(String idMipokaUser) async {
    if (kDebugMode) {
      print("MipokaUser with id $idMipokaUser has been deleted.");
    }
  }

  @override
  Future<List<MipokaUserModel>> readAllMipokaUser() async {
    final String response =
    await rootBundle.loadString('assets/json_file/mipoka_user_list.json');
    List<dynamic> resultList = json.decode(response);

    List<MipokaUserModel> result =
    resultList.map((resultMap) => MipokaUserModel.fromJson(resultMap)).toList();

    return result;
  }

  @override
  Future<MipokaUserModel> readMipokaUser(String idMipokaUser) async {
    final String response =
    await rootBundle.loadString('assets/json_file/mipoka_user.json');
    dynamic jsonDecode = json.decode(response);

    MipokaUserModel result = MipokaUserModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateMipokaUser(MipokaUserModel mipokaUserModel) async {
    if (kDebugMode) {
      print(mipokaUserModel.toJson());
    }
  }

  @override
  Future<void> createUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    if (kDebugMode) {
      print(usulanKegiatanModel.toJson());
    }
  }

  @override
  Future<void> deleteUsulanKegiatan(int idUsulan) async {
    if (kDebugMode) {
      print("UsulanKegiatan with id $idUsulan has been deleted.");
    }
  }

  @override
  Future<List<UsulanKegiatanModel>> readAllUsulanKegiatan(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/usulan_kegiatan_list.json');
    List<dynamic> resultList = json.decode(response);

    List<UsulanKegiatanModel> result =
    resultList.map((resultMap) => UsulanKegiatanModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<UsulanKegiatanModel> readUsulanKegiatan(int idUsulanKegiatan) async {
    final String response =
    await rootBundle.loadString('assets/json_file/usulan_kegiatan.json');
    dynamic jsonDecode = json.decode(response);

    UsulanKegiatanModel result = UsulanKegiatanModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateUsulanKegiatan(
      UsulanKegiatanModel usulanKegiatanModel) async {
    if (kDebugMode) {
      print(usulanKegiatanModel.toJson());
    }
  }


  // * => MhsPerPeriodeMpt DataSources
  @override
  Future<void> createMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel) async {
    if (kDebugMode) {
      print(mhsPerPeriodeMptModel.toJson());
    }
  }

  @override
  Future<void> deleteMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    if (kDebugMode) {
      print("MhsPerPeriodeMpt with id $idMhsPerPeriodeMpt has been deleted.");
    }
  }

  @override
  Future<List<MhsPerPeriodeMptModel>> readAllMhsPerPeriodeMpt(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/mhs_per_periode_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<MhsPerPeriodeMptModel> result =
    resultList.map((resultMap) => MhsPerPeriodeMptModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<MhsPerPeriodeMptModel> readMhsPerPeriodeMpt(int idMhsPerPeriodeMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/mhs_per_periode_mpt.json');
    dynamic jsonDecode = json.decode(response);

    MhsPerPeriodeMptModel result = MhsPerPeriodeMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateMhsPerPeriodeMpt(MhsPerPeriodeMptModel mhsPerPeriodeMptModel) async {
    if (kDebugMode) {
      print(mhsPerPeriodeMptModel.toJson());
    }
  }


  // * => NamaKegiatanMpt DataSources
  @override
  Future<void> createNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel) async {
    if (kDebugMode) {
      print(namaKegiatanMptModel.toJson());
    }
  }

  @override
  Future<void> deleteNamaKegiatanMpt(int idNamaKegiatanMpt) async {
    if (kDebugMode) {
      print("NamaKegiatanMpt with id $idNamaKegiatanMpt has been deleted.");
    }
  }

  @override
  Future<List<NamaKegiatanMptModel>> readAllNamaKegiatanMpt(String filter) async {
    final String response =
    await rootBundle.loadString('assets/json_file/nama_kegiatan_mpt_list.json');
    List<dynamic> resultList = json.decode(response);

    List<NamaKegiatanMptModel> result =
    resultList.map((resultMap) => NamaKegiatanMptModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<NamaKegiatanMptModel> readNamaKegiatanMpt(int idNamaKegiatanMpt) async {
    final String response =
    await rootBundle.loadString('assets/json_file/nama_kegiatan_mpt.json');
    dynamic jsonDecode = json.decode(response);

    NamaKegiatanMptModel result = NamaKegiatanMptModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateNamaKegiatanMpt(NamaKegiatanMptModel namaKegiatanMptModel) async {
    if (kDebugMode) {
      print(namaKegiatanMptModel.toJson());
    }
  }


  // * => Notifikasi DataSources
  @override
  Future<void> createNotifikasi(NotifikasiModel notifikasiModel) async {
    if (kDebugMode) {
      print(notifikasiModel.toJson());
    }
  }

  @override
  Future<void> deleteNotifikasi(int idNotifikasi) async {
    if (kDebugMode) {
      print("Notifikasi with id $idNotifikasi has been deleted.");
    }
  }

  @override
  Future<List<NotifikasiModel>> readAllNotifikasi(String filter) async {
    final String response =
        await rootBundle.loadString('assets/json_file/notifikasi_list.json');
    List<dynamic> resultList = json.decode(response);

    List<NotifikasiModel> result =
    resultList.map((resultMap) => NotifikasiModel.fromJson(resultMap))
        .toList();

    if (kDebugMode) {
      print(filter);
    }

    return result;
  }

  @override
  Future<NotifikasiModel> readNotifikasi(int idNotifikasi) async {
    final String response =
    await rootBundle.loadString('assets/json_file/notifikasi.json');
    dynamic jsonDecode = json.decode(response);

    NotifikasiModel result = NotifikasiModel.fromJson(jsonDecode);

    return result;
  }

  @override
  Future<void> updateNotifikasi(NotifikasiModel notifikasiModel) async {
    if (kDebugMode) {
      print(notifikasiModel.toJson());
    }
  }
}
