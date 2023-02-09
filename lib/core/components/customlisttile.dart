import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.spacing,
    required this.text,
    this.trailing,
    this.leading,
  });

  final double? spacing;
  final String? text;
  final Widget? trailing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      minVerticalPadding: 0,
      
      horizontalTitleGap: spacing ?? 1,
      title: Text(text ?? ''),
      trailing: trailing,
    );
  }
}
