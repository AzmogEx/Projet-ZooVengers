import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'enigmes_model.dart';
export 'enigmes_model.dart';

class EnigmesWidget extends StatefulWidget {
  const EnigmesWidget({super.key});

  @override
  State<EnigmesWidget> createState() => _EnigmesWidgetState();
}

class _EnigmesWidgetState extends State<EnigmesWidget> {
  late EnigmesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnigmesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().continuer == true) {
        _model.timerController.onStopTimer();
      } else {
        _model.timerController.onStartTimer();
        while (FFAppState().countDown != null) {
          FFAppState().countDown = _model.timerMilliseconds;
          safeSetState(() {});
          await Future.delayed(const Duration(milliseconds: 200));
        }
      }
    });

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
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                's4mzzcnt' /* Enigmes */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Oswald',
                    color: Colors.white,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [
            Visibility(
              visible: FFAppState().continuer == false,
              child: Align(
                alignment: AlignmentDirectional(1.0, -1.0),
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
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7A90A4),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/fond.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == true) &&
                                        (FFAppState()
                                                .adnScan
                                                .contains('HYGROCHROME') ==
                                            true)) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('HYGROCHROME')))
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().hygrochrome == true) {
                                        context.pushNamed('nuit');
                                      } else {
                                        context.pushNamed('projetNuit');
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '8kntvy5u' /* NUIT NOIRE */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FFAppState().chauve == true
                                          ? Color(0xFF00F91C)
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Oswald',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('SENTINELLE')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('SENTINELLE')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().sentinelle == true) {
                                          context.pushNamed('sentinelle');
                                        } else {
                                          context.pushNamed('projetSentinelle');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ejqwm72z' /* SENTINELLE */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().hibou == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('SYMBIOZ')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('SYMBIOZ')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().simbioz == true) {
                                          context.pushNamed('symbioz');
                                        } else {
                                          context.pushNamed('projetSylbioz');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'hlxlfhqr' /* SYMBIOZ */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().paresseux == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('RESSORT')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('RESSORT')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().ressort == true) {
                                          context.pushNamed('ressort');
                                        } else {
                                          context.pushNamed('projetRessort');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '4vtiu98s' /* RESSORT */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().chamois == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('TASMANIE')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('TASMANIE')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().tasmanie == true) {
                                          context.pushNamed('tasmanie');
                                        } else {
                                          context.pushNamed('projetTasmanie');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'it17rejo' /* TASMANIE */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FFAppState().ornythorinque == true
                                                ? Color(0xFF00F91C)
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('AXOLOLT')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('AXOLOLT')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().hygrochrome == true) {
                                          context.pushNamed('guerisseur');
                                        } else {
                                          context.pushNamed('projetGuerisseur');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'toqpqu3u' /* GUERISSEUR */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().guerrisseur == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('FANTOME')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('FANTOME')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().fantome == true) {
                                          context.pushNamed('fantome');
                                        } else {
                                          context.pushNamed('projetFantome');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'kb2gx9ki' /* FANTOME */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().panthere == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('ECLAIR')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('ECLAIR')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().eclair == true) {
                                          context.pushNamed('eclair');
                                        } else {
                                          context.pushNamed('projetEclair');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '9v6c5e2m' /* ECLAIR */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().colibri == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('MARSUPIAL')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('MARSUPIAL')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().marsupilan == true) {
                                          context.pushNamed('marsupial');
                                        } else {
                                          context.pushNamed('projetMarsupial');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '2077hesm' /* MARSUPIAL */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().sucre == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (((FFAppState().Difficulte == false) &&
                                        (FFAppState().continuer == false) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('BERSERKER')) ||
                                    ((FFAppState().Difficulte == true) &&
                                        (FFAppState().continuer == true) &&
                                        FFAppState()
                                            .adnScan
                                            .contains('BERSERKER')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState().berserk == true) {
                                          context.pushNamed('berserker');
                                        } else {
                                          context.pushNamed('projetBerserk');
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'kae5yyd8' /* BERSERKER */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FFAppState().ours == true
                                            ? Color(0xFF00F91C)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x007A90A4),
                          ),
                          child: AlignedTooltip(
                            content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                FFAppState().NbrEnigmesFait == 0
                                    ? FFLocalizations.of(context)
                                        .getVariableText(
                                        frText:
                                            'N\'oubliez pas votre mission : chercher les 5 traces d\'animaux cachées dans le musée et les scanner.  Pour les experts vous devez vous aidez du decryptek.',
                                        enText:
                                            'Don\'t forget your mission: find the 5 animal tracks hidden in the museum and scan them. Take care and stay alert.',
                                        esText:
                                            'No olvides tu misión: encuentra las 5 huellas de animales escondidas en el museo y escanéalas. Cuídate y mantente alerta.',
                                      )
                                    : (FFAppState().NbrEnigmesFait == 1
                                        ? FFLocalizations.of(context)
                                            .getVariableText(
                                            frText:
                                                'Il ne vous reste plus que 4 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
                                            enText:
                                                'You only have 4 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
                                            esText:
                                                'Solo te quedan 4 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!',
                                          )
                                        : (FFAppState().NbrEnigmesFait == 2
                                            ? FFLocalizations.of(context)
                                                .getVariableText(
                                                frText:
                                                    'Il ne vous reste plus que 3 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
                                                enText:
                                                    'You only have 3 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
                                                esText:
                                                    'Solo te quedan 3 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!Solo te quedan 3 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!',
                                              )
                                            : (FFAppState().NbrEnigmesFait == 3
                                                ? FFLocalizations.of(context)
                                                    .getVariableText(
                                                    frText:
                                                        'Il ne vous reste plus que 2 énigmes à résoudre sur les 5. Continuez, vous êtes presque au bout !',
                                                    enText:
                                                        'You only have 2 puzzles left to solve out of the 5. Keep going, you\'re almost at the end!',
                                                    esText:
                                                        'Solo te quedan 2 acertijos por resolver de los 5. ¡Sigue adelante, ya casi llegas al final!',
                                                  )
                                                : (FFAppState()
                                                            .NbrEnigmesFait ==
                                                        4
                                                    ? FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                        frText:
                                                            'Il ne vous reste plus qu\' une énigme à résoudre sur les 5. Continuez, vous êtes presque au bout !',
                                                        enText:
                                                            'You only have one puzzle left to solve out of the 5. Keep going, you\'re almost at the end!',
                                                        esText:
                                                            'Solo te queda un rompecabezas de los 5 por resolver. ¡Sigue adelante, ya casi llegas al final!',
                                                      )
                                                    : FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                        frText:
                                                            'Félicitations ! Vous avez résolu toutes les énigmes. Maintenant, insérez le code final pour envoyer les données trouvées.',
                                                        enText:
                                                            'Congratulations ! You have solved all the puzzles. Now insert the final code to send the found data.',
                                                        esText:
                                                            '¡Felicitaciones! Has resuelto todos los acertijos. Ahora inserte el código final para enviar los datos encontrados.',
                                                      ))))),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Oswald',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                            offset: 4.0,
                            preferredDirection: AxisDirection.up,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 40.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 100),
                            showDuration: Duration(milliseconds: 4000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Logo_aide_design_20x20_(1).png',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
