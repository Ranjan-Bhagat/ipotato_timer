import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/core.dart';

class CommonTextFiled extends StatelessWidget {
  final String? hint;
  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CommonTextFiled({
    Key? key,
    required this.label,
    this.hint,
    this.maxLines,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      style:  context.bodyLarge?.copyWith(
        color: IPotatoThemes.outline,
        letterSpacing: 0.0,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.bodyLarge?.copyWith(
          color: IPotatoThemes.outline,
          letterSpacing: 0.0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Container(
          color: IPotatoThemes.white,
          child: Text(
            label,
            style: context.labelMedium?.copyWith(color: context.primary),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
