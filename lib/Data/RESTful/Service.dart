import 'dart:async';
import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:http_logging/http_logging.dart';

class Service {
  // static const String baseUrl = 'http://localhost:8000/';
  static const String baseUrl = 'http://192.168.1.8:8000/';
  
  static Map<String, String> header;
  static http.Client client = new http.Client();

  static void setLogging(bool b, {LoggingLevel level = LoggingLevel.body}) {
    if (b) {
      client = LoggingClient(http.Client(), level: level, logger: (msg) {
        debugPrint('HTTP: $msg');
      });
    } else {
      client = http.Client();
    }
  }

  static Future<http.Response> get(String path) async =>
      await client.get('$baseUrl$path', headers: header);
  static Future<http.Response> post(
          String path, Map<String, dynamic> json) async =>
      await client.post('$baseUrl$path', headers: header, body: json);
}
