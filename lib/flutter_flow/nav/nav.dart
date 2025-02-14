import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/ZOOVENGERS_splash.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : DemarrageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/ZOOVENGERS_splash.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : DemarrageWidget(),
        ),
        FFRoute(
          name: 'Start',
          path: '/start',
          builder: (context, params) => StartWidget(),
        ),
        FFRoute(
          name: 'Timer',
          path: '/timer',
          builder: (context, params) => TimerWidget(),
        ),
        FFRoute(
          name: 'Accueil',
          path: '/accueil',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Accueil')
              : AccueilWidget(),
        ),
        FFRoute(
          name: 'Decryptek',
          path: '/decryptek',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Decryptek')
              : DecryptekWidget(),
        ),
        FFRoute(
          name: 'GameOver',
          path: '/gameOver',
          builder: (context, params) => GameOverWidget(),
        ),
        FFRoute(
          name: 'Win',
          path: '/win',
          builder: (context, params) => WinWidget(),
        ),
        FFRoute(
          name: 'Scan',
          path: '/scan',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Scan') : ScanWidget(),
        ),
        FFRoute(
          name: 'Enigmes',
          path: '/enigmes',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Enigmes')
              : EnigmesWidget(),
        ),
        FFRoute(
          name: 'projetBerserk',
          path: '/projetBerserk',
          builder: (context, params) => ProjetBerserkWidget(),
        ),
        FFRoute(
          name: 'password',
          path: '/password',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'password')
              : PasswordWidget(),
        ),
        FFRoute(
          name: 'projetEclair',
          path: '/projetEclair',
          builder: (context, params) => ProjetEclairWidget(),
        ),
        FFRoute(
          name: 'projetFantome',
          path: '/projetFantome',
          builder: (context, params) => ProjetFantomeWidget(),
        ),
        FFRoute(
          name: 'projetNuit',
          path: '/projetNuit',
          builder: (context, params) => ProjetNuitWidget(),
        ),
        FFRoute(
          name: 'projetRessort',
          path: '/projetRessort',
          builder: (context, params) => ProjetRessortWidget(),
        ),
        FFRoute(
          name: 'projetSentinelle',
          path: '/projetSentinelle',
          builder: (context, params) => ProjetSentinelleWidget(),
        ),
        FFRoute(
          name: 'projetSylbioz',
          path: '/projetSylbioz',
          builder: (context, params) => ProjetSylbiozWidget(),
        ),
        FFRoute(
          name: 'projetTasmanie',
          path: '/projetTasmanie',
          builder: (context, params) => ProjetTasmanieWidget(),
        ),
        FFRoute(
          name: 'projetMarsupial',
          path: '/projetMarsupial',
          builder: (context, params) => ProjetMarsupialWidget(),
        ),
        FFRoute(
          name: 'projetGuerisseur',
          path: '/projetGuerisseur',
          builder: (context, params) => ProjetGuerisseurWidget(),
        ),
        FFRoute(
          name: 'berserker',
          path: '/berserker',
          builder: (context, params) => BerserkerWidget(),
        ),
        FFRoute(
          name: 'eclair',
          path: '/eclair',
          builder: (context, params) => EclairWidget(),
        ),
        FFRoute(
          name: 'fantome',
          path: '/fantome',
          builder: (context, params) => FantomeWidget(),
        ),
        FFRoute(
          name: 'guerisseur',
          path: '/guerisseur',
          builder: (context, params) => GuerisseurWidget(),
        ),
        FFRoute(
          name: 'marsupial',
          path: '/marsupial',
          builder: (context, params) => MarsupialWidget(),
        ),
        FFRoute(
          name: 'nuit',
          path: '/nuit',
          builder: (context, params) => NuitWidget(),
        ),
        FFRoute(
          name: 'ressort',
          path: '/ressort',
          builder: (context, params) => RessortWidget(),
        ),
        FFRoute(
          name: 'sentinelle',
          path: '/sentinelle',
          builder: (context, params) => SentinelleWidget(),
        ),
        FFRoute(
          name: 'symbioz',
          path: '/symbioz',
          builder: (context, params) => SymbiozWidget(),
        ),
        FFRoute(
          name: 'tasmanie',
          path: '/tasmanie',
          builder: (context, params) => TasmanieWidget(),
        ),
        FFRoute(
          name: 'Demarrage',
          path: '/demarrage',
          builder: (context, params) => DemarrageWidget(),
        ),
        FFRoute(
          name: 'video',
          path: '/video',
          builder: (context, params) => VideoWidget(),
        ),
        FFRoute(
          name: 'revisionnage',
          path: '/revisionnage',
          builder: (context, params) => RevisionnageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
