import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function? onTap;
  final bool? isPassword;
  final String? validate;
  final String? label;
  final Widget? prefix;
  final IconData? suffix;
  final Function? suffixPressed;
  final bool? isClickable;
  final bool? autocorrect;
  final EdgeInsets? contentPadding;
  final Function? onSubmit;

  const CustomTF({
    super.key,
    this.controller,
    this.type,
    this.onTap,
    this.isPassword = false,
    this.validate,
    this.contentPadding,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
    this.autocorrect,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword!,
      enabled: isClickable,
      onTap: () => onTap,
      validator: (val) {
        if (val!.isEmpty) return '$validate';
        return null;
      },
      onFieldSubmitted: (val) => onSubmit,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => suffixPressed!(),
                icon: Icon(suffix),
              )
            : null,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
