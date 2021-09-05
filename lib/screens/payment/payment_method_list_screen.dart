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

class PaymentMethodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.paymentMethod,
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
                title: StringConstant.addNewPayment,
                height: SizeConfig.screenHeight,
                trailingIcon: AssetConstant.arrowIcon,
                bookingCompleted: true,
                tapMe: () {
                  Navigator.pushNamed(
                      context, RouteConstants.addPaymentMethodScreen);
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
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: CommonComponents.buildAddedAddressWidget(index,
                        serviceTitle: "**** 9965 | Expires on 11/23"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.paymentMethodDetailsScreen);
                  },
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
          textStyle: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue,
              letterSpacing: 1.3,
              fontSize: 13.0),
        ),
      ),
    );
  }
}
