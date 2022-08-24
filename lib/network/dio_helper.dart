import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang='en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(
      url,
      queryParameters: query,

    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      String? lang='en',
      String? token,
      required dynamic data}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        String? lang='en',
        String? token,
        required dynamic data}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData(
      {required String url,
        Map<String, dynamic>? query,
        String? lang='en',
        String? token,
        required dynamic data}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',    };
    return await dio!.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
