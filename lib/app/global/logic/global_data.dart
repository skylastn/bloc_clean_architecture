import 'package:kiosk_bo/app/global/logic/local_session.dart';
import 'package:kiosk_bo/main.dart';

class GlobalLogic {
  LocalSession localCtrl = inject.get<LocalSession>();
  String fcmToken = '';

  GlobalLogic() {
    initFirstTime();
  }

  Future<void> initFirstTime() async {
    await initData();
  }

  Future<void> initData() async {
    // localCtrl.initFcmToken().then((value) => fcmToken = value);
    await Future.delayed(const Duration(seconds: 1));
    // log(Get.currentRoute);
  }
}
