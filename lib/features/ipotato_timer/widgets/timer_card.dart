import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipotato_timer/core/core.dart';
import 'package:ipotato_timer/features/ipotato_timer/cubits/timer_cubit.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/common_button.dart';

import '../cubits/timer_list_cubit.dart';

class TimerCard extends StatelessWidget {
  final AudioPlayer player;
  final timerListCubit = locator.get<TimerListCubit>();

  TimerCard({required Key key, required this.player}) : super(key: key);

  void removeTimer(TimerState state) {
    timerListCubit.removeTimer(state.id);
    if (player.playing && !timerListCubit.state.timers.any((timer) => timer.state.isCompleted)) {
      player
        ..stop()
        ..seek(Duration.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      buildWhen: (previous, current) =>
          previous.duration != current.duration ||
          previous.status != current.status,
      builder: (ctx, state) {
        if (!player.playing && state.isCompleted) {
          player.play().then((value) => player
            ..stop()
            ..seek(Duration.zero));
        }

        return Dismissible(
          key: ValueKey(context.read<TimerCubit>().hashCode),
          onDismissed: (_) => removeTimer(state),
          child: Card(
            elevation: 8.0,
            color: context.background,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0).copyWith(top: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.isCompleted)
                          buildCompleted(context)
                        else
                          buildTimer(state, context),
                        const SizedBox(height: 16),
                        Text(
                          state.title,
                          style: context.titleLarge
                              ?.copyWith(color: context.secondary),
                        ),
                        if (state.description.isNotEmpty)
                          Text(
                            state.description,
                            style: context.labelLarge?.copyWith(
                              color: context.primary,
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (state.isCompleted)
                    CommonButton(
                      height: 40,
                      label: "MARK COMPLETE",
                      onPressed: () => removeTimer(state),
                      borderRadius: BorderRadius.circular(14),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCompleted(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          IconAssets.soundWave,
          height: 24.0,
          width: 24.0,
        ),
        Text(
          "FINISHED",
          style: context.headlineLarge?.copyWith(color: context.primary),
        ),
        SvgPicture.asset(
          IconAssets.soundWave,
          height: 24.0,
          width: 24.0,
        ),
      ],
    );
  }

  Widget buildTimer(TimerState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          state.duration.toHHMMSS,
          style: context.headlineLarge?.copyWith(color: context.primary),
        ),
        const SizedBox(width: 8.0),
        if (state.isPaused)
          buildSvgButton(
            svgIconPath: IconAssets.play,
            onTap: context.read<TimerCubit>().resumeTimer,
          )
        else
          buildSvgButton(
            svgIconPath: IconAssets.pause,
            onTap: context.read<TimerCubit>().pauseTimer,
          ),
        const SizedBox(width: 8.0),
        buildSvgButton(
          svgIconPath: IconAssets.stop,
          onTap: () => removeTimer(state),
        ),
      ],
    );
  }

  Widget buildSvgButton({
    required String svgIconPath,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        svgIconPath,
        height: 24.0,
        width: 24.0,
      ),
    );
  }
}
