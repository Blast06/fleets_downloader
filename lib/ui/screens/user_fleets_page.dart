import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:fleetsdownloader/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFleets extends StatelessWidget {
  final String userFleet;
  const UserFleets({Key key, @required this.userFleet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userFleet),
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
                        _.fleets?.length,
                        (index) {
                          return _.fleets[index].preview == null
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  _.fleets[index].url),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        onTap: () =>
                                            _.launchURL(_.fleets[index].url),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Icon(Icons.cloud_download,
                                            color: Colors.white),
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
                                              image: NetworkImage(
                                                  _.fleets[index].preview),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        onTap: () =>
                                            _.launchURL(_.fleets[index].url),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.cloud_download,
                                          color: Colors.white,
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
