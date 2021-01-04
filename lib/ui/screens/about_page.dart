import 'package:fleetsdownloader/controllers/AboutController.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  final controller = Get.put(AboutController());
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AboutController>(
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
                        : MarkdownBody(data: _.abouts[0].description),
                  ),
                ),
              ),
            ),
            // headerWidget(
            //     context, appThemeData.primaryColor, _drawerKey, 'About')
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
