import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessageScreen extends StatefulWidget {
  @override
  _ChatMessageScreenState createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  TextEditingController _chatTextEditingController;

  @override
  void initState() {
    _chatTextEditingController = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.lightGrey,
      // body: Text(StringConstant.home),
      appBar: PreferredSize(
        preferredSize: new Size.fromHeight(110),
        child: SimpleAppBarComponent(
          title: 'Nasir Hussain',
          titleTextStyle: FontStyles.fontMedium(
              color: ColorConstant.paleGrey, fontSize: 16),
          titleIconColor: ColorConstant.kellyGreen,
          titleIconSize: 13,
          secondRowVis: true,
          titleIcon: Icons.circle,
          height: 110.0,
          isBackButton: true,
          isTrailingIcon: false,
          subtile: "Electrician, Joined September 2020",
          isSubTitleIconButtonVis: true,
          subTitleTextStyle: FontStyles.fontLight(
            color: ColorConstant.silver,
            fontSize: 11.0,
          ),
          onTap: () {},
          onTapTrailingButton: () {
            Navigator.pushNamed(context, RouteConstants.notificationScreen);
          },
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       Text('yes'),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                                  reverse: true,
                  shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 9)
                    return _buildUserProfile();
                  else if (index == 8)
                    return _buildRecieverConversatationWidget();
                  else
                    return _buildSenderConversatationWidget();
                },
              ),
            ),
            TextInputComponent(
              title: StringConstant.writeMessage,
              controller: _chatTextEditingController,
              fillColor: ColorConstant.white,
              floatingLabel: false,
              filled: true,
              suffixIcon: SvgPicture.asset(
                AssetConstant.sendMessage,
                height: 5,
                width: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildUserProfile() {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        _chatImageWidget(AssetConstant.profilePlaceHolder),
        SizedBox(
          height: 8,
        ),
        Text(
          "Nasir Hussain",
          style: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue, fontSize: 16.0),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Electrician, Joined September 2020',
          style: FontStyles.fontRegular(
              color: ColorConstant.warmGreyTwo, fontSize: 14.0),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                height: 0,
                thickness: 0.3,
                color: ColorConstant.warmGrey,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "10:48 am",
              style: FontStyles.fontMedium(
                  color: ColorConstant.warmGreyFour, fontSize: 10.0),
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Divider(
                height: 0,
                thickness: 0.3,
                color: ColorConstant.warmGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildRecieverConversatationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth / 5,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 32, 8),
              decoration: BoxDecoration(
                color: ColorConstant.beige,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Text(
                "I’m going to San Francisco and I’mbooking an Airbnb. Would you like tocome? 🤔",
                style: FontStyles.fontRegular(
                    color: ColorConstant.charcoal, fontSize: 14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildSenderConversatationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              AssetConstant.profilePlaceHolder,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 32, 8),
              decoration: BoxDecoration(
                color: ColorConstant.darkGreyBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Text(
                "I’m going to San Francisco and I’mbooking an Airbnb. Would you like tocome? 🤔",
                style: FontStyles.fontRegular(
                    color: ColorConstant.white, fontSize: 14.0),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth / 5,
          ),
        ],
      ),
    );
  }

  Widget _chatImageWidget(String assetName) {
    return Container(
      height: SizeConfig.screenHeight / 9,
      width: SizeConfig.screenWidth / 5.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: SizeConfig.screenWidth / 3.5,
          width: SizeConfig.screenWidth / 3.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Image.asset(
                  AssetConstant.profilePlaceHolder,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
