import 'dart:async';

import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/custom_radio_button.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/providers/place_picker_provider.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;
  TextEditingController _apartMentController;
  TextEditingController _nearByController;
  List<RadioModel> radioButtonList = new List<RadioModel>();
  BottomSheetStates enumStates = BottomSheetStates.TO_SELECT_LOCATION;
  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(31.582045, 74.329376), zoom: 14.4746, bearing: 5);
  PlacePickerProvider placePickerProvider;

  @override
  void initState() {
    super.initState();
    radioButtonList.add(
        new RadioModel(true, AssetConstant.addressHome, StringConstant.home));
    radioButtonList.add(new RadioModel(
        false, AssetConstant.addressOffice, StringConstant.office));
    radioButtonList.add(new RadioModel(
        false, AssetConstant.addressLocation, StringConstant.custom));

    Future.delayed(Duration(seconds: 1), () {
      placePickerProvider.getLocation();
      _showBottomSheet();
    });
    _apartMentController = new TextEditingController();
    _nearByController = new TextEditingController();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  @override
  void dispose() {
    super.dispose();
    print('Dispose Call');
    placePickerProvider.city = null;
    placePickerProvider.country = null;
    placePickerProvider.placePickerText = null;
    placePickerProvider.completer = Completer();
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return _showDeliverBottomSheet();
        }, backgroundColor: Colors.transparent)
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    placePickerProvider =
        Provider.of<PlacePickerProvider>(context, listen: false);
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        if (enumStates == BottomSheetStates.SELECTED_LOCATION) {
          // setState(() {
          //   enumStates = BottomSheetStates.TO_SELECT_LOCATION;
          //   return false;
          // });

          // _scaffoldKey.currentState.setState(() {
          //         });
          enumStates = BottomSheetStates.TO_SELECT_LOCATION;
          Navigator.pop(context);
          _showBottomSheet();
        } else if (enumStates == BottomSheetStates.TO_SELECT_LOCATION) {
          Navigator.pop(context);
          return true;
        } else {
          return true;
        }
        print('Will Scope pop Press Back');
        return false;
      },
      child: new Scaffold(
        key: _scaffoldKey,
        body:
            // _showSearchArea(),

            new Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          children: <Widget>[
            buildGoogleMapView(context),
            Positioned(
              top: 0,
              left: 0,
              bottom: 80,
              right: 0,
              child: _locationMarker(placePickerProvider),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoogleMapView(context) {
    final mediaQuery = MediaQuery.of(context);
    LatLng target;

    // return Consumer<PlacePickerProvider>(
    //   builder: ((context, consumer, childWidget) {
    return GoogleMap(
      padding: mediaQuery.padding,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: cameraPosition,
      onCameraMove: (position) async {
        target = position.target;
      },
      onCameraMoveStarted: () {},
      onCameraIdle: () async {
        if (target != null) {
          print('MJ onCameraIdle');
          print('MJ $target.longitude');

          await placePickerProvider.getAddressFromLatLng(
              target.latitude, target.longitude);
        }
      },
      onMapCreated: (controller) {
        placePickerProvider.completer.complete(controller);
      },
    );
    //   }),
    // );
  }

  Widget _locationMarker(PlacePickerProvider placePickerProvider) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AssetConstant.profileLoc,
        height: 70,
        color: ColorConstant.darkGreyBlue,
      ),
    );
  }

  ///// Bottom Sheet Methods /////

  _showDeliverBottomSheet() {
    return Container(
      decoration: new BoxDecoration(
        color: ColorConstant.darkGreyBlue,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(34.0),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18, bottom: 16, right: 16, left: 16),
        child: Wrap(
          children: <Widget>[
            Consumer<PlacePickerProvider>(
                builder: (context, consumer, childWidget) {
              return Column(
                children: [
                  Text(
                    enumStates == BottomSheetStates.TO_SELECT_LOCATION
                        ? StringConstant.addNewAddress
                        : StringConstant.addAddressDetails,
                    style: FontStyles.fontMedium(
                        color: ColorConstant.white, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  enumStates == BottomSheetStates.TO_SELECT_LOCATION
                      ? InkWell(
                          child: TextInputComponent(
                            title: StringConstant.searchLocationHere,
                            controller: _apartMentController,
                            fillColor: ColorConstant.paleGrey,
                            textInputType: TextInputType.text,
                              prefixIcon: Icon(Icons.search,
                              size: 20, color: ColorConstant.darkGreyBlue),
                            filled: true,
                            enabled: false,
                            hintStyle: FontStyles.fontRegular(color: ColorConstant.darkGreyBlue, fontSize: 12),
                          ),
                          onTap: () {
                            placePickerProvider.displayPlacePicker(
                              context,
                            );
                          },
                        )
                      : Container(),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.3,
                    color: ColorConstant.warmGrey,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildSelelctLocatinAddressWidget(
                      consumer.city, consumer.placePickerText),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.3,
                    color: ColorConstant.warmGrey,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  enumStates == BottomSheetStates.SELECTED_LOCATION
                      ? Column(
                          children: [
                            TextInputComponent(
                              title: StringConstant.aprament,
                              controller: _apartMentController,
                              fillColor: ColorConstant.paleGrey,
                              filled: true,
                              floatingLabel: false,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextInputComponent(
                              title: StringConstant.nearBy,
                              controller: _nearByController,
                              fillColor: ColorConstant.paleGrey,
                              filled: true,
                              floatingLabel: false,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Divider(
                              height: 0,
                              thickness: 0.3,
                              color: ColorConstant.warmGrey,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                StringConstant.lableAs,
                                style: FontStyles.fontMedium(
                                    color: ColorConstant.white, fontSize: 14.0),
                              ),
                            ),
                            CustomRadioButton(
                              sizeConfig: SizeConfig(),
                              radioButtonList: radioButtonList,
                              iconColor: ColorConstant.darkGreyBlue,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        )
                      : Container(),
                  ButtonComponent(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, RouteConstants.bottomBarScreen);
                      // if (enumStates == BottomSheetStates.TO_SELECT_LOCATION) {
                      //   setState(() {
                      //     enumStates = BottomSheetStates.SELECTED_LOCATION;
                      //   });
                      // }
                      if (enumStates == BottomSheetStates.TO_SELECT_LOCATION) {
                        // _scaffoldKey.currentState.setState(() {
                        // });
                        enumStates = BottomSheetStates.SELECTED_LOCATION;
                        Navigator.pop(context);
                        _showBottomSheet();
                      } else {
                        Navigator.pushNamed(
                            context, RouteConstants.selectTimingsScreen);
                      }
                    },
                    buttonText:
                        enumStates == BottomSheetStates.TO_SELECT_LOCATION
                            ? StringConstant.confirmLocation.toUpperCase()
                            : StringConstant.confirm.toUpperCase(),
                    color: ColorConstant.pissYellow,
                    textStyle: FontStyles.fontMedium(
                        color: ColorConstant.darkGreyBlue,
                        letterSpacing: 1.3,
                        fontSize: 13.0),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  _buildSelelctLocatinAddressWidget(String addressTitle, String addressDesc) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetConstant.locationSelect,
                color: ColorConstant.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                StringConstant.currentLocation,
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
      onTap: () {
        placePickerProvider.getLocation();
      },
    );
  }
}

enum BottomSheetStates { TO_SELECT_LOCATION, SELECTED_LOCATION }
