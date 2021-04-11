import 'dart:io';

import 'package:meta/meta.dart';
import 'package:routeam_app/domain/model/media.dart';

abstract class MediaRepository {
  Future<Media> getMedia({
    @required String code,
  });

  Future<Media> postMedia({
    @required File file,
    @required String code,
    @required int template,
  });
}
