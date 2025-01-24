import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_forecast/dashboard/pages/dashboard_page.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';
import 'package:pv_forecast/l10n/l10n.dart';
import 'package:pv_forecast/state/alert/alert_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>(
            create: (context) => PageBloc(),
          ),
          BlocProvider<AlertCubit>(
            create: (context) => AlertCubit(),
          ),
        ],
        child: const DashboardPage(),
      ),
    );
  }
}
