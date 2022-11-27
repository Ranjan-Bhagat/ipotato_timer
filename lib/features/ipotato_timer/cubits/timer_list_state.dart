part of 'timer_list_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class TimerListState with _$TimerListState {

  factory TimerListState({
    @Default([]) List<TimerCubit> timers,
  }) = _TimerListState;

}