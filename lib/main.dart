import 'package:admob_flutter/admob_flutter.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fleetsdownloader/controllers/AdmobController.dart';
//import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:fleetsdownloader/ui/screens/home_page.dart';
import 'package:fleetsdownloader/ui/screens/splash_screen_page.dart';
import 'package:fleetsdownloader/utils/Myadmob.dart';
import 'package:fleetsdownloader/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

//import 'package:device_preview/device_preview.dart';

//THIS IS TO ENABLE DEVICE PREVIEW
// void main() => runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  
  await MobileAds.initialize(
    bannerAdUnitId: MyAdmob.getBannerAdId(),
    interstitialAdUnitId: MyAdmob.getInterstitialAdId(),
    appOpenAdUnitId: MyAdmob.getOpenAdId(),
  );

  
  await MobileAds.requestTrackingAuthorization();
  // RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("34FEAA5868007783EAE019607349D798"))
  MobileAds.setTestDeviceIds(['34FEAA5868007783EAE019607349D798']);
  Get.put(AdmobController());
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // Admob.requestTrackingAuthorization();
  //
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.greenAccent,
  // ));
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
      home: SplashPage(),
      locale: Get.deviceLocale,
      translations: MyTransalations(),
    );
  }
}
