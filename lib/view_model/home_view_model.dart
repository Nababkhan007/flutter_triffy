import 'dart:convert';
import 'package:get/get.dart';
import 'package:triffy/route/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triffy/model/network/trip_model.dart';
import 'package:triffy/model/network/place_model.dart';
import 'package:triffy/common/helper/get_storage_helper.dart';

class HomeViewModel extends GetxController with StateMixin<TripModel> {
  Rx<TripModel> trip = TripModel().obs;

  @override
  void onInit() {
    _getTrips();
    super.onInit();
  }

  Future<dynamic>? goToBookedTripView() => Get.toNamed(AppRoute.bookedTrip);

  Future<dynamic>? goToTripDetailView(
          List<PlaceModel> places, PlaceModel place) =>
      Get.toNamed(AppRoute.tripDetail,
          arguments: {"places": places, "place": place});

  void _getTrips() async {
    change(trip.value, status: RxStatus.loading());
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("trip").get().then((event) {
      for (var doc in event.docs) {
        trip.value = tripModelFromJson(json.encode(doc.data()));
      }
    });
    change(trip.value, status: RxStatus.success());
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    _clearUidSharedPrefValue();
    showSnackBar(
      "Success",
      "Logout successful",
      leftBarIndicatorColor: colorSuccess,
    );
    _goToLoginView();
  }

  void _goToLoginView() => Get.offAllNamed(AppRoute.login);

  void _clearUidSharedPrefValue() =>
      GetStorageHelper.removeGetStorageKey(GetStorageHelper.uid);
}
