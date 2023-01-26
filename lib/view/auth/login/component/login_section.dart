import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view_model/login_view_model.dart';
import 'package:triffy/common/widget/custom_button.dart';
import 'package:triffy/common/helper/clipper_helper.dart';
import 'package:triffy/common/widget/custom_text_field.dart';
import 'package:triffy/common/widget/custom_progress_bar.dart';
import 'package:triffy/common/widget/custom_password_field.dart';

class LoginSection extends GetWidget<LoginViewModel> {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: ClipperHelper.loginClipper,
                  child: Container(
                    height: size.height * 0.4,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: colorPrimary,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/trip.svg",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: marginLargePlus,
                    vertical: marginSmall,
                  ),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: marginLargePlus,
                  ),
                  child: const Text(
                    "Login to continue",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomTextField(
                  labelText: "Email",
                  hintText: "Enter email",
                  icon: Icons.email,
                  onChanged: (email) => controller.email = email,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                CustomPasswordField(
                  labelText: "Password",
                  hintText: "Enter password",
                  isObscure: controller.isObscure.value,
                  onPressed: () =>
                      controller.isObscure.value = !controller.isObscure.value,
                  prefixIcon: Icons.lock,
                  suffixIcon: controller.isObscure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onChanged: (password) => controller.password = password,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: CustomButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.checkLoginValidation(),
                      text: "Login",
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: marginStandard,
                    horizontal: marginLargePlus,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => controller.goToRegistrationPage(),
                          text: "Registration",
                          style: const TextStyle(
                            color: colorAccent,
                          ),
                        ),
                      ],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
            controller.isLoading.value
                ? const Center(
                    child: CustomProgressBar(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
