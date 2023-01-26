import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/dimen_const.dart';

class CustomPasswordField extends StatelessWidget {
  final String labelText, hintText;
  final bool isObscure;
  final VoidCallback onPressed;
  final IconData prefixIcon, suffixIcon;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final int maxLength;

  const CustomPasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.isObscure,
    required this.onPressed,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onChanged,
    required this.textInputAction,
    this.maxLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: paddingMedium,
        horizontal: paddingLarge,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: paddingMedium,
            ),
            child: Icon(
              prefixIcon,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
            ),
          ),
        ),
        obscureText: isObscure,
        onChanged: onChanged,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: textInputAction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
