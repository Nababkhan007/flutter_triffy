import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/view/home/home_view.dart';
import 'package:triffy/view/welcome/welcome_view.dart';
import 'package:triffy/view/auth/login/login_view.dart';
import 'package:triffy/view/auth/registration/registration_view.dart';

abstract class AppPage {
  static const initial = AppRoute.welcome;

  static final routes = [
    GetPage(
      name: AppRoute.welcome,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoute.registration,
      page: () => const RegistrationView(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
    ),
  ];
}
