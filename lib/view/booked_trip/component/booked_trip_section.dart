import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_app_bar.dart';
import 'package:triffy/common/widget/custom_search_bar.dart';
import 'package:triffy/view/booked_trip/component/'
    'booked_trip_list_section.dart';

class BookedTripSection extends GetWidget<HomeViewModel> {
  const BookedTripSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Booked Trips",
      body: ListView(
        children: const [
          CustomSearchBar(
            hint: "Search destination, location",
          ),
          BookedTripListSection(),
        ],
      ),
    );
  }
}
