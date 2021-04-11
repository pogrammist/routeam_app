import 'package:routeam_app/data/api/api_util.dart';
import 'package:routeam_app/data/api/service/routeam_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(RouteamService());
    }
    return _apiUtil;
  }
}
