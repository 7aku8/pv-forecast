part of 'page_bloc.dart';

sealed class PageState extends Equatable {
  const PageState();
}

final class PageSelected extends PageState {
  const PageSelected(this.selectedPage, this.initiatedBy);

  final int selectedPage;
  final InitiatedBy initiatedBy;

  @override
  List<Object> get props => [selectedPage, initiatedBy];
}
