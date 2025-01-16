import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pv_forecast/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<IconData> navbarIcons = [
    Icons.home,
    Icons.bar_chart,
    Icons.wb_sunny,
    Icons.notifications,
    Icons.settings,
  ];

  List widgets = <Widget>[
    Center(child: Text('Home', style: boldTextStyle(size: 24))),
    Center(child: Text('Dashboard', style: boldTextStyle(size: 24))),
    Center(child: Text('Live data', style: boldTextStyle(size: 24))),
    Center(child: Text('Alerts', style: boldTextStyle(size: 24))),
    Center(child: Text('Settings', style: boldTextStyle(size: 24))),
  ];

  List<String> bottomNavigationName = [
    'Home',
    'Search',
    'Gallery',
    'Favorite',
    'Profile',
  ];

  List<Color> color = [
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.green,
  ];

  List<Color> colorShade = [
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, left: 12, right: 12, top: 8),
      height: 70,
      decoration: boxDecorationDefault(
        borderRadius: radius(0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navbarIcons.map(
          (e) {
            final i = navbarIcons.indexOf(e);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(8),
              height: 45,
              decoration: BoxDecoration(
                color: i == selectedIndex ? colorShade[i] : backgroundColor,
                borderRadius: radius(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    e,
                    size: 30,
                    color: i == selectedIndex ? color[i] : Colors.blueGrey[300],
                  ).onTap(
                    () {
                      selectedIndex = i;
                      setState(() {});
                    },
                    splashColor: context.cardColor,
                  ),
                  Text(
                    bottomNavigationName[i],
                    style: boldTextStyle(color: color[i]),
                  ).paddingSymmetric(horizontal: 4).visible(i == selectedIndex),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
