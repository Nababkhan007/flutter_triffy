import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/model/network/place_model.dart';
import 'package:triffy/view_model/home_view_model.dart';

class TripDetailViewModel extends GetxController {
  RxInt activeIndex = 0.obs;
  List<PlaceModel> places = [];
  PlaceModel place = const PlaceModel();
  PageController pageController = PageController();

  @override
  void onInit() {
    _getArguments();
    _pageControllerAddListener();
    super.onInit();
  }

  void updateTripDetails(bool isBooked, bool isFavorite, {bool booked = false, bool favorite = false}) async {
    List<Map<String, dynamic>> placeList = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference docRef = db.collection("trip").doc("xRfm2EyGIt1shdLUuRFW");

    for (PlaceModel placeData in places) {
      placeList.add(PlaceModel(
        id: placeData.id,
        imageUrl: placeData.imageUrl,
        name: placeData.name,
        country: placeData.country,
        time: placeData.time,
        price: placeData.price,
        description: placeData.description,
        isBooked: booked
            ? placeData.id == place.id
                ? isBooked
                : placeData.isBooked
            : placeData.isBooked,
        isFavorite: favorite
            ? placeData.id == place.id
                ? isFavorite
                : placeData.isFavorite
            : placeData.isFavorite,
        type: placeData.type,
      ).toJson());
    }

    docRef.update({"place": placeList}).then(
      (value) {
        showSnackBar(
          "Success",
          booked
              ? "Booking status updated!"
              : favorite
                  ? "Favorite status updated!"
                  : "Updated!",
          leftBarIndicatorColor: colorSuccess,
        );
        Get.delete<HomeViewModel>();
        Get.offNamed(AppRoute.home);
      },
      onError: (e) => showSnackBar(
        "Error",
        booked
            ? "Booking status not updated!"
            : favorite
                ? "Favorite status not updated!"
                : "Not updated!",
        leftBarIndicatorColor: colorError,
      ),
    );
  }

  void _pageControllerAddListener() => pageController.addListener(() {
        activeIndex.value = pageController.page!.round();
      });

  void _getArguments() {
    if (Get.arguments != null) {
      places = Get.arguments["places"] ?? [];
      place = Get.arguments["place"] ?? const PlaceModel();
    }
  }
}
