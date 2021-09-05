import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class QuickInspectionRquestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.inspectionRequest,
        height: 70.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _itemWidget(index);
          },
          itemCount: 3,
          physics: BouncingScrollPhysics(),
        ),
      ),
       bottomNavigationBar: 
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstant.darkGreyBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 8),
                child: ButtonComponent(
                  onPressed: () {
                    
                  },
                  buttonText: StringConstant.bookVisit.toUpperCase(),
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

  _itemWidget(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: index == 0 ? true : false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: CommonComponents.buildServiceCategoryNameWidget(
                StringConstant.reqInspection),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child:
              CommonComponents.inspectionServiceWidget(SizeConfig.screenWidth),
        ),
        Visibility(
          visible: index == 0 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Divider(
              height: 0,
              thickness: 0.3,
              color: ColorConstant.warmGreyTwo,
            ),
          ),
        ),
      ],
    );
  }
}
