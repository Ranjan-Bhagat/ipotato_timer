import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipotato_timer/core/core.dart';
import 'package:ipotato_timer/features/ipotato_timer/cubits/timer_cubit.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/common_button.dart';

import '../cubits/timer_list_cubit.dart';

class TimerCard extends StatelessWidget {

  final TimerCubit timerCubit;
  final AudioPlayer player;
  final timerListCubit = locator.get<TimerListCubit>();

  TimerCard({Key? key, required this.timerCubit, required this.player}) : super(key: key);

  Future<void> payAudio(TimerState state) async {
    if (state.isCompleted) {
      await player.seek(Duration.zero);
      await player.play();
    }
  }

  Future<void> stopAudio(TimerState state) async {
    if (player.playing && !timerListCubit.state.timers.any((timer) => timer.state.isCompleted)) {
      await player.stop();
    }
  }

  Future<void> removeTimer(TimerState state) async {
    timerListCubit.removeTimer(timerCubit.id);
    await stopAudio(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      bloc: timerCubit,
      listenWhen: (previous, current) =>
      previous.duration != current.duration ||
          previous.status != current.status,
      buildWhen: (previous, current) =>
          previous.duration != current.duration ||
          previous.status != current.status,
      listener: (ctx, state) => payAudio(state),
      builder: (ctx, state) {
        return Dismissible(
          key: ValueKey(timerCubit.hashCode),
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
            onTap: timerCubit.resumeTimer,
          )
        else
          buildSvgButton(
            svgIconPath: IconAssets.pause,
            onTap: timerCubit.pauseTimer,
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
