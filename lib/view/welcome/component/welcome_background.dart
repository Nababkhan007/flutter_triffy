import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;

  const WelcomeBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                right: 0,
                height: size.height * 0.1,
                width: size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Image.asset(
                    "assets/icons/curve_arrow_down.png",
                    color: colorWhite,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                height: size.height * 0.1,
                width: size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Image.asset(
                    "assets/icons/curve_arrow_up.png",
                    color: colorWhite,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
