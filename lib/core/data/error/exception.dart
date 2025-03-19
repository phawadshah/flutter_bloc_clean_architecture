import 'package:flutter/services.dart';
import 'package:sgm_block/core/data/error/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});

  factory ServerException.fromException(dynamic e) {
    if (e is ServerException) {
      return e;
    } else if (e is PlatformException) {
      return ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: e.message ?? '',
      ));
    } else {
      return ServerException(
          errorMessageModel: ErrorMessageModel(statusMessage: e.toString()));
    }
  }
}
