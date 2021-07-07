import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fleetsdownloader/data/models/Fleets.dart';
import 'package:fleetsdownloader/data/services/api/http_api.dart';
import 'package:fleetsdownloader/ui/screens/user_fleets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http2;

class HomeController extends GetxController {
  int currentIndex = 0;
  var logger = Logger();
  bool loadingInfo = false;
  HttpApi http = HttpApi();
  String? profile;
  List<Fleets> fleets = [];
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  double? progress;
  bool? downloading;
  var response;
  Dio dio = Dio();
  String? videoUrl;

  String _appStoreId = '1547368999';
  bool? _isAvailable;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  // Future<void> initializePlayer(String url) async {
  //   _videoPlayerController = VlcPlayerController.network(
  //     url,
  //     hwAcc: HwAcc.FULL,
  //     autoPlay: false,
  //     options: VlcPlayerOptions(),
  //   );
  // }

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
  void onInit() async {
    super.onInit();
    logger.i("ON INIT STARTED :D ");
    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  void onClose() async {
    super.onClose();
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

  //checks if review is available
  // checkReview() async {
  //   if (await inAppReview.isAvailable()) {
  //     inAppReview.requestReview();
  //   } else {
  //     inAppReview.openStoreListing(appStoreId: _appStoreId);
  //   }
  // }

  Future<void> downloadContent(String? url) async {
    bool _permissionReady = await _checkPermission();
    Directory dir = (await getApplicationDocumentsDirectory());
    String fileName = DateTime.now().toString();
    String path = '${dir.path}/$fileName';

    if (!_permissionReady) {
      _checkPermission().then((hasGranted) {
        _permissionReady = hasGranted;
      });
    } else {
      final externalDir =
          await (getExternalStorageDirectory() as Future<Directory>);
      // dio.download(url, path, onReceiveProgress: (actualbytes, totalbytes) {
      //   downloading = true;
      //   var progress2 = (actualbytes / totalbytes) * 100;
      //   logger.v(progress2.floor());
      //   if (progress2 > 99) {
      //     downloading = false;
      //     Get.snackbar(
      //         "snackbar_download_title".tr, "snackbar_download_message".tr,
      //         snackPosition: SnackPosition.BOTTOM);
      //   }
      // });

      final id = await FlutterDownloader.enqueue(
        url: url!,
        savedDir: externalDir.path,
        fileName: "fleets_${DateTime.now()}",
        showNotification: true,
        openFileFromNotification: true,
      );

      Get.snackbar("snackbar_download_title".tr, "snackbar_download_message".tr,
          snackPosition: SnackPosition.BOTTOM);
    }
    update();
  }

  Future<bool> _checkPermission() async {
    // PermissionStatus permission = await PermissionHandler()
    //     .checkPermissionStatus(PermissionGroup.storage);
    // if (permission != PermissionStatus.granted) {
    //   Map<PermissionGroup, PermissionStatus> permissions =
    //       await PermissionHandler()
    //           .requestPermissions([PermissionGroup.storage]);
    //   if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
    //     return true;
    //   }
    // } else {
    //   return true;
    // }

    // return false;

    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      if (await Permission.storage.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        logger.v("Permission granted");
        return true;
      }
      return true;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }

    return true;
  }

  void downloadingCallback(
      String id, DownloadTaskStatus status, int progress) {}
}
