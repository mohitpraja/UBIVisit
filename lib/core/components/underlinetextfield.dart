import 'package:flutter/material.dart';

class UnderLineTextField extends StatelessWidget {
  const UnderLineTextField(
      {super.key,
      this.inputType,
      this.textStyle,
      this.maxLength,
      required this.hintText,
      this.icon,
      this.borderRadius,
      this.controller,
      this.validator,
      this.onchanged,
      this.autofocus,
      this.initialValue});

  final TextInputType? inputType;
  final TextStyle? textStyle;
  final int? maxLength;
  final String hintText;
  final String? initialValue;
  final Icon? icon;
  final bool? autofocus;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      style: textStyle ?? const TextStyle(color: Colors.black54),
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      autofocus: autofocus ?? true,
      validator: validator,
      controller: controller,
      onChanged: onchanged,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
