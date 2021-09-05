import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

import 'button_component.dart';

class BottomSheetComponent {
  static twoOptionBottomSheet(context,
      {String title,
      Function() btnPositivedPressed,
      Function() btnNagativePressed}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: new BoxDecoration(
            color: ColorConstant.darkGreyBlue,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(34.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 16, right: 16, left: 16),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: FontStyles.fontMedium(
                            color: ColorConstant.white, fontSize: 22.0),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonComponent(
                      onPressed: btnPositivedPressed,
                      buttonText: StringConstant.yes.toUpperCase(),
                      color: ColorConstant.pissYellow,
                      textStyle: FontStyles.fontMedium(
                          color: ColorConstant.darkGreyBlue,
                          letterSpacing: 1.3,
                          fontSize: 13.0),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: Text(
                        StringConstant.goBack,
                        style: FontStyles.fontMedium(
                            color: ColorConstant.white, fontSize: 12.0),
                      ),
                      onTap: btnNagativePressed,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static infoOptionBottomSheet(context,
      {String title,
      String subtitle,
      String buttonText,
      Function() buttonPressed}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: new BoxDecoration(
            color: ColorConstant.darkGreyBlue,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(34.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, bottom: 16, right: 16, left: 16),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: [
                    Visibility(
                      visible: title != null ? true : false,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                         title != null ?  title : "",
                          textAlign: TextAlign.center,
                          style: FontStyles.fontMedium(
                              color: ColorConstant.white, fontSize: 22.0),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: title != null ? true : false,
                      child: Text(
                        "22589",
                        textAlign: TextAlign.center,
                        style: FontStyles.fontMedium(
                            color: ColorConstant.white, fontSize: 28.0),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: FontStyles.fontRegular(
                              color: ColorConstant.white, fontSize: 12.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    ButtonComponent(
                      onPressed: buttonPressed,
                      buttonText: buttonText,
                      color: ColorConstant.pissYellow,
                      textStyle: FontStyles.fontMedium(
                          color: ColorConstant.darkGreyBlue,
                          letterSpacing: 1.3,
                          fontSize: 13.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
