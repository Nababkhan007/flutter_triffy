import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/helper/get_storage_helper.dart';

class LoginViewModel extends GetxController {
  RxBool isObscure = true.obs, isLoading = false.obs;
  String email = "", password = "";

  void checkLoginValidation() {
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
                : _login();
  }

  void _login() {
    _saveSharedPrefValue();
    _goToHomePage();
  }

  void _saveSharedPrefValue() =>
      GetStorageHelper.writeGetStorageValue(GetStorageHelper.email, email);

  void _goToHomePage() => Get.offAllNamed(AppRoute.home);

  void goToRegistrationPage() => Get.toNamed(AppRoute.registration);
}
