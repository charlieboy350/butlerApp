import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.termsConditions,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [           
            SizedBox(
              height: 10,
            ),
            Text(
              StringConstant.loremIpsum,
              style: FontStyles.fontRegular(
                color: ColorConstant.darkGreyBlue,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
