import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int? statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    this.statusCode,
    required this.statusMessage,
    this.success = false,
  });

  @override
  String toString() {
    return 'ErrorMessageModel(statusCode: $statusCode, statusMessage: $statusMessage, success: $success)';
  }

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
      success: json['success'],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
