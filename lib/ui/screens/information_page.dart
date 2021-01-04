import 'package:fleetsdownloader/controllers/InformationController.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends StatelessWidget {
  final controller = Get.put(InformationController());
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InformationController>(
        builder: (_) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 140),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: controller.isShowingShimmer.value
                        ? const CircularProgressIndicator()
                        : MarkdownBody(data: _.infos[0].description),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: Get.height * 0.10,
            //   // top: Get.height,
            //   // left: Get.width * .30,
            //   child: BottomBar(),
            // ),
            // headerWidget(context, appThemeData.primaryColor, _drawerKey,
            //     'Privacy Policy'),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
