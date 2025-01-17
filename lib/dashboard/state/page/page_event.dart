part of 'page_bloc.dart';

sealed class PageEvent extends Equatable {
  const PageEvent();
}

final class SelectPage extends PageEvent {
  const SelectPage(this.pageIndex);

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}