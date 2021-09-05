import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _fullNameTextEditingController,
      _mobileNumTextEditingController;
  TextEditingController _emailAddressTextEditingController;
  @override
  void initState() {
    super.initState();
    _fullNameTextEditingController = new TextEditingController();
    _emailAddressTextEditingController = new TextEditingController();
    _emailAddressTextEditingController = new TextEditingController();
    _mobileNumTextEditingController = new TextEditingController();
    _mobileNumTextEditingController.text = "+92 333 1234567";
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.editProfile,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.screenWidth / 3.5,
                      width: SizeConfig.screenWidth / 3.5,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Image.asset(
                              AssetConstant.profilePlaceHolder,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.pissYellow,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            AssetConstant.editProfile,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextInputComponent(
                title: StringConstant.fullName,
                controller: _fullNameTextEditingController,
                fillColor: ColorConstant.paleGrey,
                floatingLabel: false,
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputComponent(
                title: StringConstant.emailAdd,
                controller: _emailAddressTextEditingController,
                fillColor: ColorConstant.paleGrey,
                floatingLabel: false,
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputComponent(
                title: StringConstant.mobileNumber,
                controller: _mobileNumTextEditingController,
                fillColor: ColorConstant.paleGrey,
                floatingLabel: false,
                enabled: false,
                filled: true,
                prefixIcon: SvgPicture.asset(
                  AssetConstant.pakistanIcon,
                  height: 5,
                  width: 5,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonComponent(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.otpVerification);
          },
          buttonText: StringConstant.saveChanges.toUpperCase(),
          color: ColorConstant.pissYellow,
          textStyle: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue,
              letterSpacing: 1.3,
              fontSize: 13.0),
        ),
      ),
    );
  }
}
