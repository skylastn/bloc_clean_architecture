import '../../../../main.dart';
import '../../infrastructure/repository/marketplace_repository.dart';

class DashboardBinding {
  static void init() {
    inject.registerLazySingleton(() => MarketplaceRepository());
  }

  static void dispose() {
    inject.unregister<MarketplaceRepository>();
  }
}
