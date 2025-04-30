import 'dart:io';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../firebase_options.dart';
import '../shared/notif/local_notification.dart';

// import 'notification_services.dart';

class FirebaseTraits {
  Future<void> init() async {
    /// Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
      return;
    }
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // lazyPut(() => GlobalVariables());
  // await LocalNotification().init();
  if (kDebugMode) {
    print('Handling a background message ${message.toMap()}');
  }

  LocalNotification().showNotification(message);
}
