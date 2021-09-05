import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/bottom_sheet_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class PaymentMethodDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.paymentMethodDetails,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDetailWidget(
                StringConstant.cardHolderName, 'Joseph Butler'),
            _buildCardDetailWidget(
              StringConstant.cardNumber,
              '**** 9965',
            ),
            _buildCardDetailWidget(
              StringConstant.expiryDate,
              '11/23',
            ),
            _buildCardDetailWidget(
              StringConstant.cvv,
              '****',
            ),
            SizedBox(
              height: 30,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    StringConstant.deletePaymentMethod.toUpperCase(),
                    style: FontStyles.fontRegular(
                        color: ColorConstant.colorRed, underLine: true),
                  ),
                ),
                onTap: () {
                  BottomSheetComponent.twoOptionBottomSheet(context,
                      title: StringConstant.sureDeletePayment,
                      btnPositivedPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, btnNagativePressed: () {
                    Navigator.pop(context);
                  });
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Padding _buildCardDetailWidget(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 11, bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FontStyles.fontRegular(
              color: ColorConstant.darkGreyBlue,
              fontSize: 14,
              bold: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: FontStyles.fontRegular(
              color: ColorConstant.darkGreyBlue,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
