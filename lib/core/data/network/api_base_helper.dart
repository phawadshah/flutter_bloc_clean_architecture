import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sgm_block/core/data/error/error_model.dart';
import 'package:sgm_block/core/data/error/exception.dart';
import 'package:sgm_block/core/data/error/exceptions.dart';
import 'package:sgm_block/core/data/network/api_constants.dart';

class ApiHelper {
  http.Client client = http.Client();
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    try {
      log(url.toString());
      Map<String, String> defaultHeaders =
          ApiHeaders.buildHeaders(ApiConstants.token);
      http.Response response = await client
          .get(url, headers: headers ?? defaultHeaders)
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException();
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    }
    return response;
  }
}
