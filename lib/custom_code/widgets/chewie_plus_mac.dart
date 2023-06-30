// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_macos/video_player_macos.dart';

class ChewiePlusMac extends StatefulWidget {
  const ChewiePlusMac({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _ChewieVideoState createState() => _ChewieVideoState();
}

class _ChewieVideoState extends State<ChewieVideo> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    if (!Platform.isWindows && !Platform.isLinux && !kIsWeb) {
      videoPlayerController = VideoPlayerController.network(widget.videoUrl);
      videoPlayerController.initialize().then((_) => setState(() {}));

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        allowFullScreen: false,
        allowMuting: false,
        showControls: false,
        showControlsOnInitialize: false,
        showOptions: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.transparent,
          handleColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          bufferedColor: Colors.transparent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
