import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/model/network/place_hotel_model.dart';

class BookedTripCard extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final PlaceHotelModel placeHotel;

  const BookedTripCard({
    Key? key,
    required this.homeViewModel,
    required this.placeHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        right: paddingLarge,
      ),
      child: InkWell(
        onTap: () => homeViewModel.goToTripDetailView(placeHotel),
        child: Card(
          elevation: 2.0,
          child: SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.6,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        radiusMedium,
                      ),
                      child: Image.network(
                        placeHotel.imageUrl[0],
                        height: size.height * 0.15,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: paddingMedium,
                          bottom: paddingMedium,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(
                            paddingMedium,
                          ),
                          decoration: const BoxDecoration(
                            color: colorAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                radiusLarge,
                              ),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: paddingMedium,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    placeHotel.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorWhite,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: paddingMedium,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    placeHotel.country,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: colorAsh,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: paddingMedium,
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: colorWhite,
                      ),
                    ),
                    Text(
                      placeHotel.time,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorAsh,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.only(
                        right: paddingMedium,
                      ),
                      child: Text(
                        placeHotel.price,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorAsh,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
