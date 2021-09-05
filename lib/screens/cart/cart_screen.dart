import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.cart,
        height: 70.0,
      ),
      body: _buildServicesDetailListViewWidget(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 11),
                child: ButtonComponent(
                  onPressed: () {
                    // Navigator.pushNamed(context, RouteConstants.cartScreen);
                  },
                  buttonText: StringConstant.next.toUpperCase(),
                  color: ColorConstant.pissYellow,
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.darkGreyBlue,
                      letterSpacing: 1.3,
                      fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildServicesDetailListViewWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            for (int index = 0; index < 4; index++)
              CommonComponents.buildServicesDetailListItemWidget(index,
                  fromCart: true),
                  SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
            CommonComponents.buildTotalBillingAmountWidget(0, bottomDividerShow: true),     
             SizedBox(
                height: 8,
              ),  
                Divider(
                color: ColorConstant.warmGrey,
              ),    
          ],
        ),
      ),
    );
  }
}
