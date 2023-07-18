import 'package:dio/dio.dart';

class DioUtil {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://oafish-eggnog-production.up.railway.app',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  );

  static Dio get dio {
    return _dio;
  }
}
