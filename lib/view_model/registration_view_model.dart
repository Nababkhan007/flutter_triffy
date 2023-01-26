import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:triffy/common/const/color_const.dart';

class RegistrationViewModel extends GetxController {
  RxBool isObscure = true.obs, isLoading = false.obs;
  String email = "", password = "";

  void checkRegistrationValidation() {
    email.trim().isEmpty && password.trim().isEmpty
        ? showSnackBar(
            "Warning",
            "Please enter email and password",
            leftBarIndicatorColor: colorWarning,
          )
        : email.trim().isEmpty
            ? showSnackBar(
                "Warning",
                "Please enter email",
                leftBarIndicatorColor: colorWarning,
              )
            : password.trim().isEmpty
                ? showSnackBar(
                    "Warning",
                    "Please enter password",
                    leftBarIndicatorColor: colorWarning,
                  )
                : _registration();
  }

  void _registration() {
    goToLoginPage();
  }

  void goToLoginPage() => Get.toNamed(AppRoute.login);
}
