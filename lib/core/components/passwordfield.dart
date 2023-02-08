import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/validation.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {super.key,
      this.controller,
      this.onchanged,
      this.validator,
      this.hintext});
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final String? Function(String?)? validator;
  final String? hintext;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          style: const TextStyle(color: Colors.black54),
          obscureText: Validation.isPass.value,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              hintStyle: const TextStyle(color: Colors.black54),
              hintText: hintext ?? 'Enter Password',
              suffixIcon: IconButton(
                  onPressed: () => Validation.showPass(),
                  icon: Validation.isPass.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              prefixIcon: const Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: validator,
          onChanged: onchanged,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ));
  }
}
