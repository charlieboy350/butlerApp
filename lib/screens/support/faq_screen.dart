import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.faq,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: InkWell(
                  child: CommonComponents.buildRoundedHeadingWidget(
                    title: 'Serivce Etiqutte',
                    height: SizeConfig.screenHeight,
                    trailingIcon: AssetConstant.arrowIcon,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.faqDetailScreen);
                  },
                ),
              );
            }),
      ),
    );
  }
}
