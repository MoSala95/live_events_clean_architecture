import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? quaryparam,Options? options});
  Future<dynamic> post(String path, {Map<String, dynamic>? quaryparam, dynamic body,Options? options,bool formDataEnabled});
  Future<dynamic> put(String path, {Map<String, dynamic>? quaryparam, Map<String, dynamic>? body,Options? options,bool formDataEnabled});
  Future<dynamic> delete(String path,{Map<String, dynamic>? quaryparam, Map<String, dynamic>? body,Options? options});

}