import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                : _registrationWithFirebase();
  }

  Future _registrationWithFirebase() async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      showSnackBar(
        "Success",
        "Registration successful, please login to continue",
        leftBarIndicatorColor: colorSuccess,
      );
      goToLoginPage();
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        showSnackBar(
          "Warning",
          "Invalid email.",
          leftBarIndicatorColor: colorWarning,
        );
      } else if (e.code == "weak-password") {
        showSnackBar(
          "Warning",
          "The password provided is too weak.",
          leftBarIndicatorColor: colorWarning,
        );
      } else if (e.code == "email-already-in-use") {
        showSnackBar(
          "Warning",
          "The account already exists for that email.",
          leftBarIndicatorColor: colorWarning,
        );
      } else {
        showSnackBar(
          "Warning",
          "Sorry, something went wrong!",
          leftBarIndicatorColor: colorWarning,
        );
      }
    } catch (e) {
      // ignore :)
    }
  }

  void goToLoginPage() => Get.toNamed(AppRoute.login);
}
