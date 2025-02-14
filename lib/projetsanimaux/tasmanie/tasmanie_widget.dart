import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'tasmanie_model.dart';
export 'tasmanie_model.dart';

class TasmanieWidget extends StatefulWidget {
  const TasmanieWidget({super.key});

  @override
  State<TasmanieWidget> createState() => _TasmanieWidgetState();
}

class _TasmanieWidgetState extends State<TasmanieWidget> {
  late TasmanieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasmanieModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      while (FFAppState().countDown != null) {
        FFAppState().countDown = _model.timerMilliseconds;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 200));
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Enigmes');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'jwa5ckzm' /* TASMANIE */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: FlutterFlowTimer(
                  initialTime: FFAppState().countDown,
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
                        fontFamily: 'Urbanist',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
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
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'j770gff9' /* Ornithorhynchus anatinus, Orny... */,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Oswald',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Icon(
                    Icons.music_note,
                    color: Colors.black,
                    size: 50.0,
                  ),
                  FlutterFlowVideoPlayer(
                    path: 'assets/videos/Ornithorynque.mp4',
                    videoType: VideoType.asset,
                    autoPlay: true,
                    looping: true,
                    showControls: false,
                    allowFullScreen: false,
                    allowPlaybackSpeedMenu: false,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'n1hz2sus' /* Utilisez cette vidéo pour retr... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Oswald',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '37yczxvr' /* Le code est : nombre de doigts... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oswald',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'pfkunl8e' /* MOT DE PASSE */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Oswald',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Oswald',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          suffixIcon: InkWell(
                            onTap: () => safeSetState(
                              () => _model.passwordVisibility =
                                  !_model.passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Oswald',
                              letterSpacing: 0.0,
                            ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        cursorColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (FFAppState().Difficulte == true) {
                        if (_model.textController.text == '10') {
                          FFAppState().addToMdpfinale(
                              FFAppState().nbrmdp.elementAtOrNull(4)!);
                          safeSetState(() {});
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText: 'BRAVO!',
                                  enText: 'WELL DONE!',
                                  esText: '¡BIEN HECHO!',
                                )),
                                content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText:
                                      'Felicitations, vous avez trouver un nouveau morceaux du code final.',
                                  enText:
                                      'Congratulations, you have found a new piece of the final code.',
                                  esText:
                                      'Felicitaciones, ha encontrado una nueva parte del código final.',
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
                          FFAppState().NbrEnigmesFait =
                              FFAppState().NbrEnigmesFait + 1;
                          safeSetState(() {});
                          FFAppState().ornythorinque = true;
                          safeSetState(() {});

                          context.pushNamed('Accueil');
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText: 'ERREUR!',
                                  enText: 'ERROR!',
                                  esText: '¡ERROR!',
                                )),
                                content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText:
                                      'Le code que vous avez inséré n\'est pas le bon.',
                                  enText:
                                      'The code you entered is not the correct one.',
                                  esText:
                                      'El código que ingresaste no es el correcto.',
                                )),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      frText: 'Réessayer',
                                      enText: 'Try again',
                                      esText: 'Intentar otra vez',
                                    )),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        if (_model.textController.text == '10') {
                          FFAppState().addToMdpfinale(
                              FFAppState().nbrmdp.elementAtOrNull(9)!);
                          safeSetState(() {});
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText: 'BRAVO!',
                                  enText: 'WELL DONE!',
                                  esText: '¡BIEN HECHO!',
                                )),
                                content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText:
                                      'Felicitations, vous avez trouver un nouveau morceaux du code final.',
                                  enText:
                                      'Congratulations, you have found a new piece of the final code.',
                                  esText:
                                      'Felicitaciones, ha encontrado una nueva parte del código final.',
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
                          FFAppState().NbrEnigmesFait =
                              FFAppState().NbrEnigmesFait + 1;
                          safeSetState(() {});
                          FFAppState().ornythorinque = true;
                          safeSetState(() {});

                          context.pushNamed('Accueil');
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText: 'ERREUR!',
                                  enText: 'ERROR!',
                                  esText: '¡ERROR!',
                                )),
                                content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  frText:
                                      'Le code que vous avez inséré n\'est pas le bon.',
                                  enText:
                                      'The code you entered is not the correct one.',
                                  esText:
                                      'El código que ingresaste no es el correcto.',
                                )),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      frText: 'Réessayer',
                                      enText: 'Try again',
                                      esText: 'Intentar otra vez',
                                    )),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      'af38b3sf' /* VALIDER */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
