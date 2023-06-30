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

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieVideo extends StatefulWidget {
  const ChewieVideo({
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
  late final VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((_) {
      setState(() {});
    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
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
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
