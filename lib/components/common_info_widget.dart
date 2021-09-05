import 'dart:ui';

import 'package:buttler/components/button_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonInfoComponent extends StatefulWidget {
  final String title, subtitle, desc, mainButtonText, secondButtonText;
  final bool secondButtonVis;
  final void Function() mainButtonPressed;
  final void Function() secondButtonPressed;

  CommonInfoComponent(
      {this.title,
      this.subtitle,
      this.desc,
      this.mainButtonText,
      this.secondButtonText,
      this.secondButtonVis,
      this.mainButtonPressed,
      this.secondButtonPressed});
  @override
  _CommonInfoComponentState createState() => _CommonInfoComponentState();
}

class _CommonInfoComponentState extends State<CommonInfoComponent> {
  @override
  Widget build(BuildContext context) {
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
                  child: Opacity(
                    opacity: 0,
                    child: SvgPicture.asset(AssetConstant.supportUs),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                widget.title,
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
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: FontStyles.fontRegular(
                          color: ColorConstant.charcoal, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: widget.desc != null ? true : false,
                      child: Text(
                        StringConstant.thisInfo,
                        textAlign: TextAlign.center,
                        style: FontStyles.fontRegular(
                            color: ColorConstant.warmGreyThree, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonComponent(
                onPressed: widget.mainButtonPressed,
                //  () {
                //   Navigator.pushNamed(
                //       context, RouteConstants.verificationPicScreen,
                //       arguments: true);
                // },
                buttonText: widget.mainButtonText.toUpperCase(),
                color: ColorConstant.pissYellow,                
                textStyle: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue,
                    letterSpacing: 1.3,
                    fontSize: 13.0),
              ),
              SizedBox(
                height: 22,
              ),
              Visibility(
                visible: widget.secondButtonText != null ? true : false,
                child: InkWell(
                  onTap: widget.secondButtonPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      StringConstant.iWillLater,
                      textAlign: TextAlign.center,
                      style: FontStyles.fontMedium(
                          color: ColorConstant.darkGreyBlue, fontSize: 13.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
