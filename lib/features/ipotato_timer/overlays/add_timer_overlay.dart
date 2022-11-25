import 'package:flutter/material.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/common_button.dart';
import 'package:ipotato_timer/features/ipotato_timer/widgets/common_text_field.dart';
import '../widgets/duration_picker.dart';
import '/../core/core.dart';

Future showAddTimerOverlay(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    builder: (ctx) => const AddTimerOverlay(),
  );
}

class AddTimerOverlay extends StatefulWidget {
  const AddTimerOverlay({Key? key}) : super(key: key);

  @override
  State<AddTimerOverlay> createState() => _AddTimerOverlayState();
}

class _AddTimerOverlayState extends State<AddTimerOverlay> {

  final title = TextEditingController();
  final desc = TextEditingController();
  Duration duration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color.lerp(
                context.primary.withOpacity(0.08), IPotatoThemes.white, 0.92)
            ?.withOpacity(1),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add Task",
                  style: context.headlineLarge
                      ?.copyWith(color: context.onSurfaceVariant),
                ),
                const SizedBox(height: 12.0),
                CommonTextFiled(
                  label: "Tile",
                  hint: "Superdesigner",
                  controller: title,
                ),
                const SizedBox(height: 28.0),
                CommonTextFiled(
                  maxLines: 5,
                  label: "Description",
                  hint: "e.g. john@gmail.com",
                  controller: desc,
                ),
                const SizedBox(height: 28.0),
                DurationPicker(
                  label: "Duration",
                  duration: duration,
                  onChange: (selectedDuration) => duration = selectedDuration,
                ),
              ],
            ),
          ),
          CommonButton(label: "Add Task", onPressed: () {})
        ],
      ),
    );
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    super.dispose();
  }

}
