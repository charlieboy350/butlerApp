import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/bottom_sheet_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.bookingDetail,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.workerDetail),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: CommonComponents.buildBookinWorkerDetailWidget(0),
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed( RouteConstants.reviewsScreen,
                  //                                 arguments: true);
                  Navigator.of(context).pushNamed(
                    RouteConstants.workerProfileScreen,
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.otpVerification),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildBlockWidget(
                      showMoreIcon: true,
                      icon: AssetConstant.chatWorker,
                      iconHeight: 15,
                      title: StringConstant.chatWithWorker,
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstants.chatScreen);
                      }),
                  SizedBox(
                    width: 8,
                  ),
                  _buildBlockWidget(
                      showMoreIcon: true,
                      icon: AssetConstant.verifyWorker,
                      iconHeight: 10,
                      title: StringConstant.verifyWorker,
                      onTap: () {
                        BottomSheetComponent.infoOptionBottomSheet(
                          context,
                          title: StringConstant.yourOtpCode,
                          subtitle: StringConstant.youNeedMatch,
                          buttonText: StringConstant.awesome,
                          buttonPressed: () {
                            Navigator.pop(context);
                          },
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.orderStatus),
              SizedBox(
                height: 10,
              ),
              CommonComponents.buildRoundedHeadingWidget(
                leadingIcon: AssetConstant.bookingTime,
                title: 'Starting in 3 Hours',
                height: SizeConfig.screenHeight,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              for (int index = 0; index < 2; index++)
                CommonComponents.buildServicesDetailListItemWidget(index,
                    fromCart: null),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildTotalBillingAmountWidget(0,
                  bottomDividerShow: false),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.timeDate),
              SizedBox(
                height: 18,
              ),
              CommonComponents.buildRoundedHeadingWidget(
                leadingIcon: AssetConstant.bookingDate,
                title: '24 November, 2020',
                height: SizeConfig.screenHeight,
              ),
              SizedBox(
                height: 16,
              ),
              CommonComponents.buildRoundedHeadingWidget(
                leadingIcon: AssetConstant.bookingTime,
                title: '6:30 PM',
                height: SizeConfig.screenHeight,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.yourAddress),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildAddedAddressWidget(0, trailingIcon: false),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: ColorConstant.warmGrey,
              ),
              SizedBox(
                height: 8,
              ),
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.paymentMethod),
              SizedBox(
                height: 10,
              ),
              _buildBlockWidget(showMoreIcon: false),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildBlockWidget({
    bool showMoreIcon = true,
    String icon = AssetConstant.moneyService,
    double iconHeight = 24,
    String title = StringConstant.cashPayment,
    GestureTapCallback onTap,
  }) {
    return InkWell(
        child: Container(
          width: SizeConfig.screenWidth / 2.3,
          height: SizeConfig.screenWidth / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorConstant.paleGrey),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    height: iconHeight,
                    color: ColorConstant.darkGreyBlue,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: FontStyles.fontRegular(
                        color: ColorConstant.darkGreyBlue, fontSize: 12),
                  ),
                ],
              ),
              showMoreIcon
                  ? Positioned(
                      right: 5,
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: SvgPicture.asset(
                            AssetConstant.arrowIcon,
                            height: 14,
                            color: ColorConstant.darkGreyBlue,
                          )),
                    )
                  : Container(),
            ],
          ),
        ),
        onTap: onTap);
  }
}
