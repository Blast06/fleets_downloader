import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fleetsdownloader/data/models/Fleets.dart';
import 'package:fleetsdownloader/data/services/admob_service.dart';
import 'package:fleetsdownloader/data/services/api/http_api.dart';
import 'package:fleetsdownloader/ui/screens/user_fleets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  var logger = Logger();
  bool loadingInfo = false;
  HttpApi http = HttpApi();
  String profile;
  List<Fleets> fleets = [];
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  var response;
  Dio dio = Dio();

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  Future<void> changeBtnStateToLoading() async {
    stateOnlyText = ButtonState.loading;
    loadingInfo = true;
    update();
  }

  Future<void> changeBtnStateToNormal() async {
    stateOnlyText = ButtonState.idle;
    loadingInfo = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    logger.i("ON INIT STARTED :D ");
  }

  @override
  void onClose() {
    super.onClose();
    AdMobService.hideHomeBannerAd();
  }

  getFleets(String profile) async {
    await changeBtnStateToLoading();

    //check if 404 for the user or gets the fleets
    final response = await http.getInfo(profile);
    if (response != 404) {
      fleets.clear();
      fleets.addAll(response);
      Get.to(
        UserFleets(
          userFleet: profile,
        ),
      );
    } else {
      Get.defaultDialog(
        title: 'user_not_found'.tr,
        confirm: Icon(Icons.not_interested),
        middleText: '',
      );
    }
    await changeBtnStateToNormal();

    update();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
