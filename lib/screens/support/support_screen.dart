import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/json/json.constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.support,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.pissYellow, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(AssetConstant.supportUs),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                StringConstant.atYourService,
                style: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue, fontSize: 20.0),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  StringConstant.ourCustomer,
                  textAlign: TextAlign.center,
                  style: FontStyles.fontRegular(
                      color: ColorConstant.darkGreyBlue, fontSize: 12.0),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                StringConstant.serviceTimings,
                style: FontStyles.fontRegular(
                    color: ColorConstant.warmGreyTwo, fontSize: 12.0),
              ),
              SizedBox(
                height: 50,
              ),
              for (int index = 0; index < JSON.support.length; index++)
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: InkWell(
                    child: CommonComponents.buildRoundedHeadingWidget(
                      leadingIcon: JSON.support[index]["iconLeading"],
                      leadingIconType: index == 1 ? Icons.email_outlined : null,
                      title: JSON.support[index]["name"],
                      height: SizeConfig.screenHeight,
                      trailingIcon: AssetConstant.arrowIcon,
                    ),
                    onTap: () {
                      _handleClickSupporItem(
                          context, JSON.support[index]["navigation"]);
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});
  _handleClickSupporItem(context, String routeName) async {
    switch (routeName) {
      case RouteConstants.chatScreen:
        Navigator.pushNamed(context, routeName);
        break;
      case RouteConstants.myAddressessScreen:
        await UrlLauncher.launch(_emailLaunchUri.toString());

        break;
      case RouteConstants.paymentMethodScreen:
        await UrlLauncher.launch("tel://021 111 123456");
        break;
      case RouteConstants.faqScreen:
        Navigator.pushNamed(context, routeName);
        break;
    }
  }
}
