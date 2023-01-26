import 'package:flutter/material.dart';
import 'package:triffy/view/auth/login/component/login_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginSection(),
    );
  }
}
