import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_cubit.freezed.dart';
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final String id;
  late Stream<Duration> timerStream;
  late StreamSubscription<Duration> timerController;

  Stream<Duration> _timer(Duration duration) {
    int seconds = duration.inSeconds;

    return Stream.periodic(const Duration(seconds: 1),
        (count) => Duration(seconds: seconds - count - 1)).take(seconds);
  }

  TimerCubit({
    required Duration duration,
    required String title,
    required String desc,
    required this.id,
  }) : super(TimerState(
          duration: duration,
          status: TimerStatus.initialized,
          title: title,
          description: desc,
          id: id,
        )) {
    _initialized();
  }

  void _initialized() {
    // Creating timer stream which will periodically (1 second) emit values
    timerStream = _timer(state.duration);

    timerController = timerStream.listen((remainingDuration) {
      emit(
        state.copyWith(
          duration: remainingDuration,
          status: remainingDuration.inSeconds > 0
              ? TimerStatus.running
              : TimerStatus.completed,
        ),
      );
    });
  }

  void resumeTimer() {
    timerController.resume();
    emit(state.copyWith(status: TimerStatus.running));
  }

  void pauseTimer() {
    timerController.pause();
    emit(state.copyWith(status: TimerStatus.paused));
  }

  @override
  Future<void> close() {
    timerController.cancel();
    return super.close();
  }

}
