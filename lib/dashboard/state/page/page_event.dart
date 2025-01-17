part of 'page_bloc.dart';

sealed class PageEvent extends Equatable {
  const PageEvent();
}

enum InitiatedBy { bottomNav, swipe }

final class SelectPage extends PageEvent {
  const SelectPage(this.pageIndex, this.initiatedBy);

  final int pageIndex;
  final InitiatedBy initiatedBy;

  @override
  List<Object> get props => [pageIndex];
}
