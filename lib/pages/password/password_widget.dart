import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'password_model.dart';
export 'password_model.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late PasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      while (FFAppState().countDown != null) {
        FFAppState().countDown = _model.timerMilliseconds;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 200));
      }
    });

    _model.passWordTextController ??= TextEditingController();
    _model.passWordFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          actions: [
            Visibility(
              visible: FFAppState().continuer == false,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
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
                          fontFamily: 'Oswald',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF7A90A4),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/fond.png',
                ).image,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This row exists for when the "app bar" is hidden on desktop, having a way back for the user can work well.
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2oun6orm' /* Back */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zx2l5tcm' /* MOT DE PASSE FINAL D'EXTRACTIO... */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Urbanist',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.passWordTextController,
                        focusNode: _model.passWordFocusNode,
                        autofocus: false,
                        obscureText: !_model.passWordVisibility,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'r90vn38u' /* Mots de passe final d'extracti... */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Oswald',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFB8CBD0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFB8CBD0),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 20.0, 24.0),
                          prefixIcon: Icon(
                            Icons.password,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          suffixIcon: InkWell(
                            onTap: () => safeSetState(
                              () => _model.passWordVisibility =
                                  !_model.passWordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passWordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        cursorColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        validator: _model.passWordTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  if (FFAppState().animSend)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/jsons/animSend.json',
                        width: 311.0,
                        height: 130.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  if (FFAppState().animVerif)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/jsons/AnimCheck.json',
                        width: 188.0,
                        height: 152.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 50.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().Difficulte == true) {
                              if (FFAppState().continuer == true) {
                                if (_model.passWordTextController.text ==
                                    '20127') {
                                  FFAppState().animVerif = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Verification des fichiers adn !',
                                          enText: 'Checking DNA files!',
                                          esText:
                                              '¡Comprobando archivos de ADN!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF7335D0),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 8000));
                                  FFAppState().animVerif = false;
                                  safeSetState(() {});
                                  FFAppState().animSend = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Fichier en cours d\'envoi sur les serveurs de l\'agence !',
                                          enText:
                                              'File being sent to the agency\'s servers!',
                                          esText:
                                              '¡Archivo enviado a los servidores de la agencia!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF41E822),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 5000));
                                  FFAppState().animSend = false;
                                  safeSetState(() {});

                                  context.pushNamed('Win');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          frText: 'Erreur!',
                                          enText: 'Error!',
                                          esText: 'Error',
                                        )),
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          frText:
                                              'Le code que vous avez envoyer n\'est pas correct',
                                          enText:
                                              'The code you sent is not good',
                                          esText:
                                              'El codigo que enviaste no es bueno',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              frText: 'Réessayer',
                                              enText: 'Retry',
                                              esText: 'Intentar otra vez',
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                if (_model.passWordTextController.text ==
                                    '63184') {
                                  FFAppState().animVerif = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Verification des fichiers adn !',
                                          enText: 'Checking DNA files!',
                                          esText:
                                              '¡Comprobando archivos de ADN!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF7335D0),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 8000));
                                  FFAppState().animVerif = false;
                                  safeSetState(() {});
                                  FFAppState().animSend = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Fichier en cours d\'envoi sur les serveurs de l\'agence !',
                                          enText:
                                              'File being sent to the agency\'s servers!',
                                          esText:
                                              '¡Archivo enviado a los servidores de la agencia!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF41E822),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 5000));
                                  FFAppState().animSend = false;
                                  safeSetState(() {});

                                  context.pushNamed('Win');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          frText: 'Erreur!',
                                          enText: 'Error!',
                                          esText: 'Error',
                                        )),
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          frText:
                                              'Le code que vous avez envoyer n\'est pas correct',
                                          enText:
                                              'The code you sent is not good',
                                          esText:
                                              'El codigo que enviaste no es bueno',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              frText: 'Réessayer',
                                              enText: 'Retry',
                                              esText: 'Intentar otra vez',
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            } else {
                              if (FFAppState().continuer == true) {
                                if (_model.passWordTextController.text ==
                                    '63184') {
                                  FFAppState().animVerif = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Verification des fichiers adn !',
                                          enText: 'Checking DNA files!',
                                          esText:
                                              '¡Comprobando archivos de ADN!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF7335D0),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 8000));
                                  FFAppState().animVerif = false;
                                  safeSetState(() {});
                                  FFAppState().animSend = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Fichier en cours d\'envoi sur les serveurs de l\'agence !',
                                          enText:
                                              'File being sent to the agency\'s servers!',
                                          esText:
                                              '¡Archivo enviado a los servidores de la agencia!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF41E822),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 5000));
                                  FFAppState().animSend = false;
                                  safeSetState(() {});

                                  context.pushNamed('Win');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          frText: 'Erreur!',
                                          enText: 'Error!',
                                          esText: 'Error',
                                        )),
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          frText:
                                              'Le code que vous avez envoyer n\'est pas correct',
                                          enText:
                                              'The code you sent is not good',
                                          esText:
                                              'El codigo que enviaste no es bueno',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              frText: 'Réessayer',
                                              enText: 'Retry',
                                              esText: 'Intentar otra vez',
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                if (_model.passWordTextController.text ==
                                    '54972') {
                                  FFAppState().animVerif = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Verification des fichiers adn !',
                                          enText: 'Checking DNA files!',
                                          esText:
                                              '¡Comprobando archivos de ADN!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF7335D0),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 8000));
                                  FFAppState().animVerif = false;
                                  safeSetState(() {});
                                  FFAppState().animSend = true;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Fichier en cours d\'envoi sur les serveurs de l\'agence !',
                                          enText:
                                              'File being sent to the agency\'s servers!',
                                          esText:
                                              '¡Archivo enviado a los servidores de la agencia!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF41E822),
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 5000));
                                  FFAppState().animSend = false;
                                  safeSetState(() {});

                                  context.pushNamed('Win');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          frText: 'Erreur!',
                                          enText: 'Error!',
                                          esText: 'Error',
                                        )),
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          frText:
                                              'Le code que vous avez envoyer n\'est pas correct',
                                          enText:
                                              'The code you sent is not good',
                                          esText:
                                              'El codigo que enviaste no es bueno',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              frText: 'Réessayer',
                                              enText: 'Retry',
                                              esText: 'Intentar otra vez',
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'i2y6xlm4' /* Envoyer: */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
