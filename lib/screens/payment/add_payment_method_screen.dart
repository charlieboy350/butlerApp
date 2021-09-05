import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/custom_radio_button.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  List<RadioModel> radioButtonList = new List<RadioModel>();
  TextEditingController _cardHolderNameController;
  TextEditingController _cardNumberController;
  TextEditingController _cardExpiryDateController;
  TextEditingController _cardVerficationController;

  @override
  void initState() {
    super.initState();
    radioButtonList.add(new RadioModel(true, AssetConstant.masterCard, null));
    radioButtonList.add(new RadioModel(false, AssetConstant.visa, null));
    radioButtonList.add(new RadioModel(false, AssetConstant.paypal, null));
    radioButtonList
        .add(new RadioModel(false, AssetConstant.americanExpress, null));

    _cardHolderNameController = new TextEditingController();
    _cardNumberController = new TextEditingController();
    _cardExpiryDateController = new TextEditingController();
    _cardVerficationController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.addPaymentMethod,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.paymentGateWay),
              SizedBox(
                height: 10,
              ),
              CustomRadioButton(
                sizeConfig: SizeConfig(),
                radioButtonList: radioButtonList,
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
                height: 10,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.cardInfo),
              SizedBox(
                height: 10,
              ),
              TextInputComponent(
                title: StringConstant.cardHolderName,
                controller: _cardHolderNameController,
                fillColor: ColorConstant.paleGrey,
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputComponent(
                title: StringConstant.cardNumber,
                controller: _cardNumberController,
                fillColor: ColorConstant.paleGrey,
                textInputType: TextInputType.phone,
                prefixIcon: SvgPicture.asset(
                  AssetConstant.bookingDate,
                  height: 5,
                  width: 5,
                ),
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputComponent(
                title: StringConstant.expiryDate,
                controller: _cardExpiryDateController,
                fillColor: ColorConstant.paleGrey,
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputComponent(
                title: StringConstant.cvv,
                controller: _cardVerficationController,
                fillColor: ColorConstant.paleGrey,
                filled: true,
                textInputType: TextInputType.phone,
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
          buttonText: StringConstant.addPaymentMethod.toUpperCase(),
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
