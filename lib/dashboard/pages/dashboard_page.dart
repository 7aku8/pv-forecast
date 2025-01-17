import 'package:flutter/material.dart';
import 'package:pv_forecast/components/top_bar.dart';
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
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
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
      body: PageView(
        controller: _pageViewController,
        onPageChanged: _handlePageViewChanged,
        children: _pages,
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
