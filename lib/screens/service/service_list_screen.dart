import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceListScreen extends StatefulWidget {
  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: "Service List",
        height: 70.0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(top: index == 0 ? 8 : 0, left: 16, right: 16.0),
            child: InkWell(
              child: _buildServiceListItem(index),
              onTap: () {
                Navigator.pushNamed(
                    context, RouteConstants.serviceListDetailScreen);
              },
            ),
          );
        },
      ),
    );
  }

  Padding _buildServiceListItem(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: SizeConfig.screenHeight / 9.5,
        decoration: BoxDecoration(
          color: ColorConstant.paleGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonComponents.categoryImageListWidget(index % 2 == 0
                ? AssetConstant.categoryOne
                : AssetConstant.categoryTwo),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    index % 2 == 0 ? 
                    
                    'Geyser' : "Pipes",
                      style: FontStyles.fontMedium(
                          color: ColorConstant.darkGreyBlue, fontSize: 14)),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    AssetConstant.arrowIcon,
                    height: 14,
                    color: ColorConstant.darkGreyBlue,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
