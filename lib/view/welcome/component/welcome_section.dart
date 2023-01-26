import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/view/welcome/component/welcome_background.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(
              marginLarge,
            ),
            child: Text(
              "Welcome To Triffy",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorWhite,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            margin: const EdgeInsets.all(
              marginLarge,
            ),
            child: Image.asset(
              "assets/images/welcome.png",
              height: size.height * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
