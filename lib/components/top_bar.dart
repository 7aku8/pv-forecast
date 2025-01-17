import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_forecast/components/top_bars/alerts_top_bar.dart';
import 'package:pv_forecast/components/top_bars/forecast_top_bar.dart';
import 'package:pv_forecast/components/top_bars/history_top_bar.dart';
import 'package:pv_forecast/components/top_bars/home_top_bar.dart';
import 'package:pv_forecast/components/top_bars/settings_top_bar.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _TopBarState extends State<TopBar> {
  final _bars = [
    const HomeTopBar(),
    const ForecastTopBar(),
    const HistoryTopBar(),
    const AlertsTopBar(),
    const SettingsTopBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) {
          if (state is PageSelected) {
            return _bars[state.selectedPage];
          }

          return const SizedBox();
        },
      ),
    );
  }
}
