import 'package:flutter/material.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view/home/component/home_trip_card.dart';

class HomeTripListSection extends StatelessWidget {
  const HomeTripListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: paddingMedium,
      ),
      height: size.height * 0.3,
      width: size.width * 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(
              left: paddingLarge,
            ),
            child: HomeTripCard(),
          );
        },
      ),
    );
  }
}
