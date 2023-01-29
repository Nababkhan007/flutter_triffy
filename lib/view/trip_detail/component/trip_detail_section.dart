import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/widget/custom_button.dart';
import 'package:triffy/view_model/trip_detail_view_model.dart';
import 'package:triffy/common/widget/custom_slider_indicator.dart';
import 'package:triffy/view/trip_detail/component/trip_detail_app_bar.dart';
import 'package:triffy/view/trip_detail/component/'
    'trip_detail_scrollable_sheet.dart';

class TripDetailSection extends GetWidget<TripDetailViewModel> {
  const TripDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Obx(
      () => Scaffold(
        backgroundColor: colorPrimary,
        body: Stack(
          children: [
            SizedBox(
              height: size.height * .6,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.place.imageUrl.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    controller.place.imageUrl[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            CustomSliderIndicator(
              padding: padding,
              indicatorLength: controller.place.imageUrl.length,
              activeIndex: controller.activeIndex.value,
            ),
            TripDetailAppBar(
              size: size,
              padding: padding,
              price: controller.place.price,
            ),
            TripDetailScrollableSheet(
              place: controller.place,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.15,
            right: size.width * 0.15,
            bottom: 24.0 * 2,
          ),
          child: CustomButton(
            onPressed: () =>
                controller.updateTripDetails(!controller.place.isBooked),
            text: !controller.place.isBooked ? "Book Now" : "Cancel",
          ),
        ),
      ),
    );
  }
}
