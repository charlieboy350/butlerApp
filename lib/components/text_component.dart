import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final TextOverflow overFlow;
  final int maxLines;
  final bool softwrap;
  const TextComponent({
    Key key,
    this.text,
    this.textAlign = TextAlign.left,
    this.textStyle,
    this.overFlow,
    this.maxLines,
    this.softwrap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: this.maxLines,
      softWrap: this.softwrap,
      overflow: this.overFlow,
      textAlign: textAlign,
      style: textStyle != null
          ? textStyle
          : GoogleFonts.heebo(fontSize: 12, color: ColorConstant.charcoal),
    );
  }
}
