import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipotato_timer/core/core.dart';
import 'package:ipotato_timer/features/ipotato_timer/cubits/timer_cubit.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/common_button.dart';

import '../cubits/timer_list_cubit.dart';

class TimerCard extends StatelessWidget {
  final int index;

  const TimerCard(this.index, {Key? key}) : super(key: key);

  void removeTimer() => locator.get<TimerListCubit>().removeTimer(index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      buildWhen: (previous, current) =>
          previous.duration != current.duration ||
          previous.status != current.status,
      builder: (ctx, state) {
        return Dismissible(
          key: ValueKey(state.hashCode),
          onDismissed: (_) => removeTimer(),
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
                          style:
                              context.titleLarge?.copyWith(color: context.secondary),
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
                      onPressed: removeTimer,
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
          onTap: removeTimer,
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
