import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextInputComponent extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String action;
  final bool enabled, filled;
  final TextInputAction textInputAction;
  final FocusNode currentFocus, nextFocus;
  final Color fillColor;
  final String intialValue;
  final int maxLength;
  final bool floatingLabel;
  final ValueChanged<String> onChanged;
  final void Function(String) onFieldSubmitted;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final TextStyle hintStyle;
  final Widget suffixIcon;

  final String Function(String) validator;

  const TextInputComponent(
      {Key key,
      this.controller,
      @required this.title,
      this.action,
      this.enabled,
      this.textInputAction,
      this.currentFocus,
      this.nextFocus,
      this.maxLength,
      this.floatingLabel = false,
      this.fillColor,
      this.onChanged,
      this.intialValue,
      this.filled,
      this.onFieldSubmitted,
      this.textInputType = TextInputType.emailAddress,
      this.prefixIcon,
      this.suffixIcon,
      this.hintStyle,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        initialValue: intialValue,
        onChanged: onChanged,
        maxLength: maxLength != null ? maxLength : null,
        obscureText: false,
        enabled: this.enabled,
        focusNode: currentFocus,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) {
          if (textInputAction == TextInputAction.next) {
            print(value + "callback");
            currentFocus.unfocus();
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: floatingLabel ? title : null,
          hintText: !floatingLabel ? title : null,
          hintStyle: 
          hintStyle == null ?          
          TextStyle(
            fontSize: 14.0,
            color: ColorConstant.bluegrey,
          )
          : 
          hintStyle
          ,
          fillColor: fillColor,
          filled: filled,
          // prefixIcon: prefixIcon != null ? Container(height : 5,child: prefixIcon) : null,
          prefixIcon: prefixIcon != null
              ? new Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 0, right: 0, bottom: 15),
                  child: prefixIcon)
              : null,
          suffixIcon: suffixIcon != null
              ? new Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 0, right: 0, bottom: 15),
                  child: suffixIcon)
              : null,
          labelStyle: FontStyles.fontRegular(color: ColorConstant.bluegrey),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: new BorderSide(color: ColorConstant.paleGrey),
          ),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: new BorderSide(color: ColorConstant.paleGrey),
          ),
          disabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: new BorderSide(color: ColorConstant.paleGrey),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: new BorderSide(
              color: ColorConstant.paleGrey,
            ),
          ),
        ),
        cursorColor: ColorConstant.darkGreyBlue,
        style: TextStyle(
          fontSize: 14.0,
          color: ColorConstant.darkGreyBlue,
        ),
        validator: validator);
  }
}
