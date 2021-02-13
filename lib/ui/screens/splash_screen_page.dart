import 'package:fleetsdownloader/controllers/SplashController.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final sp = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: appThemeData.primaryColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text('loading_txt'.tr)
          ],
        ),
      ),
    );
  }
}
