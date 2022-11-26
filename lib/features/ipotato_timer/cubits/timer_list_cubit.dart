import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'timer_cubit.dart';

part 'timer_list_cubit.freezed.dart';
part 'timer_list_state.dart';

class TimerListCubit extends Cubit<TimerListState> {

  TimerListCubit() : super(const TimerListState());

  void addTimer(TimerCubit timerCubit){
    List<TimerCubit> newTimer = List.from(state.timers);
    newTimer.add(timerCubit);
    emit(TimerListState(timers: newTimer));
  }

  void removeTimer(int index){
    List<TimerCubit> newTimer = List.from(state.timers);
    newTimer.removeAt(index);
    emit(TimerListState(timers: newTimer));
  }

}