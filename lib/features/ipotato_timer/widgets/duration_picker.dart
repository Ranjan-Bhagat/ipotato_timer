import 'package:collection/collection.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';

class DurationPicker extends StatefulWidget {
  final String? label;
  final Duration duration;
  final void Function(Duration) onChange;
  final String? Function(Duration)? validator;

  const DurationPicker({
    Key? key,
    this.label,
    this.duration = Duration.zero,
    required this.onChange,
    this.validator,
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
            style:
                context.labelMedium?.copyWith(color: context.onSurfaceVariant),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: selectedDuration.toHHMMSS.split(":").mapIndexed((i, unit) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (i != 0)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            ":",
                            style: context.labelSmall
                                ?.copyWith(color: context.primary),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        color: context.secondaryContainer,
                        child: Text(
                          unit,
                          style: context.displayLarge
                              ?.copyWith(color: context.secondary),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2.0, left: i == 0 ? 0.0 : 12.0),
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
              );
            }).toList(),
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
