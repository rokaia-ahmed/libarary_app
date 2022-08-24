import 'package:dio/dio.dart';
//https://www.googleapis.com/books/v1/volumes?q=subject:fiction
class DioHelper {

  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.googleapis.com/books/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
    Map<String,dynamic>? query,
  }) async
  {
    return await dio.get(url, queryParameters : query ,);
  }

}