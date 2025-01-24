part of 'alert_cubit.dart';

sealed class AlertState extends Equatable {
  const AlertState();
}

final class NoAlertTriggered extends AlertState {
  @override
  List<Object> get props => [];
}

final class AlertTriggered extends AlertState {
  const AlertTriggered(this.type);

  final AlertType type;

  @override
  List<Object> get props => [type];
}
