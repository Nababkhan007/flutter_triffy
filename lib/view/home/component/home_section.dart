import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_app_bar.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      automaticallyImplyLeading: false,
      title: "Triffy",
      actions: [
        IconButton(
          padding: const EdgeInsets.all(
            paddingMedium,
          ),
          onPressed: () => controller.logout(),
          icon: const Icon(
            Icons.power_settings_new,
          ),
        )
      ],
      body: Container(),
    );
  }
}
