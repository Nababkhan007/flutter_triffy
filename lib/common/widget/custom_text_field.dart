import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/dimen_const.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String labelText, hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int maxLength;

  const CustomTextField({
    Key? key,
    this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.textInputType,
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
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: paddingMedium,
            ),
            child: Icon(
              icon,
            ),
          ),
        ),
        onChanged: onChanged,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
