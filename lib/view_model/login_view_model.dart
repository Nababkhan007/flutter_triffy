import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                : _loginWithFirebase();
  }

  Future _loginWithFirebase() async {
    isLoading.value = true;
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;

      showSnackBar(
        "Success",
        "Login successful",
        leftBarIndicatorColor: colorSuccess,
      );
      _saveSharedPrefValue(credential.user!.uid);
      _goToHomePage();
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == "invalid-email") {
        showSnackBar(
          "Warning",
          "Invalid email.",
          leftBarIndicatorColor: colorWarning,
        );
      } else if (e.code == "user-not-found") {
        isLoading.value = false;
        showSnackBar(
          "Warning",
          "No user found for that email.",
          leftBarIndicatorColor: colorWarning,
        );
      } else if (e.code == "wrong-password") {
        isLoading.value = false;
        showSnackBar(
          "Warning",
          "Wrong password provided for that user.",
          leftBarIndicatorColor: colorWarning,
        );
      } else {
        isLoading.value = false;
        showSnackBar(
          "Warning",
          "Sorry, something went wrong!",
          leftBarIndicatorColor: colorWarning,
        );
      }
    } catch (e) {
      isLoading.value = false;
      showSnackBar(
        "Warning",
        "Sorry, something went wrong!",
        leftBarIndicatorColor: colorWarning,
      );
    }
  }

  void _saveSharedPrefValue(String uid) =>
      GetStorageHelper.writeGetStorageValue(GetStorageHelper.uid, uid);

  void _goToHomePage() => Get.offAllNamed(AppRoute.home);

  void goToRegistrationPage() => Get.toNamed(AppRoute.registration);
}
