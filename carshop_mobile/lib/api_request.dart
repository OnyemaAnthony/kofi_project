import 'package:dio/dio.dart';
class ApiRequest {
  String defaultUri = "https://";
  late final Dio dio;
  ApiRequest() {
    var options = BaseOptions(
        baseUrl: defaultUri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic> query = const {}, Map<String, dynamic> headers = const {}}) async {
    final response = await dio.get(path,queryParameters: query);
    return process(response);
  }

  Future<List> getList(String path, {Map<String, dynamic> query = const {},
    Map<String, dynamic> headers = const {}}) async {
    final response = await dio.get(path,queryParameters: query);
    return (response.data as List);
  }

  Future<Map<String, dynamic>> post(String path,{Map<String, dynamic> body = const {},Map<String, dynamic> headers = const {}}) async {
    final response = await dio.post(path,data: body);
    return process(response);
  }

  Future<Map<String, dynamic>> patch(String path, {Map<String, dynamic> body = const {},Map<String, dynamic> headers = const {}}) async {
    final response = await dio.patch(path, data: body);
    return process(response);
  }

  Future<Map<String, dynamic>> put(String path, {Map<String, dynamic> body = const {},
        Map<String, dynamic> headers = const {}}) async {
    final response = await dio.put(path,data: body);
    return process(response);
  }

  Future<Map<String, dynamic>> delete(String path, {Map<String, dynamic> headers = const {}}) async {
    final response = await dio.delete(path);
    return process(response);
  }

  Future<String> deletePush(String path,{Map<String, dynamic> headers = const {}}) async {
    final response = await dio.delete(path);
    return response.toString();
  }

  Map<String, dynamic> process(Response<dynamic> response) {
    return Map<String, dynamic>.from(response.data);
  }

}
