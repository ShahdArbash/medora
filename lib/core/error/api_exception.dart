enum ApiExceptionType {
  network,
  timeout,
  unauthorized,
  notFound,
  validation,
  server,
  unknown,
}

class ApiException implements Exception {
  final ApiExceptionType type;
  final int? statusCode;
  final String? serverMessage;
  final Map<String, dynamic>? errors;

  const ApiException({
    required this.type,
    this.statusCode,
    this.serverMessage,
    this.errors,
  });

  @override
  String toString() => serverMessage ?? type.name;

  String get userMessage {
    //  1. Laravel validation errors
    if (errors != null && errors!.isNotEmpty) {
      final firstError = errors!.values.first;

      if (firstError is List && firstError.isNotEmpty) {
        return _translate(firstError.first);
      }
    }

    //  2. server message
    if (serverMessage != null) {
      return _translate(serverMessage!);
    }

    // 🔥 3. default messages
    switch (type) {
      case ApiExceptionType.network:
        return "لا يوجد اتصال بالإنترنت";
      case ApiExceptionType.timeout:
        return "انتهت مهلة الطلب";
      case ApiExceptionType.unauthorized:
        return "انتهت الجلسة، سجل دخول من جديد";
      case ApiExceptionType.notFound:
        return "البيانات غير موجودة";
      case ApiExceptionType.validation:
        return "البيانات المدخلة غير صحيحة";
      case ApiExceptionType.server:
        return "خطأ في السيرفر";
      case ApiExceptionType.unknown:
        return "حدث خطأ غير متوقع";
    }
  }

  factory ApiException.fromStatusCode(
    int? code,
    String? message,
    Map<String, dynamic>? errors,
  ) {
    switch (code) {
      case 401:
        return ApiException(
          type: ApiExceptionType.unauthorized,
          statusCode: code,
          serverMessage: message,
          errors: errors,
        );

      case 404:
        return ApiException(
          type: ApiExceptionType.notFound,
          statusCode: code,
          serverMessage: message,
          errors: errors,
        );

      case 422:
        return ApiException(
          type: ApiExceptionType.validation,
          statusCode: code,
          serverMessage: message,
          errors: errors,
        );

      default:
        return ApiException(
          type: ApiExceptionType.server,
          statusCode: code,
          serverMessage: message,
          errors: errors,
        );
    }
  }

  String _translate(String msg) {
    final m = msg.toLowerCase();

    if (m.contains("email has already been taken")) {
      return "البريد الإلكتروني مستخدم مسبقاً";
    }

    if (m.contains("password")) {
      return "كلمة المرور غير صحيحة";
    }

    if (m.contains("the given data was invalid")) {
      return "البيانات المدخلة غير صحيحة";
    }

    return msg;
  }

  factory ApiException.fromResponse(int? code, dynamic responseData) {
    String? message;
    Map<String, dynamic>? errors;

    if (responseData is Map) {
      if (responseData["data"] is String) {
        message = responseData["data"];
      }

      if (responseData["errors"] is Map) {
        errors = responseData["errors"];
      }

      if (message == null && responseData["message"] is String) {
        message = responseData["message"];
      }
    }

    return ApiException(
      type: _mapType(code),
      statusCode: code,
      serverMessage: message,
      errors: errors,
    );
  }

  static ApiExceptionType _mapType(int? code) {
    switch (code) {
      case 401:
        return ApiExceptionType.unauthorized;
      case 404:
        return ApiExceptionType.notFound;
      case 422:
        return ApiExceptionType.validation;
      default:
        return ApiExceptionType.server;
    }
  }
}
