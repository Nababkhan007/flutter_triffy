import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/model/network/place_hotel_model.dart';
import 'package:triffy/view/trip_detail/component/'
    'trip_detail_description_section.dart';

class TripDetailScrollableSheet extends StatelessWidget {
  final PlaceHotelModel placeHotel;

  const TripDetailScrollableSheet({
    Key? key,
    required this.placeHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    return DraggableScrollableSheet(
      initialChildSize: .4,
      maxChildSize: .6,
      minChildSize: .4,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              TripDetailDescriptionSection(
                placeHotel: placeHotel,
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
                    onPressed: () {},
                    child: const Icon(
                      Icons.favorite,
                      color: colorError,
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
