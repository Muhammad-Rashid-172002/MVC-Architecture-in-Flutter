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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myCrontroller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmittedValue,
      validator: onvalidator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(15),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.hintColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}
