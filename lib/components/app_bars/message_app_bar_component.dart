import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

import '../input_component.dart';
import '../text_component.dart';

class MessageAppbarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final IconData titleIcon;
  final TextStyle titleTextStyle;
  final String subtile;
  final double height, bottomLeftRadius, bottomRightRadius;
  final Color color;
  final void Function() onTapBackButton;
  final bool isTrailingIcon;
  final bool isBackButton;
  final bool isNotificationDotVis;
  final GestureTapCallback onTap, onTapTrailingButton;
  final TextStyle defaultTitleTextStyle =
      FontStyles.fontMedium(color: ColorConstant.paleGrey, fontSize: 18.0);

  MessageAppbarComponent(
      {@required this.title,
      this.titleTextStyle,
      this.titleIcon,
      this.height = 25.0,
      this.color = ColorConstant.darkGreyBlue,
      this.bottomLeftRadius = 0.0,
      this.bottomRightRadius = 50.0,
      this.subtile = "",
      this.onTapBackButton,
      this.onTapTrailingButton,
      this.isTrailingIcon = false,
      this.isNotificationDotVis = false,
      this.isBackButton = true,
      this.onTap});
  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //main containers
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 32),
                    decoration: new BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(bottomLeftRadius),
                        bottomRight: Radius.circular(bottomRightRadius),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16,),
                        TextComponent(
                          text: title,
                          textStyle: titleTextStyle != null
                              ? titleTextStyle
                              : defaultTitleTextStyle,
                        ),
                        Spacer(),
                        CommonComponents.notificationIconAppbar(
                            onTapTrailingButton),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: ColorConstant.lightGrey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                //search Container
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextInputComponent(
                          title: StringConstant.searchConv,
                          fillColor: ColorConstant.paleGrey,
                          floatingLabel: false,
                          filled: true,
                          prefixIcon: Icon(Icons.search,
                              size: 20, color: ColorConstant.darkGreyBlue),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(height);
}
