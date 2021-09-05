import 'package:buttler/components/app_bars/message_app_bar_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController _messageTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageTextEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      
      appBar: MessageAppbarComponent(
        title: StringConstant.messages,
        titleTextStyle: FontStyles.kateNormalF60WithW400(
            color: ColorConstant.paleGrey, fontSize: 22),
        height: 180.0,
        isBackButton: false,
        isTrailingIcon: true,
      ),
      body: 


      // Container(),
      // TextInputComponent(
      //   title: StringConstant.searchConv,
      //   controller: _messageTextEditingController,
      //   fillColor: ColorConstant.paleGrey,
      //   floatingLabel: false,
      //   filled: true,
      //   prefixIcon: Icon(Icons.search, size: 20, color: ColorConstant.darkGreyBlue),
      // ),


      // List of messages
          Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMessageListItem(index),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.chatScreen);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _buildMessageListItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 8),
      child: Container(
        height: SizeConfig.screenHeight / 9,
        decoration: BoxDecoration(
          color: ColorConstant.paleGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _chatImageWidget(AssetConstant.profilePlaceHolder,
                newNotification: index == 0 ? true : false),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Text(
                              'Nasir Hussian',
                              style: FontStyles.fontMedium(
                                  color: ColorConstant.darkGreyBlue,
                                  fontSize: 14),
                            ),
                          ),
                          Text(
                            '16:00 ',
                            style: FontStyles.fontRegular(
                                color: ColorConstant.coolGrey, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'I’m going to San Francisco … ',
                        style: FontStyles.fontRegular(
                            color: ColorConstant.coolGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatImageWidget(String assetName, {bool newNotification = false}) {
    return Container(
      height: double.infinity,
      width: SizeConfig.screenWidth / 5.5,
   
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenWidth / 3.5,
              width: SizeConfig.screenWidth / 3.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      AssetConstant.profilePlaceHolder,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Icon(
                Icons.circle,
                color: ColorConstant.kellyGreen,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
