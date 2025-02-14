import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'win_model.dart';
export 'win_model.dart';

class WinWidget extends StatefulWidget {
  const WinWidget({super.key});

  @override
  State<WinWidget> createState() => _WinWidgetState();
}

class _WinWidgetState extends State<WinWidget> {
  late WinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WinModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF7A90A4),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/fond.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 160.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vodp8nnj' /* Félicitation */,
                    ),
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 50.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '46w5o9af' /* Vous avez réussi à retrouvez t... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FlutterFlowTimer(
                    initialTime: valueOrDefault<int>(
                      FFAppState().deuxheures - FFAppState().countDown,
                      0,
                    ),
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                      value,
                      hours: false,
                      milliSecond: false,
                    ),
                    controller: _model.timerController,
                    updateStateInterval: Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds = value;
                      _model.timerValue = displayTime;
                      if (shouldUpdate) safeSetState(() {});
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Oswald',
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                if (FFAppState().lang == 'fr')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowVideoPlayer(
                      path: 'assets/videos/final-fr.mp4',
                      videoType: VideoType.asset,
                      autoPlay: true,
                      looping: false,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                if (FFAppState().lang == 'en')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowVideoPlayer(
                      path: 'assets/videos/final-en.mp4',
                      videoType: VideoType.asset,
                      autoPlay: true,
                      looping: false,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                if (FFAppState().lang == 'es')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowVideoPlayer(
                      path: 'assets/videos/final-es.mp4',
                      videoType: VideoType.asset,
                      autoPlay: true,
                      looping: false,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                if (FFAppState().continuer == false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 100.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        FFAppState().continuer = true;
                        safeSetState(() {});
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text(
                                  FFLocalizations.of(context).getVariableText(
                                frText: 'Attention:',
                                enText: 'Attention:',
                                esText: 'Atención:',
                              )),
                              content: Text(
                                  FFLocalizations.of(context).getVariableText(
                                frText:
                                    'Vous pouvez maintenant scanner les 5 autres traces d’adn, Les énigmes vont maintenant s’adapter au niveau de difficulté que vous avez choisit',
                                enText:
                                    'You can now scan the other 5 DNA traces. The puzzles will now adapt to the difficulty level you have chosen.',
                                esText:
                                    'Ahora puedes escanear los otros 5 rastros de ADN. Los rompecabezas ahora se adaptarán al nivel de dificultad que hayas elegido.',
                              )),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text(FFLocalizations.of(context)
                                      .getVariableText(
                                    frText: 'Continuer',
                                    enText: 'Continue',
                                    esText: 'Continuar',
                                  )),
                                ),
                              ],
                            );
                          },
                        );
                        FFAppState().hygrochrome = false;
                        safeSetState(() {});
                        FFAppState().adnScan = [];
                        safeSetState(() {});
                        FFAppState().ours = false;
                        safeSetState(() {});
                        FFAppState().guerrisseur = false;
                        safeSetState(() {});
                        FFAppState().chauve = false;
                        safeSetState(() {});
                        FFAppState().chamois = false;
                        safeSetState(() {});
                        FFAppState().colibri = false;
                        safeSetState(() {});
                        FFAppState().panthere = false;
                        safeSetState(() {});
                        FFAppState().paresseux = false;
                        safeSetState(() {});
                        FFAppState().ornythorinque = false;
                        safeSetState(() {});
                        FFAppState().sucre = false;
                        safeSetState(() {});
                        FFAppState().hibou = false;
                        safeSetState(() {});

                        context.pushNamed('Accueil');
                      },
                      text: FFLocalizations.of(context).getText(
                        'heponw3y' /* Continuer ? */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Oswald',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
