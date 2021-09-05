import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRadioButton extends StatefulWidget {
  final TextStyle titleStyle;
  final double iconHeight;
  final SizeConfig sizeConfig;
  final Color iconColor;
  final List<RadioModel> radioButtonList;

  const CustomRadioButton(
      {this.titleStyle,
      this.iconHeight,
      this.sizeConfig,
      this.iconColor,
      this.radioButtonList});
  @override
  createState() {
    return new CustomRadioButtonState();
  }
}

class CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int index = 0; index < widget.radioButtonList.length; index++)
          Flexible(
            fit: FlexFit.tight,
            child: InkWell(
              //highlightColor: Colors.red,
              onTap: () {
                setState(
                  () {
                    widget.radioButtonList
                        .forEach((element) => element.isSelected = false);
                    widget.radioButtonList[index].isSelected = true;
                  },
                );
              },
              child: new RadioItem(
                widget.titleStyle,
                widget.iconHeight,
                widget.radioButtonList[index],
                widget.iconColor,
                widget.sizeConfig,
              ),
            ),
          ),
        //},
        //  ),
      ],
    );
  }
}

class RadioItem extends StatelessWidget {
  final TextStyle _titleStyle;
  final double iconHeight;
  final RadioModel _item;
  final SizeConfig sizeConfig;
  final Color _iconColor;

  RadioItem(this._titleStyle, this.iconHeight, this._item, this._iconColor,this.sizeConfig);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: SizeConfig.screenWidth / 4,
      margin: new EdgeInsets.all(4.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                _item.icon,
                height: iconHeight != null ? iconHeight : 16,
                color: _iconColor,
              ),
              SizedBox(
                height: 5,
              ),
              _item.text != null
                  ? Text(
                      _item.text,
                      style: _titleStyle == null
                          ? FontStyles.fontRegular(
                              color: ColorConstant.darkGreyBlue,
                              fontSize: 10,
                            )
                          : _titleStyle,
                    )
                  : Container()
            ],
          ),
          Positioned(
              left: 4,
              top: 4,
              child: _item.isSelected
                  ? CommonComponents.buildSelectedButton()
                  : CommonComponents.buildUnSelectedButton()),
        ],
      ),
      decoration: new BoxDecoration(
          color: ColorConstant.paleGrey,
          borderRadius: BorderRadius.all(Radius.circular(6))),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String icon;
  final String text;

  RadioModel(this.isSelected, this.icon, this.text);
}
