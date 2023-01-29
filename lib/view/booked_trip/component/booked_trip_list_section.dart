import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/model/network/place_model.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_progress_bar.dart';
import 'package:triffy/view/booked_trip/component/booked_trip_card.dart';

class BookedTripListSection extends GetWidget<HomeViewModel> {
  const BookedTripListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingMedium,
      ),
      height: size.height * 1,
      width: size.width * 1,
      child: controller.obx(
        (state) => ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          itemCount: controller.trip.value.places.length,
          itemBuilder: (BuildContext context, int index) {
            PlaceModel place = controller.trip.value.places[index];
            return place.isBooked
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingMedium,
                    ),
                    child: BookedTripCard(
                      homeViewModel: controller,
                      places: controller.trip.value.places,
                      place: place,
                    ),
                  )
                : Container();
          },
        ),
        onLoading: const CustomProgressBar(),
      ),
    );
  }
}
