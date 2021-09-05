import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/custom_radio_button.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class ChoosePaymentMethodScreen extends StatefulWidget {
  @override
  _ChoosePaymentMethodScreenState createState() =>
      _ChoosePaymentMethodScreenState();
}

class _ChoosePaymentMethodScreenState extends State<ChoosePaymentMethodScreen> {
  List<RadioModel> radioButtonList = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    radioButtonList.add(new RadioModel(
        true, AssetConstant.moneyService, StringConstant.cashPayment));
    radioButtonList.add(new RadioModel(
        false, AssetConstant.creditCard, StringConstant.addNewDebit));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.paymentMethod,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonComponents.buildServiceCategoryNameWidget(
                StringConstant.choosePayment),
            SizedBox(
              height: 10,
            ),
            CustomRadioButton(
              titleStyle: FontStyles.fontRegular(
                color: ColorConstant.darkGreyBlue,
                fontSize: 12,
              ),
              iconHeight: 20,
              sizeConfig: SizeConfig(),
              iconColor: ColorConstant.darkGreyBlue,
              radioButtonList: radioButtonList,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonComponent(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.orderProcessingScreen);
            },
            buttonText: StringConstant.next.toUpperCase(),
            color: ColorConstant.pissYellow,
            textStyle: FontStyles.fontMedium(
                color: ColorConstant.darkGreyBlue,
                letterSpacing: 1.3,
                fontSize: 13.0)),
      ),
    );
  }
}
