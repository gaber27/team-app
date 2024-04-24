import 'package:dio/dio.dart';

// Used dio to handle APIs requested
class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/' ,
        receiveDataWhenStatusError: true ,
      ),
    );
  }

  // Get function to fetch data
  static Future<Response> getDate({
    required var url ,
    Map<String, dynamic>? query ,
    String? tokens ,
  }) async
  {
    dio.options.headers={
      'Content-Type': 'application/json',
    };
    return dio.get(
      url ,
      queryParameters: query,

    ) ;
  }

}