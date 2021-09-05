import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _fullNameTextEditingConrtroller;
  TextEditingController _mobileNumberTextEditingConrtroller;
  @override
  void initState() {
    super.initState();
    _fullNameTextEditingConrtroller = new TextEditingController();
    _mobileNumberTextEditingConrtroller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      color: ColorConstant.darkGreyBlue,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      color: ColorConstant.lightGrey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: SizeConfig.screenWidth,
                    decoration: new BoxDecoration(
                      color: ColorConstant.darkGreyBlue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.6, right: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            child: TextComponent(
                              text: StringConstant.signup,
                              textStyle: FontStyles.kateMediumF25WithW400(
                                  color: ColorConstant.white),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                            ),
                            child: Image.asset(
                              AssetConstant.loginLogo,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      decoration: new BoxDecoration(
                          color: ColorConstant.lightGrey,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 72,
                            ),
                            TextInputComponent(
                              title: StringConstant.fullName,
                              controller: _fullNameTextEditingConrtroller,
                              fillColor: ColorConstant.paleGrey,
                              filled: true,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextInputComponent(
                              title: StringConstant.mobileNumber,
                              controller: _mobileNumberTextEditingConrtroller,
                              fillColor: ColorConstant.paleGrey,
                              floatingLabel: false,
                              filled: true,
                              prefixIcon: SvgPicture.asset(
                                AssetConstant.pakistanIcon,
                                height: 5,
                                width: 5,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            ButtonComponent(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteConstants.otpVerification);
                              },
                              buttonText: StringConstant.signup.toUpperCase(),
                              color: ColorConstant.pissYellow,
                              textStyle: FontStyles.fontMedium(
                                  color: ColorConstant.darkGreyBlue,
                                  letterSpacing: 1.3,
                                  fontSize: 13.0),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 53.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'By Signing in, you agree to Butler’s',
                                  style: FontStyles.fontLight(
                                    color: ColorConstant.charcoal,
                                    fontSize: 10,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Terms & Conditions',
                                      style: FontStyles.fontMedium(
                                        color: ColorConstant.darkGreyBlue,
                                        fontSize: 11,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                          Navigator.of(context).pushNamed(
                                              RouteConstants
                                                  .privacyPolicyScreen);
                                        },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
