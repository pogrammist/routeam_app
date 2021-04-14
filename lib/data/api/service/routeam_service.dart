import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:routeam_app/data/api/model/api_media.dart';
import 'package:routeam_app/data/api/request/post_media_body.dart';

class RouteamService {
  static const _BASE_URL = 'https://dev.gift.routeam.ru/';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiMedia> getMedia({
    @required String code,
  }) async {
    final response = await _dio.get('/api/$code');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return ApiMedia.fromApi(response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<ApiMedia> postMedia({@required PostMediaBody body}) async {
    final formData = body.toApi();
    final response = await _dio.post(
      '/api',
      data: formData,
    );
    return ApiMedia.fromApi(response.data);
  }
}
