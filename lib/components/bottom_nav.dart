import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<IconData> navbarIcons = [
    Icons.home_outlined,
    Icons.wb_sunny_outlined,
    Icons.history_outlined,
    Icons.notifications_outlined,
    Icons.settings_outlined,
  ];

  List widgets = <Widget>[
    Center(child: Text('Home', style: boldTextStyle(size: 24))),
    Center(child: Text('Forecast', style: boldTextStyle(size: 24))),
    Center(child: Text('History', style: boldTextStyle(size: 24))),
    Center(child: Text('Alerts', style: boldTextStyle(size: 24))),
    Center(child: Text('Settings', style: boldTextStyle(size: 24))),
  ];

  List<String> bottomNavigationName = [
    'Home',
    'Forecast',
    'History',
    'Alerts',
    'Settings',
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    final pageState = context.read<PageBloc>().state;

    if (pageState is PageSelected) {
      selectedIndex = pageState.selectedPage - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: BlocListener(
              bloc: context.read<PageBloc>(),
              listener: (context, state) {
                if (state is PageSelected &&
                    state.initiatedBy == InitiatedBy.swipe) {
                  setState(() {
                    selectedIndex = state.selectedPage;
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: navbarIcons.map(
                  (e) {
                    final i = navbarIcons.indexOf(e);
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(
                                SelectPage(
                                  i,
                                  InitiatedBy.bottomNav,
                                ),
                              );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.all(23),
                          decoration: i == selectedIndex
                              ? BoxDecoration(
                                  color: Colors.orangeAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(45),
                                )
                              : BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                          child: Icon(
                            e,
                            size: 26,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
