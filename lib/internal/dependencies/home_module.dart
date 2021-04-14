import 'package:routeam_app/domain/state/home_state.dart';

import 'repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.mediaRepository(),
    );
  }
}
