import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  String appBarName = '';

  AppBarWidget({required this.appBarName, super.key});

  @override
  Widget build(BuildContext context) {
       return AppBar(
      title:  Text(appBarName),
      backgroundColor: Colors.green,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon:  const Icon(
              Icons.menu,
              size: 22, // Changing Drawer Icon Size
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }
}
