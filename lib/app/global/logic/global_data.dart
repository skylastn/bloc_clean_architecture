import 'package:kiosk_bo/app/global/logic/local_session.dart';
import 'package:kiosk_bo/main.dart';

class GlobalLogic {
  LocalSession localCtrl = services.get<LocalSession>();
  String fcmToken = '';

  GlobalLogic() {
    initFirstTime();
  }

  initFirstTime() async {
    await initData();
  }

  initData() async {
    localCtrl.initFcmToken().then((value) => fcmToken = value);
    await Future.delayed(const Duration(seconds: 1));
    // log(Get.currentRoute);
  }
}
