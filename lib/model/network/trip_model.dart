import 'dart:convert';
import 'package:triffy/model/network/place_model.dart';

TripModel tripModelFromJson(String str) => TripModel.fromJson(json.decode(str));

String tripModelToJson(TripModel data) => json.encode(data.toJson());

class TripModel {
  TripModel({
    this.places = const [],
  });

  final List<PlaceModel> places;

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        places: List<PlaceModel>.from(
            json["place"].map((x) => PlaceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "place": List<PlaceModel>.from(places.map((x) => x.toJson())),
      };
}
