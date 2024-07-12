import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

@immutable
class ClientService {
  static const ClientService _service = ClientService._interval();

  const ClientService._interval();

  factory ClientService() {
    return _service;
  }
  static const String _baseUrlMockApi = '65cafdc2efec34d9ed868141.mockapi.io';
  // static const String _baseUrl = 'api.api-ninjas.com';
  static const String _baseUrl = 'suggest-maps.yandex.ru';
  //https://suggest-maps.yandex.ru/v1/suggest?apikey=0aa047c7-c449-4a16-ae35-d6a2a56deaa0&text=бурдж

  static const String api = '/v1/suggest';
  static const String apiMockAPI = '/htttpClientPost';

  static Future<String?> getHttpClientMOck(
      {required String api, required Map<String, dynamic> data}) async {
    //object olinyapti
    HttpClient httpClient = HttpClient();
    try {
      //url olinyapti
      Uri url = Uri.https(_baseUrlMockApi, apiMockAPI, data);

      //get bilan sorov yuborilyapti
      HttpClientRequest request = await httpClient.getUrl(url);

      //hesaders qo`shilyapti
      request.headers.set('Content-Type', 'application/json');

      //jonatilgan sorovni yopish close
      HttpClientResponse response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      //responni tekshirish agar OK bolsa respons body ni qaytaradi
      if (response.statusCode == HttpStatus.ok) {
        return responseBody;
      } else {
        throw Exception(
            'Failed to delete resource: ${response.statusCode}, $responseBody');
      }
    } finally {
      httpClient.close();
    }
  }

  static Future<String?> getHttpClientData(
      {required String api, required Map<String, dynamic> data}) async {
    //object olinyapti
    HttpClient httpClient = HttpClient();
    try {
      //url olinyapti
      Uri url = Uri.https(_baseUrl, api, data);

      //get bilan sorov yuborilyapti
      HttpClientRequest request = await httpClient.getUrl(url);

      //hesaders qo`shilyapti
      request.headers
          .set('X-Api-Key', 'N4Sfls3xRbYCJcCNVrm20g==OIEkHNEhMS7G5kxQ');

      //jonatilgan sorovni yopish close
      HttpClientResponse response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      //responni tekshirish agar OK bolsa respons body ni qaytaradi
      if (response.statusCode == HttpStatus.ok) {
        return responseBody;
      } else {
        throw Exception(
            'Failed to delete resource: ${response.statusCode}, $responseBody');
      }
    } finally {
      httpClient.close();
    }
  }

  static Future<String?> postHttpClientData(
      {required String api,
      required Map<String, Object?> data,
      required String id}) async {
    //object olinyapti
    HttpClient httpClient = HttpClient();
    try {
      //url olinyapti
      Uri url = Uri.https(_baseUrlMockApi, apiMockAPI, data);

      //post bilan sorov yuborilyapti
      HttpClientRequest request = await httpClient.postUrl(url);

      //hesaders qo`shilyapti
      request.headers.set('Content-Type', 'application/json');

      //Map data avval Stringga keyin utf8 ga otib requestga qoshilyapti
      request.add(utf8.encode(jsonEncode(data)));

      //jonatilgan sorovni yopish close
      HttpClientResponse response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      //responni tekshirish agar OK bolsa respons body ni qaytaradi
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return responseBody;
      } else {
        throw Exception(
            'Failed to posts resource: ${response.statusCode}, $responseBody');
      }
    } finally {
      httpClient.close();
    }
  }

  static Future<String?> putHttpClientData(
      {required String api,
      required String id,
      required Map<String, Object?> data}) async {
    //object olinyapti
    HttpClient httpClient = HttpClient();
    try {
      //url olinyapti
      Uri url = Uri.parse('$_baseUrl/$api');

      //post bilan sorov yuborilyapti
      HttpClientRequest request = await httpClient.putUrl(url);

      //hesaders qo`shilyapti
      request.headers.set('Content-Type', 'application/json');

      //Map data avval Stringga keyin utf8 ga otib requestga qoshilyapti
      request.add(utf8.encode(jsonEncode(data)));

      //jonatilgan sorovni yopish close
      HttpClientResponse response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      //responni tekshirish agar OK bolsa respons body ni qaytaradi
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return responseBody;
      } else {
        throw Exception(
            'Failed to posts resource: ${response.statusCode}, $responseBody');
      }
    } finally {
      httpClient.close();
    }
  }
}
