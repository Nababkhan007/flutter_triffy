import 'dart:convert';
import 'package:triffy/model/network/place_hotel_model.dart';

TripModel tripModelFromJson(String str) => TripModel.fromJson(json.decode(str));

String tripModelToJson(TripModel data) => json.encode(data.toJson());

class TripModel {
  TripModel({
    this.places = const [],
    this.hotels = const [],
  });

  final List<PlaceHotelModel> places;
  final List<PlaceHotelModel> hotels;

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        places: List<PlaceHotelModel>.from(
            json["place"].map((x) => PlaceHotelModel.fromJson(x))),
        hotels: List<PlaceHotelModel>.from(
            json["hotel"].map((x) => PlaceHotelModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "place": List<PlaceHotelModel>.from(places.map((x) => x.toJson())),
        "hotel": List<PlaceHotelModel>.from(hotels.map((x) => x.toJson())),
      };
}
