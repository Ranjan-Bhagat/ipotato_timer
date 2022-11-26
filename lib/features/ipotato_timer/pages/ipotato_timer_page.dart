import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipotato_timer/features/ipotato_timer/cubits/timer_list_cubit.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/timer_card.dart';

import '../cubits/timer_cubit.dart';
import '/core/core.dart';
import '../overlays/add_timer_overlay.dart';

class IPotatoTimerPage extends StatelessWidget {

  IPotatoTimerPage({Key? key}) : super(key: key);

  final cubit = locator.get<TimerListCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
      floatingActionButton: buildActionButton(context),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(124),
      child: Container(
        color: context.secondary,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 32, bottom: 12),
        child: Text(
          "Potato Timer",
          style: context.headlineLarge?.copyWith(color: IPotatoThemes.white),
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 20),
      child: FloatingActionButton(
        backgroundColor: IPotatoThemes.darkOnPrimaryContainer,
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          IconAssets.circleOutlineAdd,
          height: 26,
          width: 26,
          color: IPotatoThemes.onPrimaryContainer,
        ),
        onPressed: () => showAddTimerOverlay(context),
      ),
    );
  }

  Widget buildBody() {
    return BlocBuilder<TimerListCubit, TimerListState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.timers.isEmpty) return noTimer(context);
          return timerList(state.timers);
        });
  }

  Widget timerList(List<TimerCubit> timers) {
    return ListView.separated(
      itemCount: timers.length,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      separatorBuilder: (_, i) => const SizedBox(height: 20),
      itemBuilder: (ctx, i) {
        return BlocProvider(
          lazy: true,
          create: (c) => timers[i],
          child: TimerCard(i),
        );
      },
    );
  }

  Widget noTimer(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 12,
          bottom: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  "No timers active.\nPress here to start a new one",
                  style:
                      context.bodyMedium?.copyWith(color: IPotatoThemes.black),
                ),
              ),
              SvgPicture.asset(
                height: 106,
                width: 106,
                IconAssets.curvedDownArrow,
                color: context.onTertiaryContainer.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
