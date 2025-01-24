import 'package:flutter/material.dart';
import 'package:pv_forecast/app/app.dart';
import 'package:pv_forecast/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
