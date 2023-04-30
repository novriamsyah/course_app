import 'package:e_learning_app/pages/application/bloc/application_events.dart';
import 'package:e_learning_app/pages/application/bloc/application_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<TriggerPageEvent>((event, emit) {
      emit(ApplicationState(index: event.index));
    });
  }
}
