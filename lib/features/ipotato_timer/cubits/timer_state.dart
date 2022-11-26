part of 'timer_cubit.dart';

enum TimerStatus {
  uninitialized,
  initialized,
  running,
  paused,
  completed,
}

@freezed
class TimerState with _$TimerState {

  TimerState._();

  factory TimerState({
    @Default(Duration.zero) Duration duration,
    @Default(TimerStatus.uninitialized) TimerStatus status,
    @Default("") String title,
    @Default("") String description,
  }) = _TimerState;

  bool get isPaused => status == TimerStatus.paused;

  bool get isCompleted => status == TimerStatus.completed;

}
