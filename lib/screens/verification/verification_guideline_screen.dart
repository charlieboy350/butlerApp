import 'package:buttler/components/button_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/enum/enum_verify.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationGuideLine extends StatefulWidget {
  //same screen will be call before and after
  final EnumVerify enumVerify;
  VerificationGuideLine({this.enumVerify});
  @override
  _VerificationGuideLineState createState() => _VerificationGuideLineState();
}

class _VerificationGuideLineState extends State<VerificationGuideLine> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 72,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(AssetConstant.supportUs),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                StringConstant.weNeedMoreInfo,
                textAlign: TextAlign.center,
                style: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue, fontSize: 23.0),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      StringConstant.toCompleteVerification,
                      textAlign: TextAlign.center,
                      style: FontStyles.fontRegular(
                          color: ColorConstant.charcoal, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      StringConstant.thisInfo,
                      textAlign: TextAlign.center,
                      style: FontStyles.fontRegular(
                          color: ColorConstant.warmGreyThree, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonComponent(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteConstants.verificationUserScreen,
                      arguments: true); 
                },
                buttonText: StringConstant.letAdd.toUpperCase(),
                color: ColorConstant.pissYellow,
                textStyle: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue,
                    letterSpacing: 1.3,
                    fontSize: 13.0),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  StringConstant.iWillLater,
                  textAlign: TextAlign.center,
                  style: FontStyles.fontMedium(
                      color: ColorConstant.darkGreyBlue, fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
