import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SimpleAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final dynamic titleIcon;
  final TextStyle titleTextStyle, subTitleTextStyle;
  final String subtile;
  final double height, bottomLeftRadius, bottomRightRadius;
  final Color color, titleIconColor;
  final double titleIconSize;
  final void Function() onTapBackButton;
  final bool titleCenter, isTrailingIcon, secondRowVis;
  final bool isBackButton, isSubTitleIconButtonVis, isSubTitleIconButtonOpacity;
  final bool isNotificationDotVis;
  final GestureTapCallback onTap, onTapTrailingButton;
  final TextStyle defaultTitleTextStyle =
      FontStyles.fontMedium(color: ColorConstant.paleGrey, fontSize: 18.0);

  SimpleAppBarComponent(
      {@required this.title,
      this.titleTextStyle,
      this.subTitleTextStyle,
      this.titleIcon,
      this.titleIconColor,
      this.titleIconSize,
      this.height = 25.0,
      this.color = ColorConstant.darkGreyBlue,
      this.bottomLeftRadius = 0.0,
      this.bottomRightRadius = 50.0,
      this.subtile = "",
      this.onTapBackButton,
      this.onTapTrailingButton,
      this.secondRowVis = false,
      this.isTrailingIcon = false,
      this.isNotificationDotVis = false,
      this.isBackButton = true,
      this.titleCenter = true,
      this.isSubTitleIconButtonVis = false,
      this.isSubTitleIconButtonOpacity = false,
      this.onTap});
  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Container(
          color: ColorConstant.lightGrey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bottomLeftRadius),
                    bottomRight: Radius.circular(bottomRightRadius))),
            child: Padding(
              padding: titleCenter
                  ? const EdgeInsets.only(left: 16)
                  : const EdgeInsets.only(left: 16, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: titleCenter
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: Row(
                            children: [
                              Visibility(
                                visible: isBackButton,
                                child: InkWell(
                                  onTap: onTapBackButton != null
                                      ? onTapBackButton
                                      : () => {
                                            Navigator.pop(context),
                                          },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                      AssetConstant.backIcon,
                                      color: ColorConstant.paleGrey,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: isBackButton,
                                  child: SizedBox(
                                    width: 0,
                                  )),
                              TextComponent(
                                text: title,
                                textStyle: titleTextStyle != null
                                    ? titleTextStyle
                                    : defaultTitleTextStyle,
                              ),
                              Visibility(
                                visible: titleIcon != null ? true : false,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: titleIcon == AssetConstant.upArrowIcon
                                      ? SvgPicture.asset(
                                          titleIcon,
                                          height: titleIconSize != null
                                              ? titleIconSize
                                              : 7,
                                          color: titleIconColor != null
                                              ? titleIconColor
                                              : ColorConstant.white,
                                        )
                                      : Icon(
                                          titleIcon,
                                          size: titleIconSize != null
                                              ? titleIconSize
                                              : 24,
                                          color: titleIconColor != null
                                              ? titleIconColor
                                              : ColorConstant.white,
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: secondRowVis,
                          child: Flexible(
                            child: Row(
                              children: [
                                Opacity(
                                  opacity: isSubTitleIconButtonOpacity ? 1 : 0,
                                  child: Visibility(
                                    visible: isSubTitleIconButtonVis,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: ColorConstant.paleGrey,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: isBackButton,
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                Flexible(
                                  child: TextComponent(
                                    text: subtile,
                                    overFlow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softwrap: false,
                                    textStyle: subTitleTextStyle != null
                                        ? subTitleTextStyle
                                        : FontStyles.fontRegular(
                                            color: ColorConstant.paleGrey,
                                            fontSize: 14.0,
                                            bold: true,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Visibility(
                        //   visible: subtile == "" ? false : true,
                        //   child: TextComponent(
                        //     text: subtile,
                        //     textStyle: subTitleTextStyle != null
                        //         ? subTitleTextStyle
                        //         : FontStyles.fontRegular(
                        //             color: ColorConstant.paleGrey,
                        //             fontSize: 14.0,
                        //             bold: true,
                        //           ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Visibility(
                      visible: isTrailingIcon,
                      child: CommonComponents.notificationIconAppbar(
                          onTapTrailingButton),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(height);
}
