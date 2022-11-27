import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'timer_cubit.dart';

part 'timer_list_cubit.freezed.dart';
part 'timer_list_state.dart';

class TimerListCubit extends Cubit<TimerListState> {

  TimerListCubit() : super(TimerListState());

  void addTimer(TimerCubit timerCubit){
    List<TimerCubit> newTimer = List.from(state.timers, growable: true);
    newTimer.add(timerCubit);
    emit(TimerListState(timers: newTimer.toList(growable: false)));
  }

  void removeTimer(String id){
    List<TimerCubit> newTimer = List.from(state.timers, growable: true);
    newTimer.removeWhere((t) => t.id == id);
    emit(TimerListState(timers: newTimer.toList(growable: false)));
  }

}