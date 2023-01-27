import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';
import 'package:triffy/common/helper/round_border_helper.dart';

class ThemeHelper {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        primaryColor: colorPrimary,
        secondaryHeaderColor: colorPrimary,
        appBarTheme: AppBarTheme(
          color: colorPrimary,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
          iconTheme: const IconThemeData(
            color: colorWhite,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: RoundBorderHelper.outlineInputBorder(),
          focusedBorder: RoundBorderHelper.outlineInputBorder(),
        ),
        cardTheme: CardTheme(
          color: colorLightPrimary,
          shadowColor: colorPrimary,
          shape: RoundBorderHelper.roundedRectangleBorder(
            radius: radiusMedium,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundBorderHelper.roundedRectangleBorder(),
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundBorderHelper.roundedRectangleBorder(),
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: colorPrimary,
          secondary: colorPrimary,
        )
            .copyWith(
              error: colorError,
            )
            .copyWith(
              secondary: colorAccent,
            ),
      );

  static void setStatusBarStyle(
          {Color statusBarColor = colorPrimary,
          Brightness statusBarBrightness = Brightness.light}) =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: colorPrimary,
          statusBarIconBrightness: statusBarBrightness));
}
