import 'package:e_learning_app/pages/profile/settings/bloc/setting_events.dart';
import 'package:e_learning_app/pages/profile/settings/bloc/setting_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<TrigerSettingPage>(_trigerSettingPage);
  }

  void _trigerSettingPage(TrigerSettingPage event, Emitter<SettingState> emit) {
    emit(const SettingState());
  }
}
