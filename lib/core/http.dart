import 'package:dio/dio.dart';

final http = Dio();

void setupHttpClient() {
  http.options.baseUrl = 'https://api.themoviedb.org/3/';
  http.options.headers['Content-Type'] = 'application/json';
  http.options.headers['Accept'] = 'application/json';

  http.interceptors.add(_TokenInterceptor());
}

class _TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGNkNjQ5NmUyMDk4ZjY3ZTZlMzA3ZTE5NTVkNzRkNiIsInN1YiI6IjY0NzhiMDdiMTc0OTczMDBmYjM5ODdhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lUd_hQb5HhpEEi5bDU4Gs3-IxryGbjt-zXiXZl2kK-M';
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    return handler.next(options);
  }
}
