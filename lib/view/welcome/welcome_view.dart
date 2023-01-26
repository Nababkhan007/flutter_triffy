import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/view_model/welcome_view_model.dart';
import 'package:triffy/view/welcome/component/welcome_section.dart';

class WelcomeView extends GetWidget<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomeSection();
  }
}
