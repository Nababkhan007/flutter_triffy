import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/widget/custom_button.dart';
import 'package:triffy/model/network/place_hotel_model.dart';
import 'package:triffy/common/widget/custom_slider_indicator.dart';
import 'package:triffy/view/trip_detail/component/trip_detail_app_bar.dart';
import 'package:triffy/view/trip_detail/component/'
    'trip_detail_scrollable_sheet.dart';

class TripDetailSection extends StatefulWidget {
  final PlaceHotelModel placeHotel;

  const TripDetailSection({
    Key? key,
    required this.placeHotel,
  }) : super(key: key);

  @override
  State<TripDetailSection> createState() => _TripDetailSectionState();
}

class _TripDetailSectionState extends State<TripDetailSection> {
  int _activeIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    _pageController.addListener(() {
      setState(() {
        _activeIndex = _pageController.page!.round();
      });
    });
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: colorPrimary,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.15,
          right: size.width * .15,
          bottom: 24.0 * 2,
        ),
        child: CustomButton(
          onPressed: () {},
          text: "Book Now",
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height * .6,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.placeHotel.imageUrl.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.placeHotel.imageUrl[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          CustomSliderIndicator(
            padding: padding,
            indicatorLength: widget.placeHotel.imageUrl.length,
            activeIndex: _activeIndex,
          ),
          TripDetailAppBar(
            size: size,
            padding: padding,
            price: 100.0,
          ),
          TripDetailScrollableSheet(
            placeHotel: widget.placeHotel,
          ),
        ],
      ),
    );
  }
}
