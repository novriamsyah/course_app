import 'package:e_learning_app/pages/home/bloc/home_events.dart';
import 'package:e_learning_app/pages/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeDotIndicatorEvent>(_homeDotIndicatorEvent);
  }

  void _homeDotIndicatorEvent(
      HomeDotIndicatorEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
