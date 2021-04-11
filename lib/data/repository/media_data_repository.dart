import 'dart:io';

import 'package:routeam_app/data/api/api_util.dart';
import 'package:routeam_app/domain/model/media.dart';
import 'package:routeam_app/domain/repository/media_repository.dart';

class MediaDataRepository extends MediaRepository {
  final ApiUtil _apiUtil;

  MediaDataRepository(this._apiUtil);

  @override
  Future<Media> getMedia({String code}) {
    return _apiUtil.getMedia(code: code);
  }

  @override
  Future<Media> postMedia({File file, String code, int template}) {
    return _apiUtil.postMedia(
      file: file,
      code: code,
      template: template,
    );
  }
}
