import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/model/network/place_hotel_model.dart';

class TripDetailViewModel extends GetxController {
  RxInt activeIndex = 0.obs;
  PlaceHotelModel placeHotel = const PlaceHotelModel();
  PageController pageController = PageController();

  @override
  void onInit() {
    _getArguments();
    pageControllerAddListener();
    super.onInit();
  }

  void pageControllerAddListener() {
    pageController.addListener(() {
      activeIndex.value = pageController.page!.round();
    });
  }

  void _getArguments() {
    if (Get.arguments != null) {
      placeHotel = Get.arguments["placeHotel"] ?? const PlaceHotelModel();
    }
  }
}
