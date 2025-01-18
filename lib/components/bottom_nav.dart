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
        borderRadius: BorderRadius.circular(38),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 76,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(38),
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
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    bottom: 0,
                    left: selectedIndex *
                        ((MediaQuery.of(context).size.width - 36) /
                            5), // 32 is padding, 4 is border
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 32) / 5,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  Row(
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
                            child: Container(
                              padding: const EdgeInsets.all(23),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
