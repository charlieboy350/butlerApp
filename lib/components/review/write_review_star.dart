import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({
    Key key,
    this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ColorConstant.reviewStarColor;

    final size = 36.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: onChanged != null
              ? () {
                  onChanged(value == index + 1 ? index : index + 1);
                }
              : null,
          color: index < value ? color : null,
          iconSize: size,
          icon: SvgPicture.asset(
            index < value //
                ? filledStar ?? AssetConstant.starEnable
                : unfilledStar ?? AssetConstant.starDisable,
          ),
          padding: EdgeInsets.zero,
          tooltip: '${index + 1} of 5',
        );
      }),
    );
  }
}

class StatefulWrtieReviewStarRating extends StatelessWidget {
  final double iconSize;
  final MainAxisAlignment mainAxisAlignment;

  const StatefulWrtieReviewStarRating({
    Key key,
    this.iconSize = 36,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int rating;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return StarRating(
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
