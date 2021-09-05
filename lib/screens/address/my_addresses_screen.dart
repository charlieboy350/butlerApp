import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class MyAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.myAddresses,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 4),
          child: Column(
            children: [
              CommonComponents.buildRoundedHeadingWidget(
                // leadingIcon:,
                title: StringConstant.addNewAddress,
                height: SizeConfig.screenHeight,
                trailingIcon: AssetConstant.arrowIcon,
                bookingCompleted: true,
                tapMe: () {
                  Navigator.pushNamed(context, RouteConstants.addAddressScreen);
                },
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 0,
                thickness: 0.3,
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 16,
              ),
              for (int index = 0; index < 3; index++)
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: CommonComponents.buildAddedAddressWidget(index,
                      onTap: () {
                        
                      }),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 8),
        child: ButtonComponent(
          onPressed: () {
            // Navigator.pushNamed(context, RouteConstants.cartScreen);
          },
          buttonText: StringConstant.saveChanges.toUpperCase(),
          color: ColorConstant.pissYellow,
          border: 30,
          textStyle: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue,
              letterSpacing: 1.3,
              fontSize: 13.0),
        ),
      ),
    );
  }
}
