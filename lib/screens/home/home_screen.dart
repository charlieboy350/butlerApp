import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/review/write_review_star.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/providers/place_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlacePickerProvider placePickerProvider;
  TextEditingController _reviewContentController;

  @override
  void dispose() {
    super.dispose();
    _reviewContentController = TextEditingController();
    placePickerProvider.placePickerText = null;
  }

  @override
  Widget build(BuildContext context) {
    placePickerProvider =
        Provider.of<PlacePickerProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: ColorConstant.lightGrey,
      // body: Text(StringConstant.home),
      appBar: PreferredSize(
        preferredSize: new Size.fromHeight(90),
        child: Consumer<PlacePickerProvider>(
            builder: (context, consumer, childWidget) {
          return SimpleAppBarComponent(
            title: StringConstant.serviceLocation,
            secondRowVis: true,
            titleTextStyle: FontStyles.fontRegular(
                color: ColorConstant.paleGrey, fontSize: 14),
            subTitleTextStyle: FontStyles.fontRegular(
                color: ColorConstant.bluegrey, fontSize: 12),
            titleIcon: AssetConstant.upArrowIcon,
            subtile: consumer.placePickerText == null
                ? ""
                : consumer.placePickerText,
            height: 90.0,
            isBackButton: false,
            isTrailingIcon: true,
            onTap: () {
              _showDeliverBottomSheet(context);
            },
            onTapTrailingButton: () {
              Navigator.pushNamed(context, RouteConstants.notificationScreen);
            },
          );
        }),
      ),
      // body: _builHomedBottomSheetContent()
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 2),
        child: _gridViewCategoryWidget(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: SvgPicture.asset(AssetConstant.calendar),
        label: Text(
          StringConstant.quickInspection,
          style: FontStyles.fontRegular(
            color: ColorConstant.white,
            fontSize: 12,
          ),
        ),
        backgroundColor: ColorConstant.darkGreyBlue,
      ),
    );
  }

  //childAspectRatio is use to change the height of the item
  GridView _gridViewCategoryWidget(
    BuildContext context,
  ) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 50,
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
            childAspectRatio: (MediaQuery.of(context).size.width / 2.5) /
                (MediaQuery.of(context).size.height / 3.5)),
        itemBuilder: (context, index) {
          return InkWell(
            child: Column(
              children: [
                Expanded(
                  child: shopCategoriesItemWidget(
                    context,
                    index,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Electrician',
                  style: FontStyles.fontRegular(color: ColorConstant.appBlack),
                )
              ],
            ),
            onTap: () {
              if (index == 0)
                _reviewBottomSheet();
              else
                Navigator.pushNamed(context, RouteConstants.serviceListScreen);
            },
          );
        });
  }

  Widget shopCategoriesItemWidget(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? ColorConstant.lightKhaki : ColorConstant.silver,
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: SvgPicture.asset(
        index % 2 == 0  ? 
        AssetConstant.electrition : AssetConstant.painter,
        width: 20,
        height: 20,
      ),
    );
  }

  _showDeliverBottomSheet(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return _builHomedBottomSheetContent();
        });
  }

  Wrap _builHomedBottomSheetContent() {
    return Wrap(
      children: [
        Container(
            decoration: new BoxDecoration(
              color: ColorConstant.darkGreyBlue,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(34.0),
              ),
            ),
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CommonComponents.addressItem(
                  onTap: () {
                    placePickerProvider.getLocation();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                for (int index = 0; index < 2; index++)
                  Column(
                    children: [
                      Divider(
                        height: 0,
                        thickness: 0.3,
                        color: ColorConstant.warmGrey,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CommonComponents.addressItem(
                        headingIcon: AssetConstant.addAddressInBottom,
                        headingTitle: StringConstant.home,
                        addressTitle: "Suit 603, 6th Floor Al Reef Tower",
                        addressDesc:
                            "Main Alamgir Road, Bahadurabad CHS Karachi",
                        radioButtonVis: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                Divider(
                  height: 0,
                  thickness: 0.3,
                  color: ColorConstant.warmGrey,
                ),
                SizedBox(
                  height: 16,
                ),
                CommonComponents.addressItem(
                  headingIcon: AssetConstant.addAddressInBottom,
                  headingTitle: StringConstant.addNewAddress,
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.addAddressScreen);
                  },
                ),
              ],
            )),
      ],
    );
  }

  //review bottom sheet

  VoidCallback _showPersBottomSheetCallBack;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  _reviewBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return _reviewSheetItem();
        }, backgroundColor: Colors.transparent)
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _reviewBottomSheet;
            });
          }
        });

    // return showModalBottomSheet(
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return _reviewSheetItem();
    //     });
  }

  _reviewSheetItem() {
    return Wrap(children: [
      Container(
        decoration: new BoxDecoration(
          color: ColorConstant.darkGreyBlue,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(34.0),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rate your last Order',
                style: FontStyles.fontMedium(
                    color: ColorConstant.paleGrey, fontSize: 17),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: StatefulWrtieReviewStarRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              _writeReviewLayout(),
              SizedBox(
                height: 24,
              ),
              ButtonComponent(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonText: StringConstant.submit.toUpperCase(),
                color: ColorConstant.pissYellow,
                textStyle: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue,
                    letterSpacing: 1.3,
                    fontSize: 13.0),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  Container _writeReviewLayout() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.paleGrey,
      ),
      child: TextFormField(
        controller: _reviewContentController,
        maxLines: 4,
        minLines: 4,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: StringConstant.tellMore,
          hintStyle: FontStyles.fontRegular(color: ColorConstant.darkGreyBlue),
          contentPadding: EdgeInsets.all(16),
        ),
        style: FontStyles.fontRegular(color: ColorConstant.darkGreyBlue),
        keyboardType: TextInputType.multiline,
        validator: (value) {
          // return validateReview(StringConstant.tellMore, value);
        },
      ),
    );
  }
}
