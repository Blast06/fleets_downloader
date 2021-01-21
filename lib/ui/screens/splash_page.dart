import 'package:admob_flutter/admob_flutter.dart';
import 'package:fleetsdownloader/controllers/SplashController.dart';
import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final sc = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Container();
      },
    );
  }
}
