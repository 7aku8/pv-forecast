import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_forecast/components/bottom_nav.dart';
import 'package:pv_forecast/components/top_bar.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';
import 'package:pv_forecast/dashboard/view/alerts_view.dart';
import 'package:pv_forecast/dashboard/view/forecast_view.dart';
import 'package:pv_forecast/dashboard/view/history_view.dart';
import 'package:pv_forecast/dashboard/view/home_view.dart';
import 'package:pv_forecast/dashboard/view/settings_view.dart';
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
    HistoryView(),
    AlertsView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(),
      body: BlocListener(
        bloc: context.read<PageBloc>(),
        listener: (context, state) {
          if (state is PageSelected &&
              state.initiatedBy == InitiatedBy.bottomNav) {
            _updateCurrentPageIndex(state.selectedPage);
          }
        },
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
