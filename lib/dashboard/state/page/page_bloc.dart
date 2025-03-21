import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageSelected(0, InitiatedBy.bottomNav)) {
    on<SelectPage>((event, emit) {
      emit(PageSelected(event.pageIndex, event.initiatedBy));
    });
  }
}
