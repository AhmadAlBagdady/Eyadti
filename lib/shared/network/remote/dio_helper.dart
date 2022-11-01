import 'package:departments/shared/constant/constant.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  Map<String, dynamic> headers = {
    'Accept': 'application/json',
  };

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        validateStatus: (status) {
          return status! <= 500;
        }));
  }

  Future<Response> getData({required String url, required String token}) async {
    headers['Authorization'] = 'Bearer $token';
    return await dio.get(
      url,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData(
      {required String url, String? token, required dynamic data}) async {
    headers['Authorization'] = 'Bearer $token';
    return await dio.post(url, data: data, options: Options(headers: headers));
  }
}
