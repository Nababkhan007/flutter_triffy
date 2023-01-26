import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/common/helper/get_storage_helper.dart';

class WelcomeViewModel extends GetxController {
  String? _uid = "";

  @override
  void onInit() {
    _getSharedPrefValue();
    _checkLoggedIn();
    super.onInit();
  }

  void _checkLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    _uid == null || _uid!.isEmpty
        ? Get.offAllNamed(AppRoute.login)
        : Get.offAllNamed(AppRoute.home);
  }

  void _getSharedPrefValue() async =>
      _uid = await GetStorageHelper.readGetStorageValue(GetStorageHelper.uid);
}
