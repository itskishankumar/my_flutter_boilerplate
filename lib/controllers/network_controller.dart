import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/theme.dart';
import '../utils/error_utils.dart';
import '../utils/toast_utils.dart';

class NetworkController extends getx.GetxController {
  late Dio _client;
  final _isOffline = false.obs;
  final _cacheManager = DioCacheManager(CacheConfig());

  bool get isOffline => _isOffline.value;

  @override
  void onInit() {
    super.onInit();
    _client = _initializeDio();
    init();
  }

  void init() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _handleConnectivityResult(connectivityResult);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      _handleConnectivityResult(connectivityResult);
    });
  }

  void _handleConnectivityResult(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      _isOffline.value = true;
      showToast(
          title: "Offline",
          message: "Your network is unavailable. Some features will not work properly.",
          snackBarVariant: SnackBarVariant.error);
    } else {
      _isOffline.value = false;
    }
  }

  _initializeDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: "www.google.com",
      receiveDataWhenStatusError: true,
      connectTimeout: 8000,
      receiveTimeout: 8000,
    ));
    dio.interceptors.add(Interceptors());
    dio.interceptors.add(_cacheManager.interceptor);
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: const [
        Duration(milliseconds: 500),
        Duration(milliseconds: 1000),
        Duration(milliseconds: 2000),
      ],
    ));

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }

    return dio;
  }

  Future<dynamic> get({required String url, Map<String, dynamic>? queryParameters, bool useCache = true}) async {
    try {
      return await _client
          .get(
            url,
            queryParameters: queryParameters,
            options: useCache ? buildCacheOptions(const Duration(days: 0), maxStale: const Duration(days: 28)) : null,
          )
          .then((response) => response.data);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> post({required String url, dynamic body}) async {
    try {
      return await _client
          .post(
            url,
            data: body ?? {},
            options: buildCacheOptions(const Duration(days: 0), maxStale: const Duration(days: 28)),
          )
          .then((response) => response.data);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> patch({required String url, dynamic body}) async {
    try {
      return await _client
          .patch(
            url,
            data: body,
            options: buildCacheOptions(const Duration(days: 0), maxStale: const Duration(days: 28)),
          )
          .then((response) => response.data);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> put({required String url, dynamic body}) async {
    try {
      return await _client
          .put(
            url,
            data: body,
            options: buildCacheOptions(const Duration(days: 0), maxStale: const Duration(days: 28)),
          )
          .then((response) => response.data);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> delete({required String url, dynamic body}) async {
    try {
      return await _client
          .delete(
            url,
            data: body,
            options: buildCacheOptions(const Duration(days: 0), maxStale: const Duration(days: 28)),
          )
          .then((response) => response.data);
    } catch (e) {
      return e;
    }
  }

  void clearCache() {
    _cacheManager.clearAll();
  }
}

class Interceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? authToken = await auth.FirebaseAuth.instance.currentUser?.getIdToken();
    if (authToken != null) {
      options.headers["Authorization"] = "Bearer $authToken";
      if (kDebugMode) {
        print(authToken);
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handleError(err);
    return super.onError(err, handler);
  }

  @override
  Future<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }
}
