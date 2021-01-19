import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/ui/screens/about_page.dart';
import 'package:fleetsdownloader/ui/screens/home_page.dart';
import 'package:fleetsdownloader/ui/screens/information_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final gc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => CustomNavigationBar(
          iconSize: 30,
          selectedColor: Colors.black,
          strokeColor: Colors.greenAccent,
          unSelectedColor: Colors.black26,
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text('bottom_bar_home'.tr,
                  style: TextStyle(color: Colors.black)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.info),
              title: Text('bottom_bar_privacy'.tr,
                  style: TextStyle(color: Colors.black)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.info),
              title: Text(
                'bottom_bar_about'.tr,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          currentIndex: gc.currentIndex,
          onTap: (index) {
            gc.changeCurrentIndex(index);
            switch (index) {
              case 0:
                Get.to(HomePage(), transition: Transition.cupertino);
                break;
              case 1:
                Get.to(InformationPage(), transition: Transition.cupertino);
                break;
              case 2:
                Get.to(AboutPage(), transition: Transition.cupertino);
                break;
              default:
                Get.to(HomePage(), transition: Transition.zoom);
                break;
            }
          }),
    );
  }
}
