import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view_model/home_view_model.dart';
import 'package:triffy/common/widget/custom_scaffold.dart';
import 'package:triffy/common/widget/custom_search_bar.dart';
import 'package:triffy/view/home/component/home_trip_list_section.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  paddingLarge,
                ),
                child: Text(
                  "Triffy",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Spacer(),
              IconButton(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                onPressed: () => controller.logout(),
                icon: const Icon(
                  Icons.power_settings_new,
                ),
              ),
            ],
          ),
          const CustomSearchBar(
            hint: "Search destination, location",
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                child: Text(
                  "Places",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                child: Text(
                  "See all",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: colorAccent,
                      ),
                ),
              ),
            ],
          ),
          const HomeTripListSection(
            isPlace: true,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                child: Text(
                  "Hotels",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                child: Text(
                  "See all",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: colorAccent,
                      ),
                ),
              ),
            ],
          ),
          const HomeTripListSection(
            isPlace: false,
          ),
        ],
      ),
    );
  }
}
