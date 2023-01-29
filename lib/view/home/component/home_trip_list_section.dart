import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/model/network/place_hotel_model.dart';
import 'package:triffy/common/widget/custom_progress_bar.dart';
import 'package:triffy/view/home/component/home_trip_card.dart';

class HomeTripListSection extends GetWidget<HomeViewModel> {
  final bool isPlace;

  const HomeTripListSection({
    Key? key,
    required this.isPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: paddingMedium,
      ),
      height: size.height * 0.3,
      width: size.width * 1,
      child: controller.obx(
        (state) => ListView.builder(
          scrollDirection: Axis.horizontal,
          primary: false,
          itemCount: isPlace
              ? controller.trip.value.places.length
              : controller.trip.value.hotels.length,
          itemBuilder: (BuildContext context, int index) {
            PlaceHotelModel placeHotel = isPlace
                ? controller.trip.value.places[index]
                : controller.trip.value.hotels[index];
            return Padding(
              padding: const EdgeInsets.only(
                left: paddingLarge,
              ),
              child: HomeTripCard(
                homeViewModel: controller,
                isPlace: isPlace,
                placeHotels: isPlace
                    ? controller.trip.value.places
                    : controller.trip.value.hotels,
                placeHotel: placeHotel,
              ),
            );
          },
        ),
        onLoading: const CustomProgressBar(),
      ),
    );
  }
}
