import 'package:sgm_block/core/data/error/error_model.dart';
import 'package:sgm_block/core/data/error/exception.dart';

class FetchDataException extends ServerException {
  FetchDataException({
    String message = "No Internet Connection, Please check your connection",
  }) : super(
          errorMessageModel: ErrorMessageModel(
            statusCode: 400,
            statusMessage: message,
            success: false,
          ),
        );
}
