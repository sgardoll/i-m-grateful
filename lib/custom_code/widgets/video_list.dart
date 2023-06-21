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
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  const VideoList({
    Key? key,
    this.width,
    this.height,
    required this.files,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> files;

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  VideoPlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: widget.files.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _controller = VideoPlayerController.network(widget.files[index])
                  ..initialize().then((_) {
                    _controller!.play();
                  });
              });
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(widget.files[index].split('/').last),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
