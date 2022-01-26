import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Widget? icon;
  final String labelText;
  final Function(String) onChanged;
  final EdgeInsetsGeometry? margin;

  const InputField({
    Key? key,
    this.icon,
    required this.labelText,
    required this.onChanged,
    this.margin,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: TextField(
          onChanged: onChanged,
          // controller: textController,
          decoration: InputDecoration(
            labelText: labelText,
            icon: icon ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
