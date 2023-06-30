import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fullscreen_image_model.dart';
export 'fullscreen_image_model.dart';

class FullscreenImageWidget extends StatefulWidget {
  const FullscreenImageWidget({
    Key? key,
    String? imageUrl,
  })  : this.imageUrl =
            imageUrl ?? 'https://www.connectio.com.au/grateful/loading.png',
        super(key: key);

  final String imageUrl;

  @override
  _FullscreenImageWidgetState createState() => _FullscreenImageWidgetState();
}

class _FullscreenImageWidgetState extends State<FullscreenImageWidget> {
  late FullscreenImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullscreenImageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FullscreenImage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('FULLSCREEN_IMAGE_PAGE_Image_ON_TAP');
          logFirebaseEvent('Image_navigate_back');
          context.safePop();
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: Image.network(
                valueOrDefault<String>(
                  widget.imageUrl,
                  'https://www.connectio.com.au/grateful/loading.png',
                ),
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}
