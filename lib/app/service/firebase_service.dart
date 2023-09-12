import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/config/firebase_options.dart';
import 'package:whoever/app/common/util/util.dart';

class FirebaseService extends GetxService {
  final title = ''.obs;
  final body = ''.obs;
  Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      name: 'Whoever',
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await getToken();
    await onRequestPermission();

    // 2. Notification Stream
    onMessageListen();

    // 3. Background Message Stream
    onDataMessageListen();
    // RemoteMessage? initMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // Log(initMessage);
    // if (initMessage != null) {
    //   _handleMessage(initMessage);
    // }
    return this;
  }

  // 1. 토큰 가져오기
  static Future<String?> getToken() async {
    // await Firebase
    final token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  // 2. NOTIFICATION 유형의 메시지 처리
  /**
    {
      "message":{
        "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
        "notification":{
          "title":"Portugal vs. Denmark",
          "body":"great match!"
        }
      }
    }
  */
  void onMessageListen() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        title.value = message.notification!.title!;
        body.value = message.notification!.body!;
      }

      if (message.data.isNotEmpty) {
        Log(message.data["body"]);
      }
    });
  }

  // 3. 데이터 메세지 처리
  /** 
    {
    "message":{
      "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
      "data":{
        "Nick" : "Mario",
        "body" : "great match!",
        "Room" : "PortugalVSDenmark"
      }
    }
  */
  void onDataMessageListen() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        Log(message.data["body"]);
      }
    });
  }

  // 알림 허용 / 허용안함
  Future onRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: false,
      provisional: false,
    );
  }
}
