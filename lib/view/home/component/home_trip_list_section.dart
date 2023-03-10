import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/model/network/place_model.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_progress_bar.dart';
import 'package:triffy/view/home/component/home_trip_card.dart';

class HomeTripListSection extends GetWidget<HomeViewModel> {
  final String type;

  const HomeTripListSection({
    Key? key,
    required this.type,
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
          itemCount: controller.trip.value.places.length,
          itemBuilder: (BuildContext context, int index) {
            PlaceModel place = controller.trip.value.places[index];
            return type == place.type
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: paddingLarge,
                    ),
                    child: HomeTripCard(
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
