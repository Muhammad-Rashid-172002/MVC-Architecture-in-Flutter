import 'package:flutter/material.dart';
import 'package:practics/res/color.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.myCrontroller,
    required this.focusNode,
    required this.hint,
    required this.obscureText,
    required this.onFieldSubmittedValue,
    required this.onvalidator,
    this.enabled = true,
    this.autoFocus = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController myCrontroller;
  final FocusNode focusNode;
  final String hint;
  final bool obscureText;
  final ValueChanged<String> onFieldSubmittedValue;
  final FormFieldValidator onvalidator;
  final bool enabled, autoFocus;
  final TextInputType keyboardType;
  final Widget? prefixIcon, suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: myCrontroller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onvalidator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        enabled: enabled,
        autofocus: autoFocus,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.hintColor,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none, // no border by default
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: AppColors.textFieldDefaultBorderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.alertColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
