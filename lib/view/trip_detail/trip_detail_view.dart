import 'package:flutter/material.dart';
import 'package:triffy/model/network/place_hotel_model.dart';
import 'package:triffy/view/trip_detail/component/trip_detail_section.dart';

class TripDetailView extends StatelessWidget {
  final PlaceHotelModel placeHotel;

  const TripDetailView({
    Key? key,
    required this.placeHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripDetailSection(
      placeHotel: placeHotel,
    );
  }
}
