import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../review/review_star.dart';

class ReviewAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtile;
  final double height, bottomLeftRadius, bottomRightRadius;
  final Color color;
  final void Function() onTapBackButton;
  final bool isTrailingIcon;
  final bool isBackButton;
  final GestureTapCallback onTap;
  ReviewAppBarComponent(
      {@required this.title,
      this.height = 25.0,
      this.color = ColorConstant.darkGreyBlue,
      this.bottomLeftRadius = 0.0,
      this.bottomRightRadius = 50.0,
      this.subtile = "",
      this.onTapBackButton,
      this.isTrailingIcon = false,
      this.isBackButton = true,
      this.onTap});
  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: ColorConstant.lightGrey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(bottomLeftRadius),
                      bottomRight: Radius.circular(bottomRightRadius))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Container(
                          height: SizeConfig.screenWidth / 5,
                          width: SizeConfig.screenWidth / 5,
                          // height: 150,
                          // width : 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Image.asset(
                              AssetConstant.profilePlaceHolder,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Taha Irshad',
                                  style: FontStyles.fontMedium(
                                      color: ColorConstant.silver,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Center(
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorConstant.kellyGreen,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.done,
                                            size: 12,
                                            color: ColorConstant.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              StringConstant.memberSince,
                              style: FontStyles.fontLight(
                                  color: ColorConstant.paleGrey, fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            ReviewStar(
                              reviewText: true,
                              reviewStar: 3,
                              reviewCount: 5,
                              reviewTextColor: ColorConstant.white,
                              iconSize: 16,
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(AssetConstant.arrowIcon,
                            height: 25, color: ColorConstant.white),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(height);
}
