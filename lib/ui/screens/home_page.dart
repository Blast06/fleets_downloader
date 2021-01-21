import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:fleetsdownloader/ui/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:in_app_review/in_app_review.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  AdmobInterstitial interstitialAd;
  AdMobService adMobService;

  final InAppReview _inAppReview = InAppReview.instance;
  String _appStoreId = '1547368999';
  bool _isAvailable;

  final InAppReview inAppReview = InAppReview.instance;

  final hc = Get.put(HomeController());
  var logger = Logger();

  @override
  void initState() {
    hc.checkReview();
    //inAppREVIEW CODE
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _inAppReview
    //       .isAvailable()
    //       .then(
    //         (bool isAvailable) => setState(
    //           () => _isAvailable = isAvailable && !Platform.isAndroid,
    //         ),
    //       )
    //       .catchError((_) => setState(() => _isAvailable = false));
    // });
    super.initState();
    adMobService = AdMobService();
    // FirebaseCrashlytics.instance.crash();
    interstitialAd = AdmobInterstitial(
        adUnitId: adMobService.getInterstitialAdId(),
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) {
            interstitialAd.load();
          }
        });
    // AdMobService.showHomeBannerAd();
    interstitialAd.load();
  }

  // void _setAppStoreId(String id) => _appStoreId = id;

  // Future<void> _requestReview() => _inAppReview.requestReview();

  // Future<void> _openStoreListing() => _inAppReview.openStoreListing(
  //       appStoreId: _appStoreId,
  //     );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // AdMobService.hideHomeBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   appBar: AppBar(),
        key: _drawerKey,
        drawer: const CustomDrawer(),
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      "title".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        fontFamily: "Poppins",
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Image(
                    image: AssetImage('assets/images/mobilelogin-bro.png'),
                    height: Get.height * .7,
                    width: Get.width * .7,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.none,
                      alignment: Alignment.center,
                      child: Text(
                        "hint1_homepage".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: FittedBox(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(4),
                      width: Get.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "hint2_homepage_text_field_example".tr,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<HomeController>(
                  builder: (_) => ProgressButton.icon(
                    iconedButtons: {
                      ButtonState.idle: IconedButton(
                          text: "download_btn".tr,
                          icon: Icon(Icons.download_rounded,
                              color: Colors.black26),
                          color: appThemeData.primaryColor),
                      ButtonState.loading: IconedButton(
                          text: "Loading", color: Colors.deepPurple.shade700),
                      ButtonState.fail: IconedButton(
                          text: "Failed",
                          icon: Icon(Icons.cancel, color: Colors.white),
                          color: Colors.red.shade300),
                      ButtonState.success: IconedButton(
                          text: "Success",
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          color: Colors.green.shade400)
                    },
                    onPressed: () {
                      if (_controller.text.length < 1) {
                        logger.v("lenght of text: ${_controller.text.length}");
                        _controller.clear();
                        return null;
                      }
                      hc.fleets.clear();
                      //GET THE USERS' FLEETS
                      hc.getFleets(_controller.text.trim());
                      logger.v("lenght of text: ${_controller.text}");
                      _controller.clear();
                    },
                    state: _.stateOnlyText,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 60,
              child: Center(
                child: AdmobBanner(
                  adUnitId: adMobService.getBannerAdId(),
                  adSize: AdmobBannerSize.BANNER,
                  listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
                ),
              ),
            ),
            BottomBar(),
          ],
        ));
  }
}

// String getBannerAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/2934735716';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/6300978111';
//   }
//   return null;
// }

// String getInterstitialAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/4411468910';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/1033173712';
//   }
//   return null;
// }

// String getRewardBasedVideoAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/1712485313';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/5224354917';
//   }
//   return null;
// }

// give creddit to the authors
// <a href="https://storyset.com/mobile">Illustration by Freepik Storyset</a>
