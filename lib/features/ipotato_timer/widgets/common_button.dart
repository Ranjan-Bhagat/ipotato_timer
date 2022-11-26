import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;

  const CommonButton({
    Key? key,
    required this.label,
    this.height = 60,
    this.borderRadius = const BorderRadius.vertical(bottom: Radius.circular(20)),
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: Size.fromHeight(height),
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: context.tertiaryContainer,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: context.labelLarge?.copyWith(color: context.onTertiaryContainer),
      ),
    );
  }
}
