import 'dart:io';

import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoType videoType;
  final bool fromNetwork;
  final File fileVideoPath;
  final String strVideoPath;

  const VideoPlayerWidget({
    Key key,
    this.videoType,
    this.fileVideoPath,
    this.strVideoPath,
    this.fromNetwork = false,
  }) : super(key: key);
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = _setController();

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  _setController() {
    if (widget.videoType == VideoType.FILE) {
      return VideoPlayerController.file(widget.fileVideoPath);
    } else if (widget.videoType == VideoType.ASSET) {
      return VideoPlayerController.asset(widget.strVideoPath);
    } else if (widget.videoType == VideoType.NETWORK) {
      return VideoPlayerController.network(widget.strVideoPath);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
              _ControlsOverlay(controller: _controller),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors:
                    VideoProgressColors(playedColor: ColorConstant.pissYellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}

enum VideoType {
  ASSET,
  FILE,
  NETWORK,
}
