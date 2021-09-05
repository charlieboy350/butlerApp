import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.bookings,
        titleTextStyle: FontStyles.kateNormalF60WithW400(
            color: ColorConstant.paleGrey, fontSize: 22),
        height: 90.0,
        isBackButton: false,
        isTrailingIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0 || index == 5
                        ? CommonComponents.buildServiceCategoryNameWidget(
                            StringConstant.upcoming)
                        : Container(),
                    _buildServiceListItem(),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteConstants.bookingDetailsScreen);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _buildServiceListItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: SizeConfig.screenHeight / 6,
        decoration: BoxDecoration(
          color: ColorConstant.paleGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonComponents.categoryImageWidget(AssetConstant.flash,
                mainImagePadding: 25),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Plumbing - Geyser',
                        style: FontStyles.fontMedium(
                            color: ColorConstant.darkGreyBlue, fontSize: 14),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AssetConstant.moneyService),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Rs. 550 PKR',
                            style: FontStyles.fontMedium(
                                color: ColorConstant.darkGreyBlue,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetConstant.bookingDate),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '24 November, 2020',
                            style: FontStyles.fontRegular(
                                color: ColorConstant.darkGreyBlue,
                                fontSize: 10.0),
                                textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(AssetConstant.bookingTime),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '6:30 PM',
                            style: FontStyles.fontRegular(
                                color: ColorConstant.darkGreyBlue,
                                fontSize: 10.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: double.infinity,
                  child: SvgPicture.asset(AssetConstant.arrowIcon,
                       color: ColorConstant.darkGreyBlue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
