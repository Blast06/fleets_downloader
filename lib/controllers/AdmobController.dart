import 'dart:io';

import 'package:fleetsdownloader/utils/Myadmob.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:admob_flutter/admob_flutter.dart';

const TEST = false;

class AdmobController extends GetxController {
  AdmobInterstitial interstitialAd;

  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    // getInfo();
    logger.i("ADMOB CONTROLLER STARTED");
  }

  String getAdMobAppId() {
    if (Platform.isIOS) {
      return TEST ? MyAdmob.TEST_app_id_ios : MyAdmob.PROD_app_id_ios;
    } else if (Platform.isAndroid) {
      return TEST ? MyAdmob.TEST_app_id_android : MyAdmob.PROD_app_id_android;
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
      // return ;
      return TEST ? MyAdmob.TEST_banner_id_ios : MyAdmob.PROD_banner_id_ios;
    } else if (Platform.isAndroid) {
      // return ;
      return TEST
          ? MyAdmob.TEST_banner_id_android
          : MyAdmob.PROD_banner_id_android;
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isIOS) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_ios
          : MyAdmob.PROD_interstitial_id_ios;
    } else if (Platform.isAndroid) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_android
          : MyAdmob.PROD_interstitial_id_android;
    }
    return null;
  }

  loadInterstitial() {
    interstitialAd = AdmobInterstitial(
        adUnitId: getInterstitialAdId(),
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) {
            interstitialAd.load();
          }
        });

    logger.i("interstitial loading..");

    interstitialAd.load();
  }

  showInterstitial() async {
    if (await interstitialAd.isLoaded) {
      logger.i("interstitial is loaded");
      interstitialAd.show();
    }
  }
}
