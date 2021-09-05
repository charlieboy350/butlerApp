import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/json/json.constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class FaqDetailScreen extends StatefulWidget {
  @override
  _FaqDetailScreenState createState() => _FaqDetailScreenState();
}

class _FaqDetailScreenState extends State<FaqDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        // _faqBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.faq,
        height: 70.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Serivce Etiqutte',
                  style: FontStyles.fontRegular(
                      color: ColorConstant.darkGreyBlue,
                      fontSize: 14.0,
                      bold: true),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstant.loremIpsum,
                  style: FontStyles.fontRegular(
                    color: ColorConstant.darkGreyBlue,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          _faqBottomSheetItem(),
        ],
      ),
    );
  }

  _faqBottomSheetItem() {
    return Container(
      color: ColorConstant.white,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            StringConstant.notHelpful,
            style: FontStyles.fontRegular(
                color: ColorConstant.darkGreyBlue, fontSize: 14.0, bold: true),
          ),
          SizedBox(
            height: 11,
          ),
          for (int index = 0; index < 3; index++)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: InkWell(
                child: CommonComponents.buildRoundedHeadingWidget(
                  leadingIcon: JSON.support[index]["iconLeading"],
                  title: JSON.support[index]["name"],
                  leadingIconType: index == 1 ? Icons.email_outlined : null,
                  height: SizeConfig.screenHeight,
                  trailingIcon: AssetConstant.arrowIcon,
                ),
                onTap: () {
                  if (index == 1) {
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  _faqBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: ColorConstant.white,
      context: context,
      builder: (BuildContext context) {
        return _faqBottomSheetItem();
      },
    );
  }
}
