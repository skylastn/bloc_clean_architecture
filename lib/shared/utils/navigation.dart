import 'package:go_router/go_router.dart';
import '../../app/global/model/route_model.dart';
import '../../main.dart';

class Navigation {
  static Future<void> back(RouteModel? routeModel) async {
    if (routeModel?.pageName == null) {
      return inject<GoRouter>().pop();
    }
    // bool isPageExist = false;

    // for (Route action in NavigationHistoryObserver().history) {
    //   Get.log('run test ${action.settings.name} - ${routeModel?.pageName}');
    //   if (action.settings.name == null) {
    //     break;
    //   }
    //   if (action.settings.name!.contains(routeModel?.pageName ?? '')) {
    //     isPageExist = true;
    //     break;
    //   }
    // }
    // if (isPageExist) {
    //   Get.log('Run Here');
    //   try {
    //     return Get.until((value) {
    //       Get.log(
    //         'run until : ${Get.currentRoute} == ${routeModel?.pageName} (${Get.currentRoute == routeModel?.pageName})',
    //       );
    //       return Get.currentRoute == routeModel?.pageName;
    //     });
    //   } catch (e) {
    //     Get.log('Error Until : $e');
    //   }
    //   return;
    // }
    // Get.log('Run Here');
    await inject<GoRouter>().pushReplacementNamed(
      routeModel?.pageName ?? '',
      queryParameters: routeModel?.params ?? {},
    );
  }
}
