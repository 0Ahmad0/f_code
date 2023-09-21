import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ApiServices {
  Future<dynamic> get(String path,
      {Map<String, String>? queryParams, bool? hasToken});

  Future post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });

  Future postFiles(BuildContext context,
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? body,
        FormData? formData,
        String? key,
        bool? hasToken,
      });

  Future postList(
      String path, {
        Map<String, String>? queryParams,
        List<dynamic>? body,
        FormData? formData,
        bool? hasToken,
      });
  Future put(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? body,
        FormData? formData,
        bool? hasToken,
      });
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool? hasToken,
  });
}
