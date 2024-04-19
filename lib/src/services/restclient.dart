// ignore_for_file: unused_catch_stack, use_function_type_syntax_for_parameters

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:rent_a_car_skeleton/src/services/auth_service.dart';

// configs
import 'package:rent_a_car_skeleton/src/utils/helpers/dio_helper.dart';
import 'package:rent_a_car_skeleton/src/utils/config/config.dart';

// models
import 'package:rent_a_car_skeleton/src/models/error.dart';
import 'package:rent_a_car_skeleton/src/models/login.dart';

enum RequestType { post, get, put, patch, delete }

class RestClient extends getx.GetxService {
  final bool debug = true;
  // final AuthService authService = Get.find<AuthService>();
  int retries = 0;

  Future<RestClient> init() async {
    await DioHelper.init(ServerData.hostname);
    await DioHelper.initCookies();
    return this;
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await _sendRequest(
      '/method/login',
      data: loginRequest.toJson(),
      type: RequestType.post,
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.headers.map["set-cookie"] != null) {
        if (response.headers.map["set-cookie"]?[3] != null) {
          response.data["user_id"] = response.headers.map["set-cookie"]![3]
              .split(';')[0]
              .split('=')[1];
        }
      }
      return LoginResponse.fromJson(response.data);
    } else {
      throw ErrorResponse(
        statusMessage: response.data["message"],
        statusCode: response.statusCode,
      );
    }
  }

  Future<dynamic> sendRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    RequestType type = RequestType.get,
  }) async {
    // print('ccc ${DioHelper.cookies.split(';')[0].split('=')[1]}');
    if (DioHelper.cookies.split(';')[0].split('=')[1] == 'Guest') {
      AuthService authService = getx.Get.find<AuthService>();
      authService.getLoggedOutUser();
      return false;
    }
    Response result = await _sendRequest(endpoint, data: data, type: type);
    // print('eee ${}');
    if (result.data['exception'] != null) {
      if (result.data['_server_messages'][0]['message'] ==
          "User <strong>Guest</strong> does not have access to this document") {
        throw ErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: "No Permissions",
        );
      }
    }
    return result.data['data'] ?? result.data['message'];
  }

  bool validateStatus(int? status) {
    if (status != null) {
      return status < 500;
    } else {
      return false;
    }
  }

  Future<Response> _sendRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    RequestType type = RequestType.get,
  }) async {
    try {
      late final Response response;
      // print('=== $data');
      switch (type) {
        case RequestType.post:
          response = await DioHelper.dio.post(
            endpoint,
            data: data,
            options: Options(
              validateStatus: validateStatus,
            ),
          );
          break;
        case RequestType.get:
          response = await DioHelper.dio.get(
            endpoint,
            queryParameters: data,
            // options: Options(
            //   validateStatus: (status) {
            //     if (status != null) {
            //       return status < 500;
            //     } else {
            //       return false;
            //     }
            //   },
            // ),
          );
          break;
        case RequestType.put:
          response = await DioHelper.dio.put(
            endpoint,
            queryParameters: data,
            options: Options(
              validateStatus: (status) {
                if (status != null) {
                  return status < 500;
                } else {
                  return false;
                }
              },
            ),
          );
          break;
        case RequestType.delete:
        case RequestType.patch:
          throw UnimplementedError();
      }
      // print('=== ${response.data}');
      return response;
    } catch (e, s) {
      if ((e is! DioException)) rethrow;

      final error = e.error;
      if (error is SocketException) {
        throw ErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: error.message,
        );
      }

      if (error is HandshakeException) {
        throw ErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: "Cannot connect securely to server."
              " Please ensure that the server has a valid SSL configuration.",
        );
      }
      print(e.type);
      print(e.message);
      print(e.response);
      print(s);
      throw ErrorResponse(
          statusCode: e.response?.statusCode ?? 500,
          statusMessage: e.message ?? 'Something went wrong');
    }
  }
}
