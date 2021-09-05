import 'dart:io';

import 'package:buttler/components/app_bars/simple_app_bar_component.dart';
import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/components/input_component.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/ui_utils/media/audio/ui_player/audio_recorder_ui_widget.dart';
import 'package:buttler/ui_utils/media/video/video_player_widget.dart';
import 'package:buttler/ui_utils/picker/media_source_selection_widget.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickInspectionScreen extends StatefulWidget {
  @override
  _QuickInspectionScreenState createState() => _QuickInspectionScreenState();
}

class _QuickInspectionScreenState extends State<QuickInspectionScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _taskTitleEditingController,
      _taskDetailEditingController;
  TabController _tabController;
  int _tabPosition = 0;
  File _videoAssetPath;
  String recordedPathUrl;
  List<String> _imagesPathList = List<String>();

  @override
  void initState() {
    super.initState();
    _taskTitleEditingController = new TextEditingController();
    _taskDetailEditingController = new TextEditingController();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: SimpleAppBarComponent(
        title: StringConstant.quickInspection,
        height: 70.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonComponents.buildServiceCategoryNameWidget(
                  StringConstant.tellUsAboutIssue),
              SizedBox(
                height: 10,
              ),
              TextInputComponent(
                title: StringConstant.taskTitle,
                controller: _taskTitleEditingController,
                fillColor: ColorConstant.paleGrey,
                filled: true,
              ),
              SizedBox(
                height: 16,
              ),
              _writeReviewLayout(),
              SizedBox(
                height: 16,
              ),
              TabBar(
                indicatorColor: ColorConstant.pissYellow,
                indicatorWeight: 4,
                labelColor: ColorConstant.darkGreyBlue,
                unselectedLabelColor: ColorConstant.pinkishGrey,
                unselectedLabelStyle: FontStyles.fontRegular(
                    color: ColorConstant.pinkishGrey, fontSize: 14),
                labelStyle: FontStyles.fontMedium(
                    color: ColorConstant.darkGreyBlue, fontSize: 14),
                isScrollable: true,
                tabs: [
                  Tab(text: StringConstant.image),
                  Tab(text: StringConstant.video),
                  Tab(text: StringConstant.audio),
                ],
                controller: _tabController,
                onTap: (value) {
                  setState(() {
                    _tabPosition = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              _showTabView(_tabPosition),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
        child: ButtonComponent(
          onPressed: () {
            Navigator.pushNamed(
                context, RouteConstants.quickInspectionRequestScreen);
          },
          buttonText: StringConstant.next.toUpperCase(),
          color: ColorConstant.pissYellow,
          textStyle: FontStyles.fontMedium(
              color: ColorConstant.darkGreyBlue,
              letterSpacing: 1.3,
              fontSize: 13.0),
        ),
      ),
    );
  }

  _showTabView(int tabPosition) {
    if (tabPosition == 1) {
      return _videoAssetPath == null
          ? InkWell(
              onTap: () async {
                await _openFilePicker(isOpenSelectImage: false);
              },
              child: _uploadImageItemWidget(),
            )
          : VideoPlayerWidget(
              fileVideoPath: _videoAssetPath,
              videoType: VideoType.FILE,
            );
    } else if (tabPosition == 0) {
      return _uploadMediaGridWidget();
    } else {
      return AudioRecorderUiWidget(
        onRecordedPath: (recordedPathUrl) {
          this.recordedPathUrl = recordedPathUrl;
        },
      );
    }
  }

  _uploadMediaGridWidget() {
    if (_imagesPathList.length == 0)
      return InkWell(
        onTap: () {
          _openCameraGallerySelectionDialog();
        },
        child: _uploadImageItemWidget(),
      );
    else
      return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _imagesPathList.length == 6
            ? _imagesPathList.length
            : _imagesPathList.length + 1,
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 12,
          childAspectRatio: (MediaQuery.of(context).size.width / 2.5) /
              (MediaQuery.of(context).size.height / 5),
        ),
        itemBuilder: (context, index) {
          return index == _imagesPathList.length
              ? InkWell(
                  onTap: () {
                    _openCameraGallerySelectionDialog();
                  },
                  child: _uploadImageItemWidget(),
                )
              : _uploadedMediaItemWidget(_imagesPathList[index], index);
        },
      );
  }

  _openCameraGallerySelectionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MediaSourceSelectionWidget(
            onTapGallery: () {
              Navigator.pop(context);
            },
            onTapCamera: () {},
            onImagePath: (String imagePath) {
              _imagesPathList.add(imagePath);
              setState(() {});
            },
          );
        });
  }

  /// [bool isOpenSelectImage] user can select this picker to upload image and video so
  ///  differeniate with this variable
  Future _openFilePicker(
      {bool allowMultiple = false, bool isOpenSelectImage = true}) async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      if (!isOpenSelectImage)
        _videoAssetPath = File(result.files.single.path);
      else {
        // for (int index = 0; index < result.files.length;index++)
        //   _imagesPathList.add(result.files[index].path);
        _imagesPathList.add(result.files.single.path);
      }
      setState(() {});
    } else {}
  }

  _uploadImageItemWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: ColorConstant.paleGrey,
      ),
      height: SizeConfig.screenWidth / 2,
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SvgPicture.asset(
          AssetConstant.addMedia,
          height: 2,
        ),
      ),
    );
  }

  _uploadedMediaItemWidget(String imagePath, int index) {
    return Container(
      height: SizeConfig.screenWidth / 2,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: ColorConstant.paleGrey,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              // AssetConstant.rawSampleImage,
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                //TODO First Prompt with dialog before removing
                _imagesPathList.removeAt(index);
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 12),
                child: SvgPicture.asset(AssetConstant.removeMedia),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _writeReviewLayout() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.paleGrey,
      ),
      child: TextFormField(
        controller: _taskDetailEditingController,
        maxLines: 4,
        minLines: 4,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: StringConstant.provideDetails,
          hintStyle: FontStyles.fontRegular(color: ColorConstant.bluegrey),
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
