// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formdata;
import 'package:dio/src/response.dart' as resp;
import 'package:flutter/foundation.dart';
import 'package:jabar_form/src/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestConnector {
  final String url;
  final String requestType;
  final formdata.FormData? formData;
  final Map<String, dynamic>? queryData;

  final String rawJson;

  RestConnector({
    required this.url,
    this.requestType = 'GET',
    this.formData,
    this.queryData,
    this.rawJson = '',
  });

  Future<resp.Response> call() async {
    try {
      Dio dio = Dio()
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: true,
        ));

      String? token = JabarForm.instance.getAccessToken();
      dio.options.headers['Authorization'] = 'Bearer $token';

      if (requestType == 'GET') {
        resp.Response response = await dio.request(
          url,
          options: Options(method: requestType),
          queryParameters: queryData,
        );
        return response;
      } else if (requestType == 'POST') {
        if (rawJson.isNotEmpty) {
          dio.options.headers['Content-Type'] = 'application/json';

          resp.Response response = await dio.request(
            url,
            data: rawJson,
            options: Options(method: 'POST'),
          );
          // debugPrint('data--->$rawJson');
          return response;
        } else {
          resp.Response response = await dio.request(
            url,
            data: formData,
            options: Options(method: requestType),
          );

          return response;
        }
      } else if (requestType == 'MULTIPART') {
        dio.options.headers = {
          Headers.contentTypeHeader: 'multipart/form-data'
        };
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );

        return response;
      } else {
        dio.options.headers['Content-Type'] = 'application/json';

        resp.Response response = await dio.request(
          url,
          data: rawJson,
          options: Options(method: 'POST'),
        );
        debugPrint('data--->$rawJson');
        return response;
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }
}
