import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';

class IPotatoTimerPage extends StatelessWidget {
  const IPotatoTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
      ),
      body: Stack(
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
                    style: context.bodyMedium,
                  ),
                ),
                SvgPicture.asset(
                  height: 106,
                  width: 106,
                  alignment: Alignment.bottomRight,
                  IconAssets.curvedDownArrow,
                  color: context.onTertiaryContainer.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
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
          onPressed: () {},
        ),
      ),
    );
  }
}
