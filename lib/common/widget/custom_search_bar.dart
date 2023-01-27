import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';

class CustomSearchBar extends StatelessWidget {
  final String hint;

  const CustomSearchBar({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        paddingLarge,
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(
            paddingMedium,
          ),
          hintText: hint,
          prefixIcon: const Icon(
            Icons.location_on,
          ),
        ),
        maxLines: 1,
      ),
    );
  }
}
