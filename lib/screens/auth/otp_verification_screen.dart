import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/bottom_sheet_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController _otpTextEditingController;
  @override
  void initState() {
    super.initState();
    _otpTextEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarComponent(
        title: StringConstant.otpVerification,
        height: 128.0,
        titleCenter: false,
      ),
      body: Container(
        color: ColorConstant.lightGrey,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextComponent(
              text: StringConstant.pleaseEnterOtpCode,
              textStyle: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 15.0),
            ),
            SizedBox(
              height: 10,
            ),
            TextComponent(
              text: StringConstant.checkOtp,
              textStyle: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: PinCodeTextField(
                      appContext: context,
                      controller: _otpTextEditingController,
                      backgroundColor: ColorConstant.lightGrey,
                      keyboardType: TextInputType.number,
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                          fieldHeight: 72,
                          fieldWidth: 61.8,
                          inactiveFillColor: ColorConstant.paleGrey,
                          selectedColor: ColorConstant.darkGreyBlue,
                          selectedFillColor: ColorConstant.paleGrey,
                          activeFillColor: ColorConstant.paleGrey,
                          borderRadius: BorderRadius.circular(5),
                          activeColor: ColorConstant.darkGreyBlue,
                          inactiveColor: ColorConstant.paleGrey,
                          shape: PinCodeFieldShape.box),
                      autoFocus: false,
                      animationCurve: Curves.easeIn,
                      length: 4,
                      onChanged: (value) {}),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonComponent(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.bottomBarScreen);
                  },
                  buttonText: StringConstant.verify.toUpperCase(),
                  color: ColorConstant.pissYellow,
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.darkGreyBlue,
                      letterSpacing: 1.3,
                      fontSize: 13.0)),
            ),
            SizedBox(
              height: 31,
            ),
            InkWell(
              child: TextComponent(
                text: StringConstant.resendOTP,
                textStyle: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue, fontSize: 15.0),
              ),
              onTap: () {
                BottomSheetComponent.infoOptionBottomSheet(
                  context,
                  subtitle: StringConstant.checkOtp,
                  buttonText: StringConstant.awesome,
                  buttonPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
