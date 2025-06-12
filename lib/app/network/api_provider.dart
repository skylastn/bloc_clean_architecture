import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:kiosk_bo/app/global/logic/local_session.dart';
import '../../core/env.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'http_config.dart';
import 'model/network_status_model.dart';
import 'model/response_model.dart';

class ApiProvider {
  String url = '${Env.value.baseUrl}/api/';
  var client = http.Client();
  int timeOut = 120;
  final localSession = inject.get<LocalSession>();

  Future<ResponseModel> postApi(
    String urlPrefix, {
    Object? body,
    bool header = true,
  }) async {
    var urlS = url + urlPrefix;
    if (kDebugMode) {
      log('ambil data Post : $urlS');
      log(body.toString());
    }
    try {
      late http.Response response;
      if (!kIsWeb) {
        response = await TrustAllCertificates.getInstance
            .sslClient()
            .post(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      } else {
        response = await client
            .post(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      }

      if (kDebugMode) {
        log('response -> $urlPrefix : ${(response.body)}');
        log('statuscode : ${response.statusCode}');
      }
      if (NetworkStatusModel.isStatusOkay(response.statusCode)) {
        return ResponseModel(
          isError: false,
          result: response,
          msg: 'Success Post Data',
        );
      }
      if (NetworkStatusModel.isUnauthorized(response.statusCode)) {
        return ResponseModel(
          isError: true,
          result: response,
          msg: 'Unauthorized',
        );
      }
      String msg =
          jsonDecode(response.body)['error_message'] ??
          ['message'] ??
          'Server Error';
      return ResponseModel(isError: true, result: response, msg: msg);
    } on TimeoutException {
      throw 'Connection Timeout, please check your connection';
    } catch (e) {
      if (kDebugMode) {
        log('failed $urlPrefix : $e');
      }
      return ResponseModel(isError: true, result: null, msg: e.toString());
    }
  }

  Future<ResponseModel> getApi(
    String urlPrefix, {
    bool header = true,
    Map<String, dynamic>? query,
  }) async {
    var urlS = url + urlPrefix;
    if (kDebugMode) {
      log('ambil data Get : $urlS');
    }
    if (query != null && query.isNotEmpty) {
      int tempCount = 0;
      query.forEach((key, value) {
        if (tempCount == 0) {
          urlS = '$urlS?$key=$value';
        } else {
          urlS = '$urlS&$key=$value';
        }
        tempCount++;
      });
    }
    try {
      late http.Response response;
      if (!kIsWeb) {
        response = await TrustAllCertificates.getInstance
            .sslClient()
            .get(
              Uri.parse(urlS),
              // query: query,
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      } else {
        response = await client
            .get(
              Uri.parse(urlS),
              // query: query,
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      }

      if (kDebugMode) {
        log('response -> $urlPrefix : ${response.body}');
        log('statuscode : ${response.statusCode}');
      }
      if (NetworkStatusModel.isStatusOkay(response.statusCode)) {
        return ResponseModel(
          isError: false,
          result: response,
          msg: 'Success Get Data',
        );
      }
      if (NetworkStatusModel.isUnauthorized(response.statusCode)) {
        return ResponseModel(
          isError: true,
          result: response,
          msg: 'Unauthorized',
        );
      }
      String msg =
          jsonDecode(response.body)['error_message'] ??
          ['message'] ??
          'Server Error';
      return ResponseModel(isError: true, result: response, msg: msg);
    } on TimeoutException {
      throw 'Connection Timeout, please check your connection';
    } catch (e) {
      if (kDebugMode) {
        log('failed $urlPrefix : $e');
      }
      return ResponseModel(isError: true, result: null, msg: e.toString());
    }
  }

  Future<ResponseModel> patchApi(
    String urlPrefix, {
    Object? body,
    bool header = true,
  }) async {
    var urlS = url + urlPrefix;
    if (kDebugMode) {
      log('ambil data Post : $urlS');
      log(body.toString());
    }
    try {
      late http.Response response;
      if (!kIsWeb) {
        response = await TrustAllCertificates.getInstance
            .sslClient()
            .patch(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      } else {
        response = await client
            .patch(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      }

      if (kDebugMode) {
        log('response -> $urlPrefix : ${response.body}');
        log('statuscode : ${response.statusCode}');
      }
      if (NetworkStatusModel.isStatusOkay(response.statusCode)) {
        return ResponseModel(
          isError: false,
          result: response,
          msg: 'Success Get Data',
        );
      }
      if (NetworkStatusModel.isUnauthorized(response.statusCode)) {
        return ResponseModel(
          isError: true,
          result: response,
          msg: 'Unauthorized',
        );
      }
      String msg =
          jsonDecode(response.body)['error_message'] ??
          ['message'] ??
          'Server Error';
      return ResponseModel(isError: true, result: response, msg: msg);
    } on TimeoutException {
      throw 'Connection Timeout, please check your connection';
    } catch (e) {
      if (kDebugMode) {
        log('failed $urlPrefix : $e');
      }
      return ResponseModel(isError: true, result: null, msg: e.toString());
    }
  }

  Future<ResponseModel> deleteApi(
    String urlPrefix,
    Map<String, dynamic> body, {
    bool header = true,
  }) async {
    var urlS = url + urlPrefix;
    if (kDebugMode) {
      log('ambil data Delete : $urlS');
      log(body.toString());
    }
    try {
      late http.Response response;
      if (!kIsWeb) {
        response = await TrustAllCertificates.getInstance
            .sslClient()
            .delete(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      } else {
        response = await client
            .delete(
              Uri.parse(urlS),
              body: jsonEncode(body),
              headers: (header) ? await headerLogin() : headerNormal(),
            )
            .timeout(Duration(seconds: timeOut));
      }

      if (kDebugMode) {
        log('response -> $urlPrefix : ${response.body}');
        log('statuscode : ${response.statusCode}');
      }
      if (NetworkStatusModel.isStatusOkay(response.statusCode)) {
        return ResponseModel(
          isError: false,
          result: response,
          msg: 'Success Get Data',
        );
      }
      if (NetworkStatusModel.isUnauthorized(response.statusCode)) {
        return ResponseModel(
          isError: true,
          result: response,
          msg: 'Unauthorized',
        );
      }
      String msg =
          jsonDecode(response.body)['error_message'] ??
          ['message'] ??
          'Server Error';
      return ResponseModel(isError: true, result: response, msg: msg);
    } on TimeoutException {
      throw 'Connection Timeout, please check your connection';
    } catch (e) {
      if (kDebugMode) {
        log('failed $urlPrefix : $e');
      }
      return ResponseModel(isError: true, result: null, msg: e.toString());
    }
  }

  // Future<ResponseModel> postApiWithFiles(String urlPrefix,
  //     {Object? body, bool header = true}) async {
  //   var urlS = url + urlPrefix;
  //   if (kDebugMode) {
  //     log('ambil data Post : $urlS');
  //     log(body.toString());
  //   }
  //   try {
  //     final Response response = await connect.post(
  //       urlS,
  //       body,
  //       headers: (header) ? await headerImage() : headerNormal(),
  //     );
  //     if (kDebugMode) {
  //       log('response -> $urlPrefix : ${response.bodyString}');
  //       log('statuscode : ${response.statusCode}');
  //     }
  //     if (response.isOk) {
  //       return ResponseModel(
  //         isError: false,
  //         result: response,
  //         msg: 'Success Get Data',
  //       );
  //     }
  //     if (response.unauthorized) {
  //       return ResponseModel(
  //         isError: true,
  //         result: response,
  //         msg: 'Unauthorized',
  //       );
  //     }
  //     return ResponseModel(
  //       isError: true,
  //       result: response,
  //       msg: jsonDecode(response.bodyString ?? '''{}''')['error_message'] ?? ['message'] ??
  //           'Server Error',
  //     );
  //   } on TimeoutException {
  //     throw 'Connection Timeout, please check your connection';
  //   } catch (e) {
  //     if (kDebugMode) {
  //       log('failed $urlPrefix : $e');
  //     }
  //     return ResponseModel(isError: true, result: null, msg: e.toString());
  //   }
  // }

  Future<Map<String, String>?> headerLogin() async {
    return {
      'Authorization': 'Bearer ${(await localSession.tokenModel)?.token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Map<String, String>? headerNormal() {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  Map<String, String>? headerFCM() {
    return {
      // 'Authorization': 'key=$apiKeyFcm',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<Map<String, String>?> headerImage() async {
    return {
      'Authorization': 'Bearer ${(await localSession.tokenModel)?.token}',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
  }

  Future<Map<String, String>?> headerCheck({int choice = 0}) async {
    if (choice == 1) {
      return await headerLogin();
    }
    if (choice == 2) {
      return headerFCM();
    }
    return headerLogin();
  }
}
