import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/route/app_page.dart';
import 'package:triffy/firebase_options.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triffy/common/core/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:triffy/view/welcome/welcome_view.dart';
import 'package:triffy/common/helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  runApp(const Triffy());
}

class Triffy extends StatelessWidget {
  const Triffy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
      theme: ThemeHelper.lightTheme(context),
      home: const WelcomeView(),
    );
  }
}
