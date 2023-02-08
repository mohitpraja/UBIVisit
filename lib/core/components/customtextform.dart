import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.inputType,
      this.textStyle,
      this.maxLength,
      required this.hintText,
      required this.icon,
      this.borderRadius,
      this.controller,
      this.validator,
      this.onchanged,
      this.readonly,
      this.initialValue});

  final TextInputType? inputType;
  final TextStyle? textStyle;
  final int? maxLength;
  final bool? readonly;
  final String hintText;
  final String? initialValue;
  final Icon? icon;
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
      readOnly: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          hintStyle: textStyle ?? const TextStyle(color: Colors.black54),
          hintText: hintText,
          counterText: '',
          prefixIcon: icon,
          border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10))),
      validator: validator,
      controller: controller,
      onChanged: onchanged,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
