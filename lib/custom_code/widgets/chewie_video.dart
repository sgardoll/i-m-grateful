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
    required this.imageUrl, // New parameter for image URL
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;
  final String imageUrl; // New parameter for image URL

  @override
  _ChewieVideoState createState() => _ChewieVideoState();
}

class _ChewieVideoState extends State<ChewieVideo> {
  late final VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;

  double aspectRatio = 0.0;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
      })
      ..addListener(() {
        if (_videoPlayerController.value.hasError) {
          print(
              "Video player had an error: ${_videoPlayerController.value.errorDescription}");
        }
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    aspectRatio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: aspectRatio,
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

  Widget _buildChewie() {
    if (_chewieController != null) {
      return Chewie(
        controller: _chewieController!,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _isVideoInitialized
          ? FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _buildChewie(),
              ),
            )
          : Image.network(
              widget.imageUrl, // Use the image URL parameter
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
