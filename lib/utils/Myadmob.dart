import 'dart:io';

import 'package:logger/logger.dart';



const TEST = true;

class MyAdmob {
  //TEST
  static final String TEST_app_id_ios =
      'ca-app-pub-2334510780816542~6726672523';
  static final String TEST_app_id_android =
      'ca-app-pub-2334510780816542~7385148076';
  static final String TEST_banner_id_ios =
      'ca-app-pub-3940256099942544/2934735716';
  static final String TEST_banner_id_android =
      'ca-app-pub-3940256099942544/6300978111';
  static final String TEST_interstitial_id_ios =
      'ca-app-pub-3940256099942544/4411468910';
  static final String TEST_interstitial_id_android =
      'ca-app-pub-3940256099942544/1033173712';

  static final String TEST_open_ad_id_android =
      'ca-app-pub-3940256099942544/3419835294';
  static final String TEST_open_ad_id_ios =
      'ca-app-pub-3940256099942544/3419835294';

  //PROD
  static final String PROD_app_id_ios =
      'ca-app-pub-4473546092325949~4388446117';
  static final String PROD_app_id_android =
      'ca-app-pub-4473546092325949~7375288910';
  static final String PROD_banner_id_ios =
      'ca-app-pub-4473546092325949/1418119107';
  static final String PROD_banner_id_android =
      'ca-app-pub-4473546092325949/4749125570';
  static final String PROD_interstitial_id_ios =
      'ca-app-pub-4473546092325949/5977496040';
  static final String PROD_interstitial_id_android =
      'ca-app-pub-4473546092325949/7977432875';
  static final String PROD_open_ad_id_android =
      'ca-app-pub-4473546092325949/4567293527';
  static final String PROD_open_ad_id_ios =
      'ca-app-pub-4473546092325949/3067270360';

  static String getAppName() {
    if (Platform.isAndroid) {
      return 'NicknameS for FF';
    } else {
      return 'NicknameS for FF';
    }
  }


  static String getAdMobAppId() {
    if (Platform.isIOS) {
      return TEST ? MyAdmob.TEST_app_id_ios : MyAdmob.PROD_app_id_ios;
    } else if (Platform.isAndroid) {
      return TEST ? MyAdmob.TEST_app_id_android : MyAdmob.PROD_app_id_android;
    }
  }

  static String getBannerAdId() {
    if (Platform.isIOS) {
      // return ;
      return TEST ? MyAdmob.TEST_banner_id_ios : MyAdmob.PROD_banner_id_ios;
    } else if (Platform.isAndroid) {
      // return ;
      return TEST
          ? MyAdmob.TEST_banner_id_android
          : MyAdmob.PROD_banner_id_android;
    }
    return 'null';
  }

  static String getInterstitialAdId() {
    if (Platform.isIOS) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_ios
          : MyAdmob.PROD_interstitial_id_ios;
    } else if (Platform.isAndroid) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_android
          : MyAdmob.PROD_interstitial_id_android;
    }
    return 'null';
  }

 static String getOpenAdId() {
    if (Platform.isIOS) {
      return TEST
          ? MyAdmob.TEST_open_ad_id_ios
          : MyAdmob.PROD_open_ad_id_ios;
    } else if (Platform.isAndroid) {
      print(" ✔ ❤ => THIS IS ADMOB FOR ANDROID");
      return TEST
          ?  MyAdmob.TEST_open_ad_id_android
          :  MyAdmob.PROD_open_ad_id_android;

    }

    
    
  }
}
