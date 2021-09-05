import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/bottom_sheet_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotifictionsScreen extends StatefulWidget {
  @override
  _NotifictionsScreenState createState() => _NotifictionsScreenState();
}

class _NotifictionsScreenState extends State<NotifictionsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.notifications,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0 || index == 2
                        ? CommonComponents.buildServiceCategoryNameWidget(
                            StringConstant.today)
                        : Container(),
                    _buildServiceListItem(index),
                  ],
                ),
                onTap: () {
                  BottomSheetComponent.infoOptionBottomSheet(
                    context,
                    title: StringConstant.yourOtpCode,
                    subtitle: StringConstant.youNeedMatch,
                    buttonText: StringConstant.awesome,
                    buttonPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _buildServiceListItem(int index) {
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
            CommonComponents.categoryImageWidget(
                AssetConstant.notifcationSettings,
                newNotification: index == 0 ? true : false),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstant.rawWorker,
                        style: FontStyles.fontMedium(
                            color: ColorConstant.darkGreyBlue, fontSize: 14),
                      ),
                      Text(
                        '2 minutes ago',
                        style: FontStyles.fontMedium(
                            color: ColorConstant.coolGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: double.infinity,
                  child:  SvgPicture.asset(AssetConstant.arrowIcon,
                            height: 14, color: ColorConstant.darkGreyBlue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
