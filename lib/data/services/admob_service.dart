import 'dart:io';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

// REAL ADS
// android
// ca-app-pub-4473546092325949~7375288910
// ca-app-pub-4473546092325949/4749125570
// ios
// ca-app-pub-4473546092325949~1931390541
// ca-app-pub-4473546092325949/4105309502

// TEST ADS
// ios
// ca-app-pub-2334510780816542~6726672523

// android
// ca-app-pub-2334510780816542~7385148076
// banners:
// ios
// ca-app-pub-3940256099942544/2934735716
// android
// ca-app-pub-3940256099942544/6300978111

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-4473546092325949~1931390541';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-4473546092325949~7375288910';
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
      // return 'ca-app-pub-2334510780816542/6833456062';
      return 'ca-app-pub-4473546092325949/4105309502';
    } else if (Platform.isAndroid) {
      // return 'ca-app-pub-2334510780816542/2993163849';
      return "ca-app-pub-4473546092325949/4749125570";
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isIOS) {
//      return '';
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
//      return '';
      return "ca-app-pub-3940256099942544/1033173712";
    }
    return null;
  }

  // InterstitialAd getNewTripInterstitial() {
  //   return InterstitialAd(
  //     adUnitId: getInterstitialAdId(),
  //     listener: (MobileAdEvent event) {
  //       print('InterstitialAd event is $event');
  //     },
  //   );
  // }

  // static BannerAd _homeBannerAd;

  // static BannerAd _getHomePageBannerAd() {
  //   return BannerAd(
  //     adUnitId: getBannerAdId(),
  //     size: AdSize.banner,
  //   );
  // }

  // static void showHomeBannerAd() {
  //   if (_homeBannerAd == null) _homeBannerAd = _getHomePageBannerAd();
  //   _homeBannerAd
  //     ..load()
  //     ..show(anchorOffset: kBottomNavigationBarHeight);
  // }

//   static void hideHomeBannerAd() async {
//     await _homeBannerAd.dispose();
//     _homeBannerAd = null;
//   }
}
