import 'package:collection/collection.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';
import 'package:ipotato_timer/core/extension/duration_extentions.dart';

class DurationPicker extends StatefulWidget {
  final String? label;
  final Duration duration;
  final void Function(Duration) onChange;

  const DurationPicker({
    Key? key,
    this.label,
    this.duration = Duration.zero,
    required this.onChange,
  }) : super(key: key);

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late Duration selectedDuration;

  @override
  void initState() {
    selectedDuration = widget.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showPicker,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? "Duration",
            style: context.labelMedium?.copyWith(color: context.onSurfaceVariant),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: selectedDuration.toHHMMSS
                .split(":")
                .mapIndexed((i, unit) {
                  return [
                    if (i != 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          ":",
                          style: context.labelSmall
                              ?.copyWith(color: context.primary),
                        ),
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          color: context.secondaryContainer,
                          child: Text(
                            unit.padLeft(2, '0'),
                            style: context.displayLarge
                                ?.copyWith(color: context.secondary),
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            i == 0
                                ? "HH"
                                : i == 1
                                    ? "MM"
                                    : "SS",
                            style: context.labelSmall
                                ?.copyWith(color: context.onSurfaceVariant),
                          ),
                        ),
                      ],
                    ),
                  ];
                })
                .expand((element) => element)
                .toList(),
          ),
        ],
      ),
    );
  }

  Future<void> showPicker() async {
    final picked = await showDurationPicker(
        context: context,
        initialTime: selectedDuration,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: context.background,
        ));
    if (picked == null) return;
    setState(() => selectedDuration = picked);
    widget.onChange(selectedDuration);
  }
}
