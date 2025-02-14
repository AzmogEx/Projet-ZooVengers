import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'scan_model.dart';
export 'scan_model.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({super.key});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  late ScanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      await Future.wait([
        Future(() async {
          while (FFAppState().adnScan.contains(
              FFAppState().adnScan.contains(_model.adnScans).toString())) {
            FFAppState().addToAdnScan(_model.adnScans!);
            safeSetState(() {});
            await Future.delayed(const Duration(milliseconds: 200));
          }
        }),
        Future(() async {
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
        }),
      ]);
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
        backgroundColor: Color(0xFF7A90A4),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'przuw6rp' /* Scan QR Code */,
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Oswald',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [
            Visibility(
              visible: FFAppState().continuer == false,
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
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'j9t9yuit' /* Placez le qr code au milieu du... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 267.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.qr_code_scanner,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 128.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.adnScans = await actions.scanQRCode(
                          context,
                        );
                        _shouldSetState = true;
                        FFAppState().addToAdnScan(_model.adnScans!);
                        safeSetState(() {});
                        if (FFAppState().Difficulte == true) {
                          if (FFAppState().continuer == true) {
                            await Future.wait([
                              Future(() async {
                                if (FFAppState().adnScan.contains('FANTOME') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('FANTOME');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('MARSUPIAL') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('MARSUPIAL');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('TASMANIE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('TASMANIE');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('ECLAIR') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('ECLAIR');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('HYGROCHROME') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('HYGROCHROME');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                            ]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ADN Correctement scanner, projet ajouter dans la section enigme !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF3CEF26),
                              ),
                            );
                          } else {
                            await Future.wait([
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('BERSERKER') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('BERSERKER');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('AXOLOLT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('AXOLOLT');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('SYMBIOZ') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SYMBIOZ');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('RESSORT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('RESSORT');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('SENTINELLE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SENTINELLE');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                            ]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ADN Correctement scanner, projet ajouter dans la section enigme !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF3CEF26),
                              ),
                            );
                          }
                        } else {
                          if (FFAppState().continuer == false) {
                            await Future.wait([
                              Future(() async {
                                if (FFAppState().adnScan.contains('FANTOME') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('FANTOME');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('MARSUPIAL') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('MARSUPIAL');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('TASMANIE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('TASMANIE');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('ECLAIR') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('ECLAIR');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('HYGROCHROME') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('HYGROCHROME');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                            ]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ADN Correctement scanner, projet ajouter dans la section enigme !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF3CEF26),
                              ),
                            );
                          } else {
                            await Future.wait([
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('BERSERKER') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('BERSERKER');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('AXOLOLT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('AXOLOLT');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('SYMBIOZ') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SYMBIOZ');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('RESSORT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('RESSORT');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                              Future(() async {
                                if (FFAppState()
                                        .adnScan
                                        .contains('SENTINELLE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          frText:
                                              'Attention, vous avez déjà scanner cet ADN ou alors il sera disponible dans une prochaine mission !',
                                          enText:
                                              'Be careful, you have already scanned this DNA or it will be available in a future mission!',
                                          esText:
                                              '¡Ten cuidado, ya has escaneado este ADN o estará disponible en una futura misión!',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SENTINELLE');
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }),
                            ]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ADN Correctement scanner, projet ajouter dans la section enigme !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF3CEF26),
                              ),
                            );
                          }
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '3ayp5h8n' /* Démarrer le scan */,
                      ),
                      options: FFButtonOptions(
                        width: 200.0,
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
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
