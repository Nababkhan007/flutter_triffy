import 'package:flutter/material.dart';
import 'package:triffy/view/auth/registration/component/'
    'registration_section.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationSection(),
    );
  }
}
