import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/route/app_route.dart';
import 'package:triffy/common/const/util_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/model/network/place_hotel_model.dart';

class TripDetailViewModel extends GetxController {
  RxInt activeIndex = 0.obs;
  bool isPlace = false;
  List<PlaceHotelModel> placeHotels = [];
  PlaceHotelModel placeHotel = const PlaceHotelModel();
  PageController pageController = PageController();

  @override
  void onInit() {
    _getArguments();
    pageControllerAddListener();
    super.onInit();
  }

  void updateTripDetails(bool isBooked) async {
    String updateItem = "";
    List<Map<String, dynamic>> placeHotelList = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference docRef =
        db.collection("trip").doc("xRfm2EyGIt1shdLUuRFW");

    for (PlaceHotelModel placeHotelData in placeHotels) {
      placeHotelList.add(PlaceHotelModel(
        id: placeHotelData.id,
        imageUrl: placeHotelData.imageUrl,
        name: placeHotelData.name,
        country: placeHotelData.country,
        time: placeHotelData.time,
        price: placeHotelData.price,
        description: placeHotelData.description,
        isBooked: placeHotelData.id == placeHotel.id
            ? isBooked
            : placeHotelData.isBooked,
      ).toJson());
    }

    isPlace ? updateItem = "place" : updateItem = "hotel";

    docRef.update({
      updateItem: placeHotelList,
    }).then(
      (value) {
        showSnackBar(
          "Success",
          "Booking status updated!",
          leftBarIndicatorColor: colorSuccess,
        );
        Get.delete<HomeViewModel>();
        Get.offNamed(AppRoute.home);
      },
      onError: (e) => showSnackBar(
        "Error",
        "Booking status not updated!",
        leftBarIndicatorColor: colorError,
      ),
    );
  }

  void pageControllerAddListener() {
    pageController.addListener(() {
      activeIndex.value = pageController.page!.round();
    });
  }

  void _getArguments() {
    if (Get.arguments != null) {
      isPlace = Get.arguments["isPlace"] ?? false;
      placeHotels = Get.arguments["placeHotels"] ?? [];
      placeHotel = Get.arguments["placeHotel"] ?? const PlaceHotelModel();
    }
  }
}
