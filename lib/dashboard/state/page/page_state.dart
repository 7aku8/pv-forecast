part of 'page_bloc.dart';

sealed class PageState extends Equatable {
  const PageState();
}

final class PageSelected extends PageState {
  const PageSelected(this.selectedPage);

  final int selectedPage;

  @override
  List<Object> get props => [selectedPage];
}
