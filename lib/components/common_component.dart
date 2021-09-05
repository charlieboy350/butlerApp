import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/components/review/review_star.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonComponents {
  static Widget categoryImageWidget(String assetName,
      {bool roundedAll = false,
      double mainImagePadding = 16.0,
      bool newNotification = false}) {
    return Container(
      height: double.infinity,
      width: SizeConfig.screenWidth / 5.5,
      decoration: BoxDecoration(
        color: ColorConstant.lightKhaki,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Stack(
        children: [
          Visibility(
            visible: newNotification,
            child: Positioned(
                right: 2,
                top: 2,
                child: Icon(
                  Icons.circle,
                  color: ColorConstant.paleRed,
                  size: 8,
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.all(mainImagePadding),
              child: SvgPicture.asset(
                assetName,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget categoryImageListWidget(String assetName, {double height}) {
    return Container(
      height: height == null ? double.infinity : height,
      width: SizeConfig.screenWidth / 5.5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        child: Image.asset(
          assetName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // service
  static Padding buildServicesDetailListItemWidget(int index,
      {String serviceTitle = StringConstant.selectedServices,
      bool fromCart = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index == 0 || index == 5
              ? buildServiceCategoryNameWidget(serviceTitle)
              : Container(),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.paleGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categoryImageListWidget(
                  index % 2 == 0
                      ? AssetConstant.categoryOne
                      : AssetConstant.categoryTwo,
                  height: SizeConfig.screenWidth / 5.5,
                ),
                //old design
                //  Container(
                //   height: SizeConfig.screenWidth / 5.5,
                //   width: SizeConfig.screenWidth / 5.5,
                //   decoration: BoxDecoration(
                //     color: ColorConstant.lightKhaki,
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(6),
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(16.0),
                //     child: SvgPicture.asset(
                //       AssetConstant.flash,
                //       width: 20,
                //       height: 20,
                //     ),
                //   ),
                // ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 14),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Booking',
                              style: FontStyles.fontMedium(
                                  color: ColorConstant.darkGreyBlue,
                                  fontSize: 12.0),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AssetConstant.moneyService),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Rs. 550 PKR',
                                  style: FontStyles.fontMedium(
                                      color: ColorConstant.darkGreyBlue,
                                      fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              StringConstant.servicesInclude,
                              style: FontStyles.fontMedium(
                                  color: ColorConstant.darkGreyBlue,
                                  fontSize: 10.0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '• General leakage of pipes',
                              style: FontStyles.fontRegular(
                                  color: ColorConstant.charcoal,
                                  fontSize: 10.0),
                            ),
                            Text(
                              '• Basic fixes of exposed pipe',
                              style: FontStyles.fontRegular(
                                  color: ColorConstant.charcoal,
                                  fontSize: 10.0),
                            ),
                            Text(
                              '• Leakage Protection with ins',
                              style: FontStyles.fontRegular(
                                  color: ColorConstant.charcoal,
                                  fontSize: 10.0),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: showServiceEndButton(fromCart, index),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static inspectionServiceWidget(double width) {
    return IntrinsicHeight(
      child: Container(
        width: width,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: ColorConstant.paleGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Geyser - No Heating',
              style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 12.0),
            ),
            SizedBox(
              height: 6,
            ),
            // Row(
            //   children: [
            //     SvgPicture.asset(AssetConstant.moneyService),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       'Rs. 550 PKR',
            //       style: FontStyles.fontMedium(
            //           color: ColorConstant.darkGreyBlue, fontSize: 12.0),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 6,
            // ),
            Text(
              StringConstant.servicesInclude,
              style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 10.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '• General leakage of pipes',
              style: FontStyles.fontRegular(
                  color: ColorConstant.charcoal, fontSize: 10.0),
            ),
            Text(
              '• Basic fixes of exposed pipe',
              style: FontStyles.fontRegular(
                  color: ColorConstant.charcoal, fontSize: 10.0),
            ),
            Text(
              '• Leakage Protection with ins',
              style: FontStyles.fontRegular(
                  color: ColorConstant.charcoal, fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  static showServiceEndButton(bool fromCart, index) {
    if (fromCart != null) {
      if (fromCart) {
        return _buildRemoveOrderWidget();
      } else {
        if (index == 0)
          return _addedButtonWidget();
        else
          return _addButtonWidget();
      }
    } else {
      return Container();
    }
  }

  //TODO add ripple effect on this , ripple effect isn't working because previous layout has background color
  static InkWell _buildRemoveOrderWidget() {
    return InkWell(
      enableFeedback: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: ColorConstant.darkGreyBlue,
              size: 15,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              StringConstant.removeFromOrder,
              style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 12.0),
            ),
          ],
        ),
      ),
      onTap: () {
        print('yes');
      },
    );
  }

  static _addButtonWidget() {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(
          vertical: 6.0, horizontal: 18.0), //adds padding inside the button
      materialTapTargetSize: MaterialTapTargetSize
          .shrinkWrap, //limits the touch area to the button area
      minWidth: 0, //wraps child's width
      height: 0, //

      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: ColorConstant.darkGreyBlue,
              width: 1,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              StringConstant.serviceAdd,
              style: FontStyles.fontMedium(
                  color: ColorConstant.charcoal, fontSize: 10.0),
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.add,
              size: 12,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  static _addedButtonWidget() {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(
          vertical: 6.0, horizontal: 12.0), //adds padding inside the button
      materialTapTargetSize: MaterialTapTargetSize
          .shrinkWrap, //limits the touch area to the button area
      minWidth: 0, //wraps child's width
      height: 0, //
      child: FlatButton(
        color: ColorConstant.kellyGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        child:
            //  Text('a'),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              StringConstant.servicesAdded,
              style: FontStyles.fontMedium(
                  color: ColorConstant.white, fontSize: 10.0),
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.check,
              size: 12,
              color: ColorConstant.white,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  static Text buildServiceCategoryNameWidget(String serviceName) {
    return Text(
      serviceName,
      style: FontStyles.fontMedium(
          color: ColorConstant.darkGreyBlue, fontSize: 15.0),
    );
  }

  //price
  static Column buildTotalBillingAmountWidget(int price,
      {bool bottomDividerShow = false}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AssetConstant.moneyService,
              height: 15,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              StringConstant.totalBillAmount,
              style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 15.0),
            ),
            Spacer(),
            Text(
              'Rs. 1100 PKR',
              style: FontStyles.fontMedium(
                  color: ColorConstant.darkGreyBlue, fontSize: 15.0),
            ),
          ],
        ),
      ],
    );
  }

  ///// Multiple Widgets /////
  //rounded widget
  static InkWell buildRoundedHeadingWidget(
      {String leadingIcon,
      IconData leadingIconType,
      String title,
      String trailingIcon,
      Color colorName = ColorConstant.paleGrey,
      double height,
      bool bookingCompleted = false,
      GestureTapCallback tapMe}) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        height: height * 0.08,
        decoration: BoxDecoration(
          color: colorName,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 22, 0),
          child: Row(
            children: [
              showLeadingIcon(leadingIcon, bookingCompleted, leadingIconType),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: FontStyles.fontRegular(
                    color: ColorConstant.darkGreyBlue, fontSize: 12),
              ),
              Spacer(),
              trailingIcon != null
                  ? SvgPicture.asset(
                      trailingIcon,
                      height: 14,
                      color: ColorConstant.darkGreyBlue,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      onTap: tapMe,
    );
  }

  static showLeadingIcon(
      String leadingIcon, bool bookingCompleted, IconData icon) {
    if (!bookingCompleted) {
      if (leadingIcon != null) {
        return SvgPicture.asset(
          leadingIcon,
          height: 16,
          color: ColorConstant.darkGreyBlue,
        );
      } else {
        return Icon(
          icon,
          size: 16,
          color: ColorConstant.darkGreyBlue,
        );
      }
    } else {
      return buildCheckBoxAddress();
    }
  }

  static Widget buildCheckBoxAddress() {
    return Container(
      child: Center(
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.kellyGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              size: 16,
              color: ColorConstant.white,
            ),
          ),
        ),
      ),
    );
  }

  ///Address Cards///
  ///Address Cards///
  static InkWell buildAddedAddressWidget(int index,
      {String serviceTitle = StringConstant.selectedServices,
      String leadingIcon = AssetConstant.addressOffice,
      bool fromCart = false,
      bool trailingIcon = true,
      GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.paleGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.screenWidth / 8,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                    child: SvgPicture.asset(
                      leadingIcon,
                      width: 17,
                      height: 17,
                      color: ColorConstant.darkGreyBlue,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 16, 8, 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Office',
                                style: FontStyles.fontRegular(
                                    color: ColorConstant.darkGreyBlue,
                                    fontSize: 12.0),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                serviceTitle,
                                style: FontStyles.fontRegular(
                                    color: ColorConstant.charcoal,
                                    fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      trailingIcon
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                AssetConstant.arrowIcon,
                                height: 14,
                                color: ColorConstant.darkGreyBlue,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Review Screens
  static Column buildBookinWorkerDetailWidget(int index,
      {String serviceTitle = StringConstant.selectedServices,
      bool fromCart = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.paleGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: buildWorkerProfileItem(),
        )
      ],
    );
  }

  static Row buildWorkerProfileItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            height: SizeConfig.screenWidth / 5.5,
            width: SizeConfig.screenWidth / 5.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Image.asset(
                AssetConstant.profilePlaceHolder,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 14),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Taha Irshad',
                      style: FontStyles.fontMedium(
                          color: ColorConstant.darkGreyBlue, fontSize: 14.0),
                    ),
                    ReviewStar(
                      reviewText: true,
                      reviewStar: 3,
                      reviewCount: 5,
                    ),
                    Text(
                      StringConstant.memberSince,
                      style: FontStyles.fontRegular(
                        color: ColorConstant.darkGreyBlue,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: SvgPicture.asset(
                        AssetConstant.arrowIcon,
                        height: 14,
                        color: ColorConstant.darkGreyBlue,
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildSelectedButton() {
    return Container(
      child: Center(
        child: InkWell(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 16,
                color: ColorConstant.kellyGreen,
              ),
              Icon(
                Icons.circle,
                size: 8,
                color: ColorConstant.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildUnSelectedButton() {
    return Icon(
      Icons.circle,
      size: 16,
      color: ColorConstant.silver,
    );
  }

  static addressItem(
      {String headingIcon = AssetConstant.locationSelect,
      String headingTitle = StringConstant.currentLocation,
      String addressTitle,
      String addressDesc,
      bool radioButtonVis = false,
      GestureTapCallback onTap}) {
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: radioButtonVis,
            child: Positioned(
              right: 0,
              child: buildSelectedButton(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    headingIcon,
                    color: ColorConstant.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    headingTitle,
                    style: FontStyles.fontRegular(
                        color: ColorConstant.white, fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              addressTitle != null
                  ? Row(
                      children: [
                        Opacity(
                          opacity: 0,
                          child: SvgPicture.asset(
                            AssetConstant.locationSelect,
                            color: ColorConstant.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            addressTitle,
                            maxLines: 1,
                            style: FontStyles.fontRegular(
                                color: ColorConstant.white, fontSize: 10.0),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              addressDesc != null
                  ? Row(
                      children: [
                        Opacity(
                          opacity: 0,
                          child: SvgPicture.asset(
                            AssetConstant.locationSelect,
                            color: ColorConstant.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            addressDesc,
                            maxLines: 1,
                            style: FontStyles.fontRegular(
                                color: ColorConstant.white, fontSize: 10.0),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  //notification icon showInToolbar
  static GestureDetector notificationIconAppbar(GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ColorConstant.lightGrey,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AssetConstant.notificationBooking),
            ),
          ),
          Icon(
            Icons.circle,
            size: 12,
            color: ColorConstant.pissYellow,
          ),
        ],
      ),
    );
  }
}
