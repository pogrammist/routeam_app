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
}
