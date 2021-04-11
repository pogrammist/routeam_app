import 'dart:io';

import 'package:flutter/material.dart';
import 'package:routeam_app/data/mapper/media_mapper.dart';
import 'package:routeam_app/domain/model/media.dart';

import 'request/post_media_body.dart';
import 'service/routeam_service.dart';

class ApiUtil {
  final RouteamService _routeamService;

  ApiUtil(this._routeamService);

  Future<Media> getMedia({
    @required String code,
  }) async {
    final result = await _routeamService.getMedia(code: code);
    return MediaMapper.fromApi(result);
  }

  Future<Media> postMedia(
      {@required File file,
      @required String code,
      @required int template}) async {
    final body = PostMediaBody(
      file: file,
      code: code,
      template: template,
    );
    final result = await _routeamService.postMedia(body: body);
    return MediaMapper.fromApi(result);
  }
}
