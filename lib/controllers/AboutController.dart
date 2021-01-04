import 'package:fleetsdownloader/data/models/About.dart';
import 'package:fleetsdownloader/data/services/api/http_api.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AboutController extends GetxController {
  final HttpApi api = HttpApi();
  List<About> abouts = [];
  RxBool isShowingShimmer = true.obs;

  // RxBool get showShimmer => _isShowingShimmer;
  // set showShimmer(bool value) => _isShowingShimmer = value.obs;

  @override
  void onInit() {
    super.onInit();
    getInfo();
  }

  getInfo() async {
    isShowingShimmer = true.obs;
    abouts = await api.getAboutInformation();
    isShowingShimmer = false.obs;
    update();
  }
}
