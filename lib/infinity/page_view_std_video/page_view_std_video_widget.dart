import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/infinity/key_selling_point/key_selling_point_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_view_std_video_model.dart';
export 'page_view_std_video_model.dart';

class PageViewStdVideoWidget extends StatefulWidget {
  const PageViewStdVideoWidget({Key? key}) : super(key: key);

  @override
  _PageViewStdVideoWidgetState createState() => _PageViewStdVideoWidgetState();
}

class _PageViewStdVideoWidgetState extends State<PageViewStdVideoWidget>
    with TickerProviderStateMixin {
  late PageViewStdVideoModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 100.ms,
          duration: 1200.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 100.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageViewStdVideoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 180.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: Stack(
          children: [
            PageView(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              onPageChanged: (_) => setState(() {}),
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowVideoPlayer(
                          path:
                              'https://www.connectio.com.au/grateful/newOn/on2.webm',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 16.0, 0.0),
                        child: Container(
                          width: 153.0,
                          height: 176.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.keySellingPointModel1,
                              updateCallback: () => setState(() {}),
                              child: KeySellingPointWidget(
                                heading: 'Insightful Journey',
                                copy:
                                    'Uncover deep insights from your entries and share your gratitude journey with our community',
                                icon: 'exp',
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowVideoPlayer(
                          path:
                              'https://www.connectio.com.au/grateful/newOn/on3.webm',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.keySellingPointModel2,
                        updateCallback: () => setState(() {}),
                        child: KeySellingPointWidget(
                          heading: 'Boundless Gratitude',
                          copy:
                              'Store and revisit endless moments of joy and thankfulness',
                          icon: 'cal',
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowVideoPlayer(
                          path:
                              'https://www.connectio.com.au/grateful/newOn/on4.webm',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.keySellingPointModel3,
                        updateCallback: () => setState(() {}),
                        child: KeySellingPointWidget(
                          heading: 'Personalized Expression',
                          copy:
                              'Tailor your entries with unique styles that mirror your gratitude journey',
                          icon: 'sty',
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowVideoPlayer(
                          path:
                              'https://www.connectio.com.au/grateful/newOn/on5.webm',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.keySellingPointModel4,
                        updateCallback: () => setState(() {}),
                        child: KeySellingPointWidget(
                          heading: 'Endless Creativity',
                          copy:
                              'Generate new images until you find the perfect one that resonates with your feelings',
                          icon: 'reg',
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowVideoPlayer(
                          path:
                              'https://www.connectio.com.au/grateful/newOn/on1.webm',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                child: smooth_page_indicator.SmoothPageIndicator(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: 0),
                  count: 5,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) async {
                    await _model.pageViewController!.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: smooth_page_indicator.ExpandingDotsEffect(
                    expansionFactor: 3.0,
                    spacing: 8.0,
                    radius: 16.0,
                    dotWidth: 16.0,
                    dotHeight: 12.0,
                    dotColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeDotColor: FlutterFlowTheme.of(context).alternate,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
