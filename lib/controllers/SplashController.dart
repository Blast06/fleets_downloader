import 'package:fleetsdownloader/ui/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'AdmobController.dart';

class SplashController extends GetxController {
  final admob = Get.find<AdmobController>();
  Logger log = Logger();

  bool showInterstitial = false;
  @override
  void onReady() async {
    log.i("onReady of splash controller");
    await prepareApi();
    super.onReady();
    await Future.delayed(Duration(seconds: 2), () {
      admob.showInterstitial();
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

  void onInit() async {
    super.onInit();
    log.i("Init of splash controller");
    // await prepareApi();
    await admob.loadInterstitial();
  }

  prepareApi() async {
    final response = await http.get(
      'https://twitter-fleets.herokuapp.com/',
    );
  }
}
