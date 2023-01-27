import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

class CustomSliderIndicator extends StatelessWidget {
  const CustomSliderIndicator({
    Key? key,
    required this.padding,
    required this.indicatorLength,
    required this.activeIndex,
  }) : super(key: key);

  final double padding;
  final int indicatorLength;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: padding * 2,
        ),
        child: SliderIndicator(
          length: indicatorLength,
          activeIndex: activeIndex,
          indicator: const Icon(
            Icons.radio_button_unchecked,
            color: colorAccent,
          ),
          activeIndicator: const Icon(
            Icons.fiber_manual_record,
            color: colorAccent,
          ),
        ),
      ),
    );
  }
}
