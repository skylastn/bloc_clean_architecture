import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kiosk_bo/app/global/logic/local_session.dart';
import '../../app/global/model/response/notification_response.dart';
import '../../main.dart';

class LocalNotification {
  Future<void> init() async {
    log('test : ${dotenv.env['VAPID_KEY']}');
    FirebaseMessaging.instance
        .getToken(vapidKey: kIsWeb ? dotenv.env['VAPID_KEY'] : null)
        .then((value) {
          if (kDebugMode) {
            print('Firebase Token : $value');
          }
          inject.get<LocalSession>().setDeviceToken(value ?? '');
        });
    await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/ic_launcher',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: kDebugMode,
    );
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction action) async {
        if (kDebugMode) {
          print('onActionReceivedMethod : ${action.toMap()}');
        }
      },
      onNotificationCreatedMethod: (ReceivedNotification action) async {
        if (kDebugMode) {
          print('onNotificationCreatedMethod : ${action.toMap()}');
        }
      },
      onNotificationDisplayedMethod: (ReceivedNotification action) async {
        if (kDebugMode) {
          print('onNotificationDisplayedMethod : ${action.toMap()}');
        }
      },
      onDismissActionReceivedMethod: (ReceivedAction action) async {
        if (kDebugMode) {
          print('onDismissActionReceivedMethod : ${action.toMap()}');
        }
      },
    );

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (kDebugMode) {
        print('getInitialMessage : ${jsonEncode(message?.toMap())}');
      }
      showNotification(message);
      notificationHandler(message);
    });

    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print('onMessage : ${jsonEncode(message.toMap())}');
      }
      showNotification(message);
      notificationHandler(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('onMessageOpenedApp : ${jsonEncode(message.toMap())}');
      }
      showNotification(message);
      notificationHandler(message);
    });
    await initSubscribtionToTopic();
  }

  void notificationHandler(RemoteMessage? value) {
    if (value == null) {
      return;
    }
    var content = NotificationResponse.fromMap(value.data);
    switch (content.type) {
      case NotificationResponseType.order:
        // if (inject.isRegistered<TrackingOrderCubit>()) {
        //   inject.get<TrackingOrderCubit>().fetchOrder();
        // }
        break;
      case NotificationResponseType.transaction:
        if (content.status == NotificationResponseStatus.paid) {
          // inject<GoRouter>().pushNamed(
          //   TrackingOrderPage.routeName,
          //   queryParameters: {
          //     'code': content.code,
          //   },
          // );
          // inject.get<CartBloc>().add(CartResetEvent());
          // inject.get<CartCubit>().resetCart();
        }
        break;
      default:
    }
  }

  Future<void> initSubscribtionToTopic() async {
    String userId = await inject.get<LocalSession>().userId ?? '';
    if (!kIsWeb && userId.isNotEmpty) {
      FirebaseMessaging.instance.subscribeToTopic(userId);
    }
  }

  Future<void> unSubscribeTopic() async {
    String userId = await inject.get<LocalSession>().userId ?? '';
    if (!kIsWeb && userId.isNotEmpty) {
      FirebaseMessaging.instance.unsubscribeFromTopic(userId);
    }
  }

  void showNotification(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    createNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> createNotification({
    required String title,
    required String body,
    String? type,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        actionType: ActionType.Default,
        title: title,
        body: body,
      ),
    );
  }
}
