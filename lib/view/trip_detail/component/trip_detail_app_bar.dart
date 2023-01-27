import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/common/const/dimen_const.dart';

class TripDetailAppBar extends StatelessWidget {
  const TripDetailAppBar({
    Key? key,
    required this.size,
    required this.padding,
    required this.price,
  }) : super(key: key);

  final Size size;
  final double padding;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(
            padding,
            padding * 2,
            padding,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radiusLarge,
            ),
            color: colorAccent,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            padding,
            padding * 2,
            padding,
            0,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                radiusLarge,
              ),
              right: Radius.circular(
                radiusLarge,
              ),
            ),
            color: colorAccent,
          ),
          child: Padding(
            padding: EdgeInsets.all(padding * .4),
            child: Text(
              "1000 BDT",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: colorWhite,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
