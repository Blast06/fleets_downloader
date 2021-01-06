import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:fleetsdownloader/ui/screens/home_page.dart';
import 'package:fleetsdownloader/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';

// void main() => runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  // Admob.initialize();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Locale myLocale;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      locale: Get.deviceLocale,
      translations: MyTransalations(),
    );
  }
}
