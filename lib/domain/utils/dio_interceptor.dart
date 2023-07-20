import 'package:dio/dio.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class DioInterceptor extends Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    mipokaCustomToast(err.message);
    return super.onError(err, handler);
  }
}
