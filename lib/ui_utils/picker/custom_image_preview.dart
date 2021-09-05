import 'dart:io';

import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_view/photo_view.dart';

class CustomImagePreview extends StatefulWidget {
  // final PickedFile image;
  final GestureTapCallback imageCroped, onButtonSubmit, onButtonCancel;
  final Function(String) onImagePath;
  final String path;
  const CustomImagePreview(
      {Key key,
      this.path,
      this.imageCroped,
      this.onButtonSubmit,
      this.onButtonCancel,
      this.onImagePath})
      : super(key: key);
  @override
  _CustomImagePreviewState createState() => _CustomImagePreviewState();
}

class _CustomImagePreviewState extends State<CustomImagePreview> {
  String cropImagePath;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(),
          actions: <Widget>[
            InkWell(
              enableFeedback: true,
              onTap: () {
                _cropImage(widget.path);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.crop),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhotoView(
                imageProvider: FileImage(
                  File(getImageCroppedNot(cropImagePath == null ? widget.path : cropImagePath)),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Colors.red,
                  onPressed: widget.onButtonCancel,                  
                  child: Text(
                    StringConstant.cancel,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: FlatButton(
                      color: Colors.green,
                      onPressed: (){
                        widget.onImagePath(cropImagePath == null ? widget.path : cropImagePath);
                      },
                      child: Text(
                        StringConstant.submit,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  //get cropped image or orignal image
  String getImageCroppedNot(path) {
    return path;
  }

  Future<Null> _cropImage(String path) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Edit',
            toolbarColor: ColorConstant.kellyGreen,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            activeControlsWidgetColor: ColorConstant.kellyGreen,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Edit',
        ));
    if (croppedFile != null) {
      cropImagePath = croppedFile.path;
      setState(() {});
    }
  }
}
