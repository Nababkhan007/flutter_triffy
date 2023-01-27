import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/widget/custom_button.dart';
import 'package:triffy/common/widget/custom_slider_indicator.dart';
import 'package:triffy/view/trip_detail/component/trip_detail_app_bar.dart';
import 'package:triffy/view/trip_detail/component/'
    'trip_detail_scrollable_sheet.dart';

class TripDetailSection extends StatefulWidget {
  const TripDetailSection({Key? key}) : super(key: key);

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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://images.unsplash.com/photo-1623941000186-afafbcf"
                  "b65e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wY"
                  "WdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          CustomSliderIndicator(
            padding: padding,
            indicatorLength: 3,
            activeIndex: _activeIndex,
          ),
          TripDetailAppBar(
            size: size,
            padding: padding,
            price: 100.0,
          ),
          const TripDetailScrollableSheet(),
        ],
      ),
    );
  }
}
