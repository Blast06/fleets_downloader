import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger/logger.dart';

class FleetController extends GetxController {
  Logger logger = Logger();

  final InAppReview inAppReview = InAppReview.instance;

  @override
  void onInit() async {
    super.onInit();
    // checkReview();
    logger.i("ON INIT STARTED FleetController :D ");
  }

  checkReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      // inAppReview.openStoreListing(appStoreId: _appStoreId);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    checkReview();
  }
}
