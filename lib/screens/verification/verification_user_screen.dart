import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_info_widget.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationPicScreen extends StatefulWidget {
  final bool verifyPic;
  VerificationPicScreen({this.verifyPic});
  @override
  _VerificationPicScreenState createState() => _VerificationPicScreenState();
}

class _VerificationPicScreenState extends State<VerificationPicScreen> {
  var file;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.appBlack,
      body: Container(
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            file != null
                ? Container(
                    height: SizeConfig.screenHeight,
                    child: Image.file(file, fit: BoxFit.cover),
                  )
                // Image.file(file)
                : Container(),
            _roundedContainer(),
          ],
        ),
      ),
    );
  }

  _roundedContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 20),
          decoration: new BoxDecoration(
            color: ColorConstant.lightGrey,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(34.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.verifyPic
                    ? StringConstant.takePhoto
                    : StringConstant.nowPictureId,
                textAlign: TextAlign.center,
                style: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue, fontSize: 23.0),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                StringConstant.makeSureGoodLighting,
                textAlign: TextAlign.center,
                style: FontStyles.fontRegular(
                    color: ColorConstant.charcoal, fontSize: 12.0),
              ),
              SizedBox(
                height: 18,
              ),
              file == null
                  ? InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.pissYellow,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            AssetConstant.cameraWhite,
                            height: 30,
                          ),
                        ),
                      ),
                      onTap: () async {
                        await showCameraDialog();
                      },
                    )
                  : Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: ButtonComponent(
                            onPressed: () {
                              widget.verifyPic
                                  ? Navigator.pushNamed(context,
                                      RouteConstants.verificationUserScreen,
                                      arguments: false)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CommonInfoComponent(
                                          title:
                                              StringConstant.identityVerified,
                                          subtitle: StringConstant.thankSupport,
                                          mainButtonText:
                                              StringConstant.keepExploring,
                                          mainButtonPressed: () {
                                            //TODO Redirect to Profile Screen
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    );
                            },
                            buttonText: StringConstant.next.toUpperCase(),
                            color: ColorConstant.pissYellow,
                            textStyle: FontStyles.fontMedium(
                                color: ColorConstant.darkGreyBlue,
                                letterSpacing: 1.3,
                                fontSize: 13.0),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: InkWell(
                            child: Text(
                              StringConstant.retake,
                              textAlign: TextAlign.center,
                              style: FontStyles.fontRegular(
                                  color: ColorConstant.darkGreyBlue,
                                  fontSize: 14.0,
                                  underLine: true),
                            ),
                            onTap: () async {
                              await showCameraDialog();
                            },
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }

  Future showCameraDialog() async {
    file = await showDialog(
      context: context,
      builder: (context) => Camera(
        mode: CameraMode.fullscreen,
        initialCamera: widget.verifyPic ? CameraSide.front : CameraSide.back,
        //enableCameraChange: false,
        //  orientationEnablePhoto: CameraOrientation.landscape,.
        imageMask: widget.verifyPic
            ? CameraFocus.circle(
                color: Colors.black.withOpacity(0.5),
              )
            : CameraFocus.rectangle(
                color: Colors.black.withOpacity(0.5),
              ),
        onChangeCamera: (direction, _) {
          print('--------------');
          print('$direction');
          print('--------------');
        },
      ),
    );
    setState(() {});
  }
}
