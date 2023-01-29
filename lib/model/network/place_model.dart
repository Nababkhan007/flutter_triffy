class PlaceModel {
  const PlaceModel({
    this.id = 0,
    this.imageUrl = const [],
    this.name = "",
    this.country = "",
    this.time = "",
    this.price = "",
    this.description = "",
    this.isBooked = false,
    this.type = "",
  });

  final int id;
  final List<String> imageUrl;
  final String name;
  final String country;
  final String time;
  final String price;
  final String description;
  final bool isBooked;
  final String type;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        imageUrl: List<String>.from(json["image_url"].map((x) => x)),
        name: json["name"],
        country: json["country"],
        time: json["time"],
        price: json["price"],
        description: json["description"],
        isBooked: json["is_booked"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": List<String>.from(imageUrl.map((x) => x)),
        "name": name,
        "country": country,
        "time": time,
        "price": price,
        "description": description,
        "is_booked": isBooked,
        "type": type,
      };
}
