import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class SelectTimingsScreen extends StatefulWidget {
  @override
  _SelectTimingsScreenState createState() => _SelectTimingsScreenState();
}

class _SelectTimingsScreenState extends State<SelectTimingsScreen> {
  ScrollController _scrollServiceDateController;
  ScrollController _scrollServiceTimeController;

  @override
  void initState() {
    super.initState();
    _scrollServiceDateController = new ScrollController();
    _scrollServiceTimeController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.selectDateTime,
        height: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonComponents.buildServiceCategoryNameWidget(
                StringConstant.chooseServiceDate),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 16),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenWidth / 6,
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollServiceDateController,
                thickness: 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: _scrollServiceDateController,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildServiceDate(index,
                          title: StringConstant.today,
                          subTitle: StringConstant.rawSept),
                    );
                  },
                ),
              ),
            ),
            CommonComponents.buildServiceCategoryNameWidget(
                StringConstant.chooseTime),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollServiceTimeController,
                thickness: 4,
                child: GridView.count(
                  controller: _scrollServiceTimeController,
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  children: <Widget>[
                    for (int index = 0; index < 25; index++)
                      // Container(
                      //   padding: const EdgeInsets.all(8),
                      //   child: const Text("He'd have you all unravel at the"),
                      //   color: Colors.teal[100],
                      // ),
                      _buildServiceTime(index,
                          title: StringConstant.today,
                          subTitle: StringConstant.rawSept),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: ButtonComponent(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.choosePaymentMethodScreen);
          },
          buttonText: StringConstant.next.toUpperCase(),
          color: ColorConstant.pissYellow,
          textStyle: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue,
              letterSpacing: 1.3,
              fontSize: 13.0),
        ),
      ),
    );
  }

  _buildServiceDate(index, {String title, String subTitle}) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 4),
      width: SizeConfig.screenWidth / 4.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: FontStyles.fontLight(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 12,
                ),
              ),
              Text(
                subTitle,
                style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 12,
                ),
              )
            ],
          ),
          Positioned(
            right: 4,
            top: 4,
            child: CommonComponents.buildSelectedButton(),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: ColorConstant.paleGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    );
  }

  _buildServiceTime(index, {String title, String subTitle}) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 4),
      width: SizeConfig.screenWidth / 2,
      height: SizeConfig.screenWidth / 4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: FontStyles.fontLight(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 12,
                ),
              ),
              Text(
                subTitle,
                style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue,
                  fontSize: 12,
                ),
              )
            ],
          ),
          Positioned(
            right: 4,
            top: 4,
            child: CommonComponents.buildSelectedButton(),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: ColorConstant.paleGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    );
  }
}
