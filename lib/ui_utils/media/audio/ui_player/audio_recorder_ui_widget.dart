import 'dart:io';

import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:buttler/ui_utils/media/audio/ui_player/recorder_state.dart';

import 'demo_active_codec.dart';
import 'remote_player.dart';
import 'temp_file.dart';

/// path to remote auido file.
// const String exampleAudioFilePath =
//     'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';

class AudioRecorderUiWidget extends StatefulWidget {
  final String audioPathUrl;
  final alreadyAudioRecorder;
  //when user finished his recording
  final Function(String recordedPathUrl) onRecordedPath;
  const AudioRecorderUiWidget({
    Key key,
    this.audioPathUrl,
    this.alreadyAudioRecorder = false,
    this.onRecordedPath,
  }) : super(key: key);

  @override
  _AudioRecorderUiWidgetState createState() => _AudioRecorderUiWidgetState();
}

class _AudioRecorderUiWidgetState extends State<AudioRecorderUiWidget> {
  bool initialized = false;

  String recordingFile;
  Track track;
  bool _audioStop = false;

  @override
  void initState() {
    if (!kIsWeb) {
      var status = Permission.microphone.request();
      status.then((stat) {
        if (stat != PermissionStatus.granted) {
          throw RecordingPermissionException(
              'Microphone permission not granted');
        }
      });
    }
    super.initState();
    tempFile(suffix: '.mp3').then((path) {
      recordingFile = path;
      widget.onRecordedPath(recordingFile);
      track = Track(trackPath: recordingFile);
      setState(() {});
    });
  }

  Future<bool> init() async {
    if (!initialized) {
      await initializeDateFormatting();
      await UtilRecorder().init();
      ActiveCodec().recorderModule = UtilRecorder().recorderModule;
      ActiveCodec().setCodec(withUI: false, codec: Codec.mp3);

      initialized = true;
    }
    return initialized;
  }

  void _clean() async {
    if (recordingFile != null) {
      try {
        await File(recordingFile).delete();
      } on Exception {
        // ignore
      }
    }
  }

  @override
  void dispose() {

    _clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return Container(
            width: 0,
            height: 0,
            color: Colors.white,
          );
        } else if (widget.audioPathUrl != null)
          return RemotePlayer(remotePath: widget.audioPathUrl);
        else
          return _buildRecorder(track);
      },
    );
  }

  Widget _buildRecorder(Track track) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RecorderPlaybackController(
        child: Column(
          children: [
            // Left('Recorder'),

            Visibility(
              visible: !_audioStop,
              child: SoundRecorderUI(
                track,
                backgroundColor: ColorConstant.paleGrey,
                onStopped: (media) {
                  setState(() {
                    _audioStop = true;
                  });
                },
              ),
            ),
            // Left('Recording Playback'),
            Visibility(
              visible: _audioStop || widget.alreadyAudioRecorder,
              child: Column(
                children: [
                  SoundPlayerUI.fromTrack(
                    track,
                    backgroundColor: ColorConstant.paleGrey,
                    enabled: _audioStop,
                    showTitle: true,
                    audioFocus: AudioFocus.requestFocusAndDuckOthers,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _audioStop = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        StringConstant.recordAgain,
                        style: FontStyles.fontRegular(
                            color: ColorConstant.darkGreyBlue,
                            fontSize: 12,
                            underLine: true),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class Left extends StatelessWidget {
  ///
  final String label;

  ///
  Left(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4, left: 8),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
