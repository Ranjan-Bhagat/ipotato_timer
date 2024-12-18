export 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/core.dart';

import '../features/ipotato_timer/cubits/timer_list_cubit.dart';

final locator = GetIt.I;

void setUpLocator(){
  locator.registerLazySingleton<TimerListCubit>(() => TimerListCubit());
}