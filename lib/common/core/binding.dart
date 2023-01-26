import 'package:get/get.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/view_model/login_view_model.dart';
import 'package:triffy/view_model/welcome_view_model.dart';
import 'package:triffy/view_model/registration_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeViewModel());
    Get.lazyPut(() => LoginViewModel(), fenix: true);
    Get.lazyPut(() => RegistrationViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
  }
}
