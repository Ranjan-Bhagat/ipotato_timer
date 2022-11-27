import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipotato_timer/features/ipotato_timer/cubits/timer_list_cubit.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/timer_card.dart';

import '../cubits/timer_cubit.dart';
import '/core/core.dart';
import '../overlays/add_timer_overlay.dart';

class IPotatoTimerPage extends StatefulWidget {
  const IPotatoTimerPage({Key? key}) : super(key: key);

  @override
  State<IPotatoTimerPage> createState() => _IPotatoTimerPageState();
}

class _IPotatoTimerPageState extends State<IPotatoTimerPage> {

  final cubit = locator.get<TimerListCubit>();
  final player = AudioPlayer();

  @override
  void initState() {
    //Setting audio to player
    player.setAsset(AudioAssets.completion);
    super.initState();
  }

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
    return LayoutBuilder(
      builder: (ctx, constraints){
        if(constraints.maxWidth < 550) {
          return smallScreenTimerList(timers);
        } else {
          return largeScreenTimerGrid(timers);
        }
      },
    );
  }

  Widget smallScreenTimerList(List<TimerCubit> timers){
    return ListView.separated(
      itemCount: timers.length,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      separatorBuilder: (_, i) => const SizedBox(height: 20),
      itemBuilder: (ctx, i) => TimerCard(
        key: ValueKey(timers[i].id),
        timerCubit: timers[i],
        player: player,
      ),
    );
  }

  Widget largeScreenTimerGrid(List<TimerCubit> timers){
    return GridView.builder(
      itemCount: timers.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.68,
          maxCrossAxisExtent: 368
        ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      // separatorBuilder: (_, i) => const SizedBox(height: 20),
      itemBuilder: (ctx, i) => TimerCard(
        key: ValueKey(timers[i].id),
        timerCubit: timers[i],
        player: player,
      ),
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

  @override
  void dispose() {
    //Disposing audio player
    player.dispose();
    super.dispose();
  }
}
