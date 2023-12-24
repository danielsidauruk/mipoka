import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

class DioUtil {
  final Dio _dio;

  factory DioUtil() => _singleton;

  DioUtil._internal(Dio dio) : _dio = dio {
    _setupInterceptors();
  }

  static final DioUtil _singleton = DioUtil._internal(
    Dio(
      BaseOptions(
        baseUrl: 'https://oafish-eggnog-production.up.railway.app',
      ),
    ),
  );

  Dio get dio => _dio;

  void _setupInterceptors() {
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(DioInterceptor());
  }
}
