import 'dart:io';

import 'package:fleetsdownloader/controllers/FleetController.dart';
import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:fleetsdownloader/ui/widgets/chew_list_item_widget.dart';
import 'package:fleetsdownloader/ui/widgets/fleet_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserFleets extends StatefulWidget {
  final String userFleet;
  const UserFleets({Key key, @required this.userFleet}) : super(key: key);

  @override
  _UserFleetsState createState() => _UserFleetsState();
}

class _UserFleetsState extends State<UserFleets> {
  final fc = Get.put(FleetController());
  @override
  void initState() {
    super.initState();
    fc.checkReview();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userFleet,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: appThemeData.primaryColor,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) => Center(
            child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'tap_to_download'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontFamily: "Poppins",
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _.fleets.length < 1
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _.fleets[0].data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            FleetCard(
                                type: _.fleets[0].data[index].type,
                                url: _.fleets[0].data[index].url),
                            FlatButton.icon(
                              onPressed: () => _
                                  .downloadContent(_.fleets[0].data[index].url),
                              icon: Icon(Icons.file_download),
                              color: appThemeData.primaryColor,
                              label: Text('download_btn'.tr),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
