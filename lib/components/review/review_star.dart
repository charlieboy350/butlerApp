import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class ReviewStar extends StatelessWidget {
  final bool reviewText;
  final Color reviewTextColor;
  final int reviewStar;
  final int reviewCount;
  final double iconSize;
  final int value;
  final MainAxisAlignment mainAxisAlignment;
  final void Function(int index) onChanged;

  const ReviewStar(
      {Key key,
      this.reviewText,
      this.onChanged,
      this.reviewTextColor = ColorConstant.charcoal,
      this.reviewStar = 0,
      this.value = 0,
      this.reviewCount = 0,
      this.iconSize = 14,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.mainAxisAlignment,
      children: [
        for (var i = 0; i < 5; i++)
          if (reviewStar - 1 >= i)
            Icon(Icons.star, size: iconSize, color: ColorConstant.pissYellow)
          else
            Icon(Icons.star, size: iconSize, color: ColorConstant.silver),
        reviewText == true ? SizedBox(width: 10) : Container(),
        reviewText == true
            ? SizedBox(
                height: 30,
              )
            : Container(),
        reviewText == true
            ? Text(
                "($reviewCount Reviews)",
                style: FontStyles.fontLight(
                    color: reviewTextColor, fontSize: 11.0),
              )
            : Container(),
      ],
    );
  }
}

class StatefulStarRating extends StatelessWidget {
  final double iconSize;
  final MainAxisAlignment mainAxisAlignment;

  const StatefulStarRating({
    Key key,
    this.iconSize = 36,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int rating;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return ReviewStar(
          iconSize: iconSize,
          mainAxisAlignment: mainAxisAlignment,
          onChanged: (index) {
            setState(() {
              rating = index;
            });
          },
          value: rating == null ? 0 : rating,
        );
      },
    );
  }
}
