import 'package:flutter/material.dart';
import 'package:triffy/common/const/color_const.dart';
import 'package:triffy/model/network/place_model.dart';

class TripDetailDescriptionSection extends StatefulWidget {
  final double padding;
  final PlaceModel place;

  const TripDetailDescriptionSection({
    Key? key,
    required this.padding,
    required this.place,
  }) : super(key: key);

  @override
  State<TripDetailDescriptionSection> createState() =>
      _TripDetailDescriptionSectionState();
}

class _TripDetailDescriptionSectionState
    extends State<TripDetailDescriptionSection> {
  int _maxLines = 3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: widget.padding),
      decoration: const BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(
              Icons.drag_handle_rounded,
              color: colorAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: widget.padding * 0.5,
              bottom: widget.padding * 0.01,
              left: widget.padding,
              right: widget.padding,
            ),
            child: Text(
              widget.place.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorWhite,
                  ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: widget.padding * 0.01,
              bottom: widget.padding * 0.02,
              left: widget.padding,
              right: widget.padding,
            ),
            child: Text(
              widget.place.country,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorAsh,
                  ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            padding: EdgeInsets.only(
              top: widget.padding * 0.01,
              bottom: widget.padding * 0.5,
              left: widget.padding,
              right: widget.padding,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: colorWhite,
                ),
                Text(
                  widget.place.time,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorAsh,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.padding,
            ),
            child: Text(
              widget.place.description,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: colorAsh,
                  ),
              maxLines: _maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.padding * .5,
              horizontal: widget.padding,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_maxLines == 3) {
                    _maxLines = 10;
                  } else {
                    _maxLines = 3;
                  }
                });
              },
              child: Text(
                _maxLines == 3 ? "Show more" : "Show less",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: colorAccent,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
