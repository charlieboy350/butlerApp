import 'package:buttler/components/text_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double border;
  final Color color;
  final TextStyle textStyle;

  const ButtonComponent(
      {Key key,
      this.onPressed,
      @required this.buttonText,
      this.border = 30.0,
      this.color,
      this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(border),
      ),
      color: color,
      height: MediaQuery.of(context).size.height * 0.08,
      minWidth: MediaQuery.of(context).size.width,
      child: TextComponent(
        text: buttonText,
        textStyle: textStyle != null
            ? textStyle
            : FontStyles.fontRegular(color: ColorConstant.white),
      ),
      onPressed: onPressed != null ? onPressed : () => {},
    );
  }
}
