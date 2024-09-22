import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/model/network/place_model.dart';
import 'package:triffy/view_model/trip_detail_view_model.dart';
import 'package:triffy/view/trip_detail/component/trip_detail_description_section.dart';

class TripDetailScrollableSheet extends GetWidget<TripDetailViewModel> {
  final PlaceModel place;

  const TripDetailScrollableSheet({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    return DraggableScrollableSheet(
      initialChildSize: .4,
      maxChildSize: .6,
      minChildSize: .4,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              TripDetailDescriptionSection(
                place: place,
                padding: padding,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: colorAccent,
                    onPressed: () => controller.updateTripDetails(!controller.place.isBooked, !controller.place.isFavorite,
                        booked: false, favorite: true),
                    child: Icon(
                      !controller.place.isFavorite ? Icons.favorite_border : Icons.favorite,
                      color: !controller.place.isFavorite ? colorWhite : colorError,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
