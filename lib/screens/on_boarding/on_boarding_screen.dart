import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/json/json.constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: JSON.onboarding[pageIndex]["bg_color"],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              // Using Flexible to overcome the screen overflow problem
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    // set page index to current index of page
                    pageIndex = index;
                  });
                },
                children: [
                  // Here I'm calling my image with text method for rendering

                  _centerImageWithText(
                    image: JSON.onboarding[0]["image"],
                    text: JSON.onboarding[0]["text"],
                    subHeadingText: JSON.onboarding[0]["sub_heading_text"],
                  ),
                  _centerImageWithText(
                    image: JSON.onboarding[1]["image"],
                    text: JSON.onboarding[1]["text"],
                    subHeadingText: JSON.onboarding[1]["sub_heading_text"],
                  ),
                  _centerImageWithText(
                    image: JSON.onboarding[2]["image"],
                    text: JSON.onboarding[2]["text"],
                    subHeadingText: JSON.onboarding[2]["sub_heading_text"],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    // Here I'm calling my dot indicator method for redering dot
                    // Also I wrote a ternary condition for changing dots color and its size
                    child: _indicatorDotsWidget(
                        color: i == pageIndex
                            ? JSON.onboarding[pageIndex]["heading_color"]
                            : JSON.onboarding[pageIndex]["disable_dots_color"],
                        width: pageIndex == i ? 24 : 10),
                  ),
              ],
            ),

            //This is our get started button

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ButtonComponent(
                onPressed: () =>
                    {Navigator.pushNamed(context, RouteConstants.login)},
                buttonText: StringConstant.gettingStarted.toUpperCase(),
                color: JSON.onboarding[pageIndex]["button_color"],
                textStyle: FontStyles.fontMedium(
                    color: JSON.onboarding[pageIndex]["button_text_color"],
                    letterSpacing: 1.3,
                    fontSize: 13.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemForPageView(int index) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: JSON.onboarding[index]["bg_color"],
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(
              text: StringConstant.butler,
              textStyle: FontStyles.kateNormalF60WithW400(
                  color: JSON.onboarding[index]["heading_color"]),
            ),
            SizedBox(
              height: 15.6,
            ),
            SizedBox(
              width: SizeConfig.screenWidth / 1.5,
              child: TextComponent(
                text: JSON.onboarding[index]["text"],
                textStyle: FontStyles.fontRegular(
                    color: JSON.onboarding[index]["text_color"]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _centerItemsWidget(index),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ButtonComponent(
                onPressed: () =>
                    {Navigator.pushNamed(context, RouteConstants.login)},
                buttonText: StringConstant.gettingStarted.toUpperCase(),
                color: JSON.onboarding[index]["button_color"],
                textStyle: FontStyles.fontMedium(
                    color: JSON.onboarding[index]["button_text_color"],
                    letterSpacing: 1.3,
                    fontSize: 13.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _centerItemsWidget(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < JSON.onboarding.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: _indicatorDotsWidget(
                    color: i == index
                        ? JSON.onboarding[index]["heading_color"]
                        : JSON.onboarding[index]["disable_dots_color"],
                    width: i == index ? 24 : 8),
              ),
          ],
        ),
        Flexible(child: Image.asset(JSON.onboarding[index]["image"]))
      ],
    );
  }

  // Method for showing image and it's description

  Padding _centerImageWithText(
      {@required String text,
      @required String subHeadingText,
      @required String image}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: FontStyles.fontMedium(
                color: JSON.onboarding[pageIndex]["heading_color"],
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            subHeadingText,
            textAlign: TextAlign.center,
            style: FontStyles.fontRegular(
                color: JSON.onboarding[pageIndex]["sub_heading_color"],
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Container _indicatorDotsWidget(
      {@required Color color, @required double width}) {
    return Container(
      height: 8,
      width: width,
      decoration: new BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
