import 'package:flutter/material.dart';

Widget headerWidget(BuildContext context, Color primary,
    GlobalKey<ScaffoldState> drawerKey, String headerTxt) {
  return Container(
    height: 120,
    width: double.infinity,
    decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              drawerKey.currentState!.openDrawer();
//              print(status);
//              status = status == FSBStatus.FSB_OPEN ? FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          Text(
            headerTxt,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            width: 40,
          )
          //TODO: Crear menuDrawer para hacer los filtros complejos
//          IconButton(
//            onPressed: () {
////              endDrawerKey.currentState.openEndDrawer();
//            },
//            icon: Icon(
//              Icons.filter_list,
//              color: Colors.white,
//            ),
//          ),
        ],
      ),
    ),
  );
}
