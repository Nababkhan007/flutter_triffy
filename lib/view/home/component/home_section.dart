import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_app_bar.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Triffy",
      body: Container(),
    );
  }
}
