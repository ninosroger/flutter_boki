import 'package:dio/dio.dart';
import 'package:flutter_boki/common/global_field.dart';
import 'net_error.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    if (options.queryParameters.isEmpty) {
      GlobalField.logger.d('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      GlobalField.logger.d('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    GlobalField.logger.d('RequestMethod: ' + options.method);
    GlobalField.logger.d('RequestHeaders:' + options.headers.toString());
    GlobalField.logger.d('RequestContentType: ${options.contentType}');
    GlobalField.logger.d('RequestData: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.statusCode == ExceptionHandle.success) {
      GlobalField.logger.d('ResponseCode: ${response.statusCode}');
    }
    GlobalField.logger.d(response.data.toString());
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}

class AdapterInterceptor extends Interceptor {

  @override
  Future onResponse(Response response) {
    final Response r = adapterData(response);
    return super.onResponse(r);
  }

  @override
  Future onError(DioError err) {
    if (err.response != null) {
      adapterData(err.response);
    }
    return super.onError(err);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data?.toString() ?? '';
    if (response.statusCode == ExceptionHandle.success) {
    } else {
    }
    response.statusCode = ExceptionHandle.success;
    response.data = result;
    return response;
  }
}
