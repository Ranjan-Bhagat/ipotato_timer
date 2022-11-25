import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const CommonButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: const Size.fromHeight(60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
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
