import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/review/review_star.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Use to view both user and worker reviews
class ReviewsScreen extends StatelessWidget {
  final bool userReview;
  ReviewsScreen({this.userReview = false});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: userReview
          ? SimpleAppBarComponent(
              title: StringConstant.reviews,
              height: 70.0,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
        child: ListView.builder(
          itemCount: 20,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return index == 0
                ? _buildReviewSummaryWidget()
                : _buildGivenReviewItem();
          },
        ),
      ),
    );
  }

  Padding _buildGivenReviewItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          ReviewStar(
            reviewText: false,
            reviewStar: 3,
            reviewCount: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            StringConstant.loremIpsum,
            style: FontStyles.fontRegular(
                color: ColorConstant.greyishBrown),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetConstant.workerProfession,
                  color: ColorConstant.darkGreyBlue),
              SizedBox(
                width: 6,
              ),
              Text(StringConstant.rawElectrition,
                  style: FontStyles.fontRegular(
                      color: ColorConstant.darkGreyBlue, fontSize: 10.0)),
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                AssetConstant.bookingDate,
                height: 11,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                StringConstant.rawDate,
                style: FontStyles.fontRegular(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 0,
            thickness: 0.3,
            color: ColorConstant.warmGreyTwo,
          ),
        ],
      ),
    );
  }

  _buildReviewSummaryWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        userReview ? _buildReviewSummaryTitleWidget() : _buildReviewWidget(),
        SizedBox(
          height: 6,
        ),
        _buildRatingDetailWidget(),
      ],
    );
  }

  Row _buildReviewSummaryTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "11 Reviews",
          style: FontStyles.fontRegular(
              color: ColorConstant.darkGreyBlue, fontSize: 13, bold: true),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "|",
          style: FontStyles.fontLight(
              color: ColorConstant.steel, fontSize: 10),
        ),
        SizedBox(
          width: 8,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "4.69 out of 5.0",
            style: FontStyles.fontLight(
                color: ColorConstant.steel, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Padding _buildRatingDetailWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Row(
                mainAxisAlignment: userReview
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  ReviewStar(
                    reviewText: false,
                    reviewStar: 3,
                    reviewCount: 5,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Text(
                    "38",
                    style: FontStyles.fontRegular(
                        color: ColorConstant.darkGreyBlue,
                        fontSize: 10,
                        bold: true),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "(90.2%)",
                    style: FontStyles.fontRegular(
                        color: ColorConstant.darkGreyBlue,
                        fontSize: 8,
                        bold: true),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 16,
          ),
          Divider(
            height: 0,
            thickness: 0.3,
            color: ColorConstant.warmGreyTwo,
          ),
        ],
      ),
    );
  }

  _buildReviewWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "11 Reviews",
          style: FontStyles.fontRegular(
              color: ColorConstant.darkGreyBlue, fontSize: 13, bold: true),
        ),
        Text(
          StringConstant.rawOutOf,
          style: FontStyles.fontMedium(
              color: ColorConstant.steel, fontSize: 10),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          height: 0,
          thickness: 0.3,
          color: ColorConstant.warmGreyTwo,
        ),
      ],
    );
  }
}
