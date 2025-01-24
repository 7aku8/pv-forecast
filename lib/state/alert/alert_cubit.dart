import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pv_forecast/state/alert/alert_type.dart';

part 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  AlertCubit() : super(NoAlertTriggered()) {
    _startRandomTimer();
  }

  late Timer _timer;

  void _startRandomTimer() {
    _scheduleNextAlert();
  }

  void _scheduleNextAlert() {
    final random = Random();
    final randomSeconds =
        random.nextInt(31) + 10;

    _timer = Timer(Duration(seconds: randomSeconds), () async {
      await _triggerAlert();
      _scheduleNextAlert(); // Schedule the next alert
    });
  }

  Future<void> _triggerAlert() async {
    final random = Random();
    emit(
      AlertTriggered(
        AlertType.values[random.nextInt(AlertType.values.length)],
      ),
    );
  }

  @override
  Future<void> close() {
    _timer.cancel(); // Cancel the timer when the cubit is closed
    return super.close();
  }
}
