import 'dart:io';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:routeam_app/data/mapper/media_mapper.dart';
import 'package:routeam_app/domain/model/media.dart';

import 'request/post_media_body.dart';
import 'service/routeam_service.dart';

class ApiUtil {
  static const _BASE_URL = 'https://dev.gift.routeam.ru/video/';

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
    final int statusCode = await _routeamService.postMedia(body: body);
    final String video =
        _BASE_URL + code + _currentDay() + extension(file.path);
    return statusCode == 200
        ? MediaMapper.fromApiOfStatusCode(video: video, code: code)
        : null;
  }

  String _currentDay() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('_dd_MM_yyyy');
    return formatter.format(now);
  }
}
