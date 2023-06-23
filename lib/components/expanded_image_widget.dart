import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'expanded_image_model.dart';
export 'expanded_image_model.dart';

class ExpandedImageWidget extends StatefulWidget {
  const ExpandedImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  _ExpandedImageWidgetState createState() => _ExpandedImageWidgetState();
}

class _ExpandedImageWidgetState extends State<ExpandedImageWidget> {
  late ExpandedImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandedImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: FFAppState().primary,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('EXPANDED_IMAGE_Image_9m60vhb7_ON_TAP');
                logFirebaseEvent('Image_navigate_back');
                context.safePop();
              },
              child: Hero(
                tag: valueOrDefault<String>(
                  widget.imageUrl,
                  'https://www.connectio.com.au/grateful/loading.png',
                ),
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: valueOrDefault<String>(
                      widget.imageUrl,
                      'https://www.connectio.com.au/grateful/loading.png',
                    ),
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
