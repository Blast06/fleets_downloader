import 'package:fleetsdownloader/controllers/HomeController.dart';
import 'package:fleetsdownloader/ui/screens/about_page.dart';
import 'package:fleetsdownloader/ui/screens/home_page.dart';
import 'package:fleetsdownloader/ui/screens/information_page.dart';
import 'package:fleetsdownloader/ui/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final gc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: appThemeData.primaryColor,
              //image: DecorationImage(
              //  image: NetworkImage(
              //        'https://picsum.photos/800/600'), //TODO: add Dinamic image here and png
              //fit: BoxFit.cover),
            ),
            child: Container(),
          ),
          ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              title: const Text('Home'),
              onTap: () {
                gc.changeCurrentIndex(0);
                Get.to(HomePage(), transition: Transition.zoom);
              }),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.blueGrey,
            ),
            title: const Text('Privacy Policy'),
            onTap: () {
              gc.changeCurrentIndex(2);
              Get.to(InformationPage());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.blueGrey,
            ),
            title: const Text('About'),
            onTap: () {
              gc.changeCurrentIndex(3);
              Get.to(AboutPage());
            },
          ),
        ],
      ),
    );
  }
}
