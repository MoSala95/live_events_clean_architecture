import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gett;
import 'package:live_events_clean_architecture/core/network_connection_status/network_connection_status.dart';
import 'package:live_events_clean_architecture/core/utils/print.dart';
import '../api/status_code.dart';

import '../error/exceptions.dart';
 import 'api_consumer.dart';
import 'app_interceptors.dart';

class DioConsumer implements ApiConsumer {
  Dio client = gett.Get.find<Dio>();
  NetworkConnectionStatus internetService = gett.Get.find<NetworkConnectionStatus>();

  DioConsumer() {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        ((HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    });

    client.options.responseType = ResponseType.json;

    // ..sendTimeout = 500;

    ///this is not working as we need to pass access token
    client.interceptors.add(gett.Get.find<AppInterceptors>());

    if (kDebugMode) {
      client.interceptors.add(LogInterceptor(
        requestHeader: true,
        request: true,
        requestBody: true,
        error: true,
        responseBody: true,
        responseHeader: true,
      ));
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? quaryparam, Options? options}) async {
    return _handleSendRequest(
        call: () async => await client.get(path,
            queryParameters: quaryparam, options: options));
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? quaryparam,
      dynamic body,
      Options? options,
        bool formDataEnabled=false}) async {
    return _handleSendRequest(
        call: () => client.post(path,
            queryParameters: quaryparam,
            options: options,

            data: formDataEnabled ? FormData.fromMap(body!) : body,));
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? quaryparam,
      Map<String, dynamic>? body,
      Options? options,bool formDataEnabled=false}) async {
    return _handleSendRequest(
        call: () => client.put(path,
            queryParameters: quaryparam, data:  formDataEnabled ? FormData.fromMap(body!) : body, options: options));
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? quaryparam,
      Map<String, dynamic>? body,
      Options? options}) async {
    return _handleSendRequest(
        call: () => client.delete(path,
            queryParameters: quaryparam, data: body, options: options));
  }

  dynamic _handleSendRequest({required Function() call}) async {
    bool isConnected = await internetService.isConnected;
    iPrint("_handleSendRequest - isConnected: $isConnected");
    if (isConnected == false) {
      throw NoInternetConnectionException();
    } else {
      try {
        final response = await call();
        return _handleResponseAsJson(response);
      } on DioError catch (error) {
        _handleDioError(error);
      }
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    return response.data;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException();
    }
  }
}
