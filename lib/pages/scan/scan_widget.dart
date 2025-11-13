import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
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
            FFAppState().addToAdnScan(_model.adnScans);
            setState(() {});
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
              setState(() {});
              await Future.delayed(const Duration(milliseconds: 200));
            }
          }
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF7A90A4),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                child: FlutterFlowTimer(
                  initialTime: FFAppState().countDown,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    milliSecond: false,
                  ),
                  controller: _model.timerController,
                  updateStateInterval: const Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.timerMilliseconds = value;
                    _model.timerValue = displayTime;
                    if (shouldUpdate) setState(() {});
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 267.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
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
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // Ouvrir le scanner QR code avec mobile_scanner
                        final scannedCode = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => _QRScannerScreen(),
                          ),
                        );

                        if (scannedCode != null && scannedCode.isNotEmpty) {
                          _model.adnScans = scannedCode;
                        } else {
                          _model.adnScans = '-1'; // Code annulé
                        }

                        if (_model.adnScans != '-1') {
                          FFAppState().addToAdnScan(_model.adnScans);
                        }
                        setState(() {});
                        if (FFAppState().Difficulte == true) {
                          if (FFAppState().continuer == true) {
                            await Future.wait([
                              Future(() async {
                                if (FFAppState().adnScan.contains('FANTOME') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('FANTOME');
                                  setState(() {});
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
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('MARSUPIAL');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('TASMANIE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('TASMANIE');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('ECLAIR') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('ECLAIR');
                                  setState(() {});
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
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('HYGROCHROME');
                                  setState(() {});
                                }
                              }),
                            ]);
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
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('BERSERKER');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('AXOLOLT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('AXOLOLT');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('SYMBIOZ') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SYMBIOZ');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('RESSORT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('RESSORT');
                                  setState(() {});
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
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SENTINELLE');
                                  setState(() {});
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
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFF3CEF26),
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
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('FANTOME');
                                  setState(() {});
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
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('MARSUPIAL');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('TASMANIE') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('TASMANIE');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('ECLAIR') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('ECLAIR');
                                  setState(() {});
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
                                        'vous pouvez pas scanner 2 fois le meme adn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('HYGROCHROME');
                                  setState(() {});
                                }
                              }),
                            ]);
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
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('BERSERKER');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('AXOLOLT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('AXOLOLT');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('SYMBIOZ') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SYMBIOZ');
                                  setState(() {});
                                }
                              }),
                              Future(() async {
                                if (FFAppState().adnScan.contains('RESSORT') ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('RESSORT');
                                  setState(() {});
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
                                        'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0xFFFF0004),
                                    ),
                                  );
                                  FFAppState().removeFromAdnScan('SENTINELLE');
                                  setState(() {});
                                }
                              }),
                            ]);
                          }
                        }

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '3ayp5h8n' /* Démarrer le scan */,
                      ),
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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

// Écran de scan QR code avec mobile_scanner
class _QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<_QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isScanned = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner QR Code'),
        backgroundColor: const Color(0xFF1D2428),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              if (_isScanned) return;

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  _isScanned = true;
                  Navigator.of(context).pop(barcode.rawValue);
                  break;
                }
              }
            },
          ),
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Placez le QR code dans le cadre',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
