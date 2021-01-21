import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  AdMobService adMobService = AdMobService();
  Logger log = Logger();
  @override
  void onReady() {
    // TODO: implement load linterstitial
    log.i("Init of splash controller");
    super.onReady();
    adMobService.loadInterstitial();
    adMobService.showInterstitial();
  }
}
