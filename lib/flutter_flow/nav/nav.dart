import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) => HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'salesdatatotal',
          path: '/salesdatatotal',
          builder: (context, params) => SalesdatatotalWidget(),
        ),
        FFRoute(
          name: 'menumanagement',
          path: '/menumanagement',
          builder: (context, params) => MenumanagementWidget(),
        ),
        FFRoute(
          name: 'categorymanagement',
          path: '/categorymanagement',
          builder: (context, params) => CategorymanagementWidget(),
        ),
        FFRoute(
          name: 'MenuSettings',
          path: '/menuSettings',
          builder: (context, params) => MenuSettingsWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'tablecode',
          path: '/tablecode',
          builder: (context, params) => TablecodeWidget(),
        ),
        FFRoute(
          name: 'qrcode',
          path: '/qrcode',
          builder: (context, params) => QrcodeWidget(),
        ),
        FFRoute(
          name: 'abouttheresutaurant',
          path: '/abouttheresutaurant',
          builder: (context, params) => AbouttheresutaurantWidget(),
        ),
        FFRoute(
          name: 'paswordSettings',
          path: '/paswordSettings',
          builder: (context, params) => PaswordSettingsWidget(),
        ),
        FFRoute(
          name: 'PaymentSettings',
          path: '/paymentSettings',
          builder: (context, params) => PaymentSettingsWidget(),
        ),
        FFRoute(
          name: 'PascodeSettings',
          path: '/pascodeSettings',
          builder: (context, params) => PascodeSettingsWidget(),
        ),
        FFRoute(
          name: 'taxsettings',
          path: '/taxsettings',
          builder: (context, params) => TaxsettingsWidget(),
        ),
        FFRoute(
          name: 'accountingsettings',
          path: '/accountingsettings',
          builder: (context, params) => AccountingsettingsWidget(),
        ),
        FFRoute(
          name: 'ordersettings',
          path: '/ordersettings',
          builder: (context, params) => OrdersettingsWidget(),
        ),
        FFRoute(
          name: 'CallSettings',
          path: '/callSettings',
          builder: (context, params) => CallSettingsWidget(),
        ),
        FFRoute(
          name: 'ManegerSettings',
          path: '/manegerSettings',
          builder: (context, params) => ManegerSettingsWidget(),
        ),
        FFRoute(
          name: 'security',
          path: '/security',
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: 'printerSettings',
          path: '/printerSettings',
          builder: (context, params) => PrinterSettingsWidget(),
        ),
        FFRoute(
          name: 'CloudService',
          path: '/cloudService',
          builder: (context, params) => CloudServiceWidget(),
        ),
        FFRoute(
          name: 'takeout',
          path: '/takeout',
          builder: (context, params) => TakeoutWidget(),
        ),
        FFRoute(
          name: 'delivery',
          path: '/delivery',
          builder: (context, params) => DeliveryWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: 'viking',
          path: '/viking',
          builder: (context, params) => VikingWidget(),
        ),
        FFRoute(
          name: 'freebox',
          path: '/freebox',
          builder: (context, params) => FreeboxWidget(),
        ),
        FFRoute(
          name: 'menumanagementCopy2',
          path: '/AddMenu',
          builder: (context, params) => MenumanagementCopy2Widget(),
        ),
        FFRoute(
          name: 'AddMenutoOrder',
          path: '/addMenutoOrder',
          builder: (context, params) => AddMenutoOrderWidget(),
        ),
        FFRoute(
          name: 'GGGG',
          path: '/gggg',
          builder: (context, params) => GgggWidget(),
        ),
        FFRoute(
          name: 'accounting',
          path: '/accounting',
          builder: (context, params) => AccountingWidget(),
        ),
        FFRoute(
          name: 'ChangeRecipt',
          path: '/changeRecipt',
          builder: (context, params) => ChangeReciptWidget(),
        ),
        FFRoute(
          name: 'ReciptBox',
          path: '/reciptBox',
          builder: (context, params) => ReciptBoxWidget(),
        ),
        FFRoute(
          name: 'ReciptBoxCopy',
          path: '/reciptBoxCopy',
          builder: (context, params) => ReciptBoxCopyWidget(),
        ),
        FFRoute(
          name: 'salesdatatotalCopy2',
          path: '/salesdatatotalCopy2',
          builder: (context, params) => SalesdatatotalCopy2Widget(),
        ),
        FFRoute(
          name: 'menumanagementCopy',
          path: '/menumanagementCopy',
          builder: (context, params) => MenumanagementCopyWidget(),
        ),
        FFRoute(
          name: 'Seisan2',
          path: '/seisan2',
          builder: (context, params) => Seisan2Widget(),
        ),
        FFRoute(
          name: 'CompletedOrders',
          path: '/completedOrders',
          builder: (context, params) => CompletedOrdersWidget(),
        ),
        FFRoute(
          name: 'OrderNow',
          path: '/orderNow',
          builder: (context, params) => OrderNowWidget(),
        ),
        FFRoute(
          name: 'OrderNowCopy',
          path: '/orderNowCopy',
          builder: (context, params) => OrderNowCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
