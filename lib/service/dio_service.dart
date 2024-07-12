// // ignore_for_file: constant_identifier_names
// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:map_flutter_yandex/service/util_service.dart';
// enum ApiResult {
//   success,
//   error,
// }
// enum RequestMethod {
//   GET,
//   POST,
//   PUT,
//   DELETE,
// }
// @immutable
// sealed class DioService {
//   /// Options
//   static BaseOptions _options = BaseOptions();
//   static Dio _dio = Dio();
//   static Dio init() {
//     _options = BaseOptions(
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//       sendTimeout: const Duration(seconds: 30),
//       baseUrl: 'https://65cafdc2efec34d9ed868141.mockapi.io',
//       contentType: "application/json",
//     );
//     _dio = Dio(_options);
//     return _dio;
//   }
//   /// method
//   static Future<String?> getData(BuildContext context, String api,
//       [Map<String, dynamic>? param]) async {
//     try {
//       Response response = await init().get(api, queryParameters: param);
//       return jsonEncode(response.data);
//     } on DioException catch (e) {
//       log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
//       Future.delayed(Duration.zero).then((value) {
//         Utils.fireSnackBar(
//             "DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}",
//             context);
//       });
//       return null;
//     }
//   }
//   static Future<String?> postData(
//       BuildContext context, String api, Map<String, Object?> data,
//       [Map<String, dynamic>? param]) async {
//     try {
//       Response response = await init().post(api, data: jsonEncode(data));
//       return jsonEncode(response.data);
//     } on DioException catch (e) {
//       log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
//       Future.delayed(Duration.zero).then((value) {
//         Utils.fireSnackBar(
//             "DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}",
//             context);
//       });
//       return null;
//     }
//  }
//   static Future<String?> updateData(
//       BuildContext context, String api, String id, Map<String, Object?> data,
//       [Map<String, dynamic>? param]) async {
//     try {
//       Response response = await init()
//           .put("$api/$id", data: jsonEncode(data), queryParameters: param);
//       return jsonEncode(response.data);
//     } on DioException catch (e) {
//       log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
//       Future.delayed(Duration.zero).then((value) {
//         Utils.fireSnackBar(
//             "DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}",
//             context);
//       });
//       return null;
//     }
//   }
//   static Future<String?> deleteData(
//       BuildContext context, String api, String id, Map<String, Object?> data,
//       [Map<String, dynamic>? param]) async {
//     try {
//       Response response = await init().delete("$api/$id", data: data);
//       return jsonEncode(response.data);
//     } on DioException catch (e) {
//       log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
//       Future.delayed(Duration.zero).then((value) {
//         Utils.fireSnackBar(
//             "DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}",
//             context);
//       });
//       return null;
//     }
//   }
//   static Future<String?> request(
//       BuildContext context, String api, RequestMethod method,
//       [Map<String, dynamic>? param,
//       Map<String, Object?> data = const {},
//       String? id]) async {
//     try {
//       Response response = await init().request(id == null ? api : "$api/$id",
//           data: jsonEncode(data),
//           options: Options(
//             method: method.name,
//           ));
//       return jsonEncode(response.data);
//     } on DioException catch (e) {
//       log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
//       Future.delayed(Duration.zero).then((value) {
//         Utils.fireSnackBar(
//             "DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}",
//             context);
//       });
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

@immutable
sealed class NetworkService {
  /// base url
  static const String _baseUrl = "suggest-maps.yandex.ru";

  /// api
  static const String apiTitle = "/v1/suggest";

  /// headers
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  /// methods

  // get
  static Future<String?> getData(
      {required String api, required Map<String, Object?> param}) async {
    Uri url = Uri.https(_baseUrl, api, param);
    log(url.toString());
    Response response = await https.get(url);
    log(response.body);
    if (response.statusCode <= 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // post
  static Future<String?> postData(
      {required String api,
      required Map<String, Object?> param,
      required Map<String, Object?> data}) async {
    Uri url = Uri.https(_baseUrl, api, param);
    Response response =
        await post(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode <= 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // update
  static Future<String?> updateData(
      {required String api,
      required Map<String, Object?> param,
      required Map<String, Object?> data}) async {
    Uri url = Uri.https(_baseUrl, api, param);
    Response response =
        await put(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode <= 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // delete
  static Future<String?> deleteData(
      {required String api,
      required Map<String, Object?> param,
      required Map<String, Object?> data}) async {
    Uri url = Uri.https(_baseUrl, api, param);
    log(url.toString());
    Response response =
        await delete(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode <= 201) {
      return response.body;
    } else {
      return null;
    }
  }

  /// params

  static Map<String, Object?> paramSearchProduct(String text) =>
      <String, Object?>{
        "apikey": "7f3714f4-2e7d-44b0-869f-21deba8c98ed",
        "text": text,
      };
}
