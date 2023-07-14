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

import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcVideo extends StatefulWidget {
  const VlcVideo({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
    required this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;
  final String imageUrl;

  @override
  _VlcVideoState createState() => _VlcVideoState();
}

class _VlcVideoState extends State<VlcVideo> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.videoUrl,
      //hwAcc: HwAcc.AUTO,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 9,
        placeholder: Image.network(
          widget.imageUrl,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
    super.dispose();
  }
}
