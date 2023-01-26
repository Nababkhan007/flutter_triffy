import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/helper/get_storage_helper.dart';

class HomeViewModel extends GetxController {
  String _uid = "";

  @override
  void onInit() {
    _getSharedPrefValue();
    super.onInit();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    _clearUidSharedPrefValue();
    showSnackBar(
      "Success",
      "Logout successful",
      leftBarIndicatorColor: colorWarning,
    );
    _goToLoginView();
  }

  void _goToLoginView() => Get.offAllNamed(AppRoute.login);

  void _clearUidSharedPrefValue() =>
      GetStorageHelper.removeGetStorageKey(GetStorageHelper.uid);

  void _getSharedPrefValue() async =>
      _uid = await GetStorageHelper.readGetStorageValue(GetStorageHelper.uid);
}
