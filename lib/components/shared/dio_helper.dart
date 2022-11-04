import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://technichal.prominaagency.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url, String? token}) async {
    dio.options.headers = {'Authorization': token ?? ''};
    return await dio.get(url);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
