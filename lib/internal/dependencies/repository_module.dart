import 'package:routeam_app/data/repository/media_data_repository.dart';
import 'package:routeam_app/domain/repository/media_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static MediaRepository _mediaRepository;

  static MediaRepository mediaRepository() {
    if (_mediaRepository == null) {
      _mediaRepository = MediaDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _mediaRepository;
  }
}
