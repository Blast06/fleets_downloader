import 'package:fleetsdownloader/data/models/Information.dart';
import 'package:fleetsdownloader/data/services/api/http_api.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class InformationController extends GetxController {
  final HttpApi api = HttpApi();
  RxBool isShowingShimmer = true.obs;

  List<Information> _infos = [];

  List<Information> get infos => _infos;

  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    getInfo();
  }

  getInfo() async {
    isShowingShimmer = true.obs;
    _infos = await api.getPolicyInformation();
    isShowingShimmer = false.obs;
    update();
  }
}
