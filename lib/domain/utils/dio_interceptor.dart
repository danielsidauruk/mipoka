import 'package:dio/dio.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // mipokaCustomToast(err.message ?? "Dio Error");
    return super.onError(err, handler);
  }
}
