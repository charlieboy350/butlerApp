import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/screens/home/bottom_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buttler/components/common_info_widget.dart';

import 'home/home_screen.dart';

class OrderProcessingScreen extends StatefulWidget {
  @override
  _OrderProcessingScreenState createState() => _OrderProcessingScreenState();
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CommonInfoComponent(
            title: StringConstant.orderComplete,
            subtitle: StringConstant.orderThanks,
            mainButtonText: StringConstant.keepExploring,
            mainButtonPressed: () {
              //TODO redirect to home screen
                // Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => BottomBarScreen()),
                            (Route<dynamic> route) => false);
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkGreyBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                              child: Container(
                    child: SvgPicture.asset(AssetConstant.processingIcon)),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.procesingOrder,
                    style: FontStyles.fontMedium(
                      color: ColorConstant.white,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    StringConstant.giveSeconds,
                    style: FontStyles.fontLight(
                      color: ColorConstant.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
