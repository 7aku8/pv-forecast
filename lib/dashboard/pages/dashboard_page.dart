import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_forecast/components/bottom_nav.dart';
import 'package:pv_forecast/components/top_bar.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';
import 'package:pv_forecast/dashboard/view/alerts_view.dart';
import 'package:pv_forecast/dashboard/view/devices_view.dart';
import 'package:pv_forecast/dashboard/view/forecast_view.dart';
import 'package:pv_forecast/dashboard/view/history_view.dart';
import 'package:pv_forecast/dashboard/view/home_view.dart';
import 'package:pv_forecast/state/alert/alert_cubit.dart';
import 'package:pv_forecast/state/alert/alert_type.dart';
import 'package:pv_forecast/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  final _pages = const [
    HomeView(),
    ForecastView(),
    DevicesView(),
    HistoryView(),
    AlertsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PageBloc, PageState>(
            listener: (context, state) {
              if (state is PageSelected &&
                  state.initiatedBy == InitiatedBy.swipe) {
                _tabController.index = state.selectedPage;
              }

              if (state is PageSelected &&
                  state.initiatedBy == InitiatedBy.bottomNav) {
                _updateCurrentPageIndex(state.selectedPage);
              }
            },
          ),
          BlocListener<AlertCubit, AlertState>(
            listener: (context, state) {
              if (state is AlertTriggered) {
                Widget content = Container();
                var color = Colors.transparent;

                if (state.type == AlertType.error) {
                  content = Row(
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Panel 3 error\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: 'Check the system for issues',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          context.read<PageBloc>().add(
                            const SelectPage(4, InitiatedBy.bottomNav),
                          );
                        },
                      ),
                    ],
                  );
                  color = Colors.redAccent.withOpacity(0.8);
                } else if (state.type == AlertType.warning) {
                  content = Row(
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bad weather conditions\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: 'Check the system for issues',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          context.read<PageBloc>().add(
                            const SelectPage(4, InitiatedBy.bottomNav),
                          );
                        },
                      ),
                    ],
                  );
                  color = Colors.orangeAccent.withOpacity(0.8);
                } else if (state.type == AlertType.info) {
                  content = Row(
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Today's Production\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: '120 kWh',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          context.read<PageBloc>().add(
                                const SelectPage(4, InitiatedBy.bottomNav),
                              );
                        },
                      ),
                    ],
                  );
                  color = Colors.blueAccent.withOpacity(0.8);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: content,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewPadding.bottom + 30,
                      right: 16,
                      left: 16,
                    ),
                    backgroundColor: color,
                  ),
                );
              }
            },
          ),
        ],
        child: Stack(
          children: [
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: _pages,
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    context.read<PageBloc>().add(
          SelectPage(
            currentPageIndex,
            InitiatedBy.swipe,
          ),
        );
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
