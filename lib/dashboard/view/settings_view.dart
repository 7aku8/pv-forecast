import 'package:flutter/cupertino.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return const Text('settings');
  }
}
