import 'dart:async';
import 'package:chopper/chopper.dart';

class ApiKeyInterceptor implements RequestInterceptor {
  final String paramName;
  final String apiKey;

  const ApiKeyInterceptor({
    this.paramName = "api_key",
    this.apiKey,
  });

  @override
  FutureOr<Request> onRequest(Request request) async {
    final paramsWithKey = Map<String, dynamic>();
    paramsWithKey.addAll(request.parameters);
    paramsWithKey[this.paramName] = this.apiKey;
    final newRequest = request.copyWith(parameters: paramsWithKey);
    return newRequest;
  }
}
