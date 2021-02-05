import 'dart:io';

import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:fleetsdownloader/ui/widgets/chew_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:video_player/video_player.dart';

class UserFleets extends StatefulWidget {
  final String userFleet;
  const UserFleets({Key key, @required this.userFleet}) : super(key: key);

  @override
  _UserFleetsState createState() => _UserFleetsState();
}

class _UserFleetsState extends State<UserFleets> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userFleet),
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
                    child: GridView.count(
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 10.0,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(
                        _.fleets[0].data.length,
                        (index) {
                          return _.fleets[0].data[index].type == 'video'
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                          child: Container(
                                              // decoration: BoxDecoration(
                                              //   image: DecorationImage(
                                              //     image: NetworkImage(_
                                              //         .fleets[0].data[index].url),
                                              //     fit: BoxFit.cover,
                                              //   ),
                                              //   borderRadius: BorderRadius.all(
                                              //     Radius.circular(20.0),
                                              //   ),
                                              // ),
                                              child: ChewieListItem(
                                            videoPlayerController:
                                                VideoPlayerController.network(
                                              _.fleets[0].data[index].url,
                                            ),
                                            looping: true,
                                          )),
                                          onTap: () {
                                            _.launchURL(
                                                _.fleets[0].data[index].url);
                                            print("descargar");
                                          }),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Icon(Icons.cloud_download,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(_.fleets[0]
                                                    .data[index].preview),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            _.downloadContent(
                                                _.fleets[0].data[index].url);
                                          }),
                                      _.downloading == true
                                          ? Align(
                                              alignment: Alignment.bottomRight,
                                              child: CircularProgressIndicator(
                                                value: _.progress,
                                              ),
                                            )
                                          : Align(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(
                                                Icons.cloud_download,
                                                color:
                                                    appThemeData.primaryColor,
                                                size: 40,
                                              ),
                                            ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
          ],
        )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
