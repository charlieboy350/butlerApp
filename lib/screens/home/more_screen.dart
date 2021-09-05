import 'package:buttler/components/app_bars/review_app_bar_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/common_info_widget.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/json/json.constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: ReviewAppBarComponent(
        title: StringConstant.bookingDetail,
        height: 128.0,
        isTrailingIcon: true,
        onTap: () {
          Navigator.pushNamed(context, RouteConstants.editProfileScreen);
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              for (int index = 0; index < JSON.profile.length; index++)
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: CommonComponents.buildRoundedHeadingWidget(
                      leadingIcon: JSON.profile[index]["iconLeading"],
                      title: JSON.profile[index]["name"],
                      height: SizeConfig.screenHeight,
                      trailingIcon: AssetConstant.arrowIcon,
                      tapMe: () {
                        _handleClickMoreItem(
                          context, JSON.profile[index]["navigation"]);
                      }),
                ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    StringConstant.logout,
                    style: FontStyles.fontRegular(
                        color: ColorConstant.darkGreyBlue, underLine: true),
                  ),
                ),
                onTap: () {
                  print('yes');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleClickMoreItem(context, String routeName) {
    switch (routeName) {
       case RouteConstants.quickInspectionScreen:
        Navigator.pushNamed(context, routeName, arguments: true);
        break;
      case RouteConstants.reviewsScreen:
        Navigator.pushNamed(context, routeName, arguments: true);
        break;
      case RouteConstants.myAddressessScreen:
        Navigator.pushNamed(context, routeName);
        break;
      case RouteConstants.paymentMethodScreen:
        Navigator.pushNamed(context, routeName);
        break;
      case RouteConstants.verificationGuideLineScreen:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommonInfoComponent(
              title: StringConstant.weNeedMoreInfo,
              subtitle: StringConstant.toCompleteVerification,
              desc: StringConstant.thisInfo,
              mainButtonText: StringConstant.letAdd,
              mainButtonPressed: () {
                Navigator.pushNamed(
                    context, RouteConstants.verificationUserScreen,
                    arguments: true);
              },
              secondButtonText: StringConstant.iWillLater,
              secondButtonPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        break;
      case RouteConstants.supportScreen:
        Navigator.pushNamed(context, routeName);
        break;
    }
  }
}
