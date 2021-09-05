import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/json/json.constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingOldScreen extends StatefulWidget {
  @override
  _OnboardingOldScreenState createState() => _OnboardingOldScreenState();
}

class _OnboardingOldScreenState extends State<OnboardingOldScreen> {
  final pageController = PageController(initialPage: 0);
  int pageIndex = 0;



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView(
        children: [
          itemForPageView(0),
          itemForPageView(1),
          itemForPageView(2),
        ],
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
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
                        fontSize: 13.0)))
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

// ListView.builder(
//           itemCount: JSON.onboarding.length,
//           scrollDirection: Axis.horizontal,
//           physics: BouncingScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Container(
//                 height: SizeConfig.screenHeight,
//                 width: SizeConfig.screenWidth,
//                 color: JSON.onboarding[index]["bg_color"],
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16.0, top: 56),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextComponent(
//                         text: StringConstant.butler,
//                         textStyle: FontStyles.kateNormalF60WithW400(
//                             color: JSON.onboarding[index]["heading_color"]),
//                       ),
//                       SizedBox(
//                         height: 15.6,
//                       ),
//                       SizedBox(
//                         width: SizeConfig.screenWidth / 1.5,
//                         child: TextComponent(
//                           text: JSON.onboarding[index]["text"],
//                           textStyle: FontStyles.heeboNormalF12WithW400(
//                               color: JSON.onboarding[index]["text_color"]),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       _centerItemsWidget(index),
//                       Spacer(),
//                       Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 20),
//                           child: ButtonComponent(
//                               onPressed: () => {
//                                     Navigator.pushNamed(
//                                         context, RouteConstants.login)
//                                   },
//                               buttonText:
//                                   StringConstant.gettingStarted.toUpperCase(),
//                               color: JSON.onboarding[index]["button_color"],
//                               border: 20,
//                               textStyle: FontStyles.heeboNormalF13WithW500(
//                                   color: JSON.onboarding[index]
//                                       ["button_text_color"],
//                                   letterSpacing: 1.3)))
//                     ],
//                   ),
//                 ));
//           }),
// AnimatedSwitcher(
//         transitionBuilder: (Widget child, Animation<double> animation) {
//           return ScaleTransition(
//             scale: animation,
//             child: child,
//           );
//         },
//         duration: Duration(milliseconds: 500),
//         child: Consumer<OnBoardingProvider>(
//             builder: (context, consumer, childWidget) {
//           return GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               if (details.delta.dx > 1) {
//                 print("right");
//               } else if (details.delta.dx < -1) {
//                 print("left");
//               }
//               // print(details.delta.dx);
//             },
//             child: Container(
//                 height: SizeConfig.screenHeight,
//                 width: SizeConfig.screenWidth,
//                 color: JSON.onboarding[consumer.getIndexValue]["bg_color"],
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16.0, top: 56),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextComponent(
//                         text: StringConstant.butler,
//                         textStyle: FontStyles.kateNormalF60WithW400(
//                             color: JSON.onboarding[consumer.getIndexValue]
//                                 ["heading_color"]),
//                       ),
//                       SizedBox(
//                         height: 15.6,
//                       ),
//                       SizedBox(
//                         width: SizeConfig.screenWidth / 1.5,
//                         child: TextComponent(
//                           text: JSON.onboarding[consumer.getIndexValue]["text"],
//                           textStyle: FontStyles.heeboNormalF12WithW400(
//                               color: JSON.onboarding[consumer.getIndexValue]
//                                   ["text_color"]),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       _centerItemsWidget(consumer.getIndexValue),
//                       Spacer(),
//                       Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 20),
//                           child: ButtonComponent(
//                               onPressed: () => {
//                                     Navigator.pushNamed(
//                                         context, RouteConstants.login)
//                                   },
//                               buttonText:
//                                   StringConstant.gettingStarted.toUpperCase(),
//                               color: JSON.onboarding[consumer.getIndexValue]
//                                   ["button_color"],
//                               border: 20,
//                               textStyle: FontStyles.heeboNormalF13WithW500(
//                                   color: JSON.onboarding[consumer.getIndexValue]
//                                       ["button_text_color"],
//                                   letterSpacing: 1.3)))
//                     ],
//                   ),
//                 )),
//           );
//         }),
//       ),
