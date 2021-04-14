import 'package:flutter/material.dart';
import 'package:routeam_app/data/api/model/api_media.dart';
import 'package:routeam_app/domain/model/media.dart';

class MediaMapper {
  static Media fromApi(ApiMedia media) {
    return Media(
      video: media.video,
      code: media.code,
      template: media.template,
    );
  }

  static Media fromApiOfStatusCode({
    @required String video,
    @required String code,
    int template = 1,
  }) {
    return Media(
      video: video,
      code: code,
      template: template,
    );
  }
}
