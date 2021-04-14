import 'package:routeam_app/domain/state/loader_state.dart';

import 'repository_module.dart';

class LoaderModule {
  static LoaderState loaderState() {
    return LoaderState(
      RepositoryModule.mediaRepository(),
    );
  }
}
