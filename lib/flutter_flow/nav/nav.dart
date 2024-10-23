import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const NavBarPage() : const Pantainci1Widget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const Pantainci1Widget(),
          routes: [
            FFRoute(
              name: 'HomeSearch',
              path: 'homeSearch',
              builder: (context, params) => HomeSearchWidget(
                currentLatLng: params.getParam<LatLng>(
                  'currentLatLng',
                  ParamType.LatLng,
                  isList: true,
                ),
                authUser: params.getParam(
                  'authUser',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'User',
              path: 'user',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'User')
                  : const UserWidget(),
            ),
            FFRoute(
              name: 'Filtros',
              path: 'filtros',
              builder: (context, params) => const FiltrosWidget(),
            ),
            FFRoute(
              name: 'Favorites1',
              path: 'favorites1',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'Favorites1')
                  : const Favorites1Widget(),
            ),
            FFRoute(
              name: 'RegisterUser1',
              path: 'registerUser1',
              builder: (context, params) => const RegisterUser1Widget(),
            ),
            FFRoute(
              name: 'RegisterUser2',
              path: 'registerUser2',
              builder: (context, params) => const RegisterUser2Widget(),
            ),
            FFRoute(
              name: 'RegisterProfessional1',
              path: 'registerProfessional1',
              builder: (context, params) => RegisterProfessional1Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'RegisterProfessional2',
              path: 'registerProfessional2',
              builder: (context, params) => RegisterProfessional2Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => const LoginWidget(),
            ),
            FFRoute(
              name: 'Escoger_Usuario',
              path: 'escogerUsuario',
              builder: (context, params) => const EscogerUsuarioWidget(),
            ),
            FFRoute(
              name: 'userprofile',
              path: 'userprofile',
              requireAuth: true,
              builder: (context, params) => const UserprofileWidget(),
            ),
            FFRoute(
              name: 'chat_2_Details',
              path: 'chat2Details',
              requireAuth: true,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
                chatRefTotal: params.getParam(
                  'chatRefTotal',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'chat_2_main',
              path: 'chat2Main',
              requireAuth: true,
              builder: (context, params) => const Chat2MainWidget(),
            ),
            FFRoute(
              name: 'image_Details',
              path: 'imageDetails',
              asyncParams: {
                'chatMessage':
                    getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
              },
              builder: (context, params) => ImageDetailsWidget(
                chatMessage: params.getParam(
                  'chatMessage',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Profilesettings',
              path: 'profilesettings',
              requireAuth: true,
              builder: (context, params) => const ProfilesettingsWidget(),
            ),
            FFRoute(
              name: 'listofcollaborators',
              path: 'listofcollaborators',
              requireAuth: true,
              builder: (context, params) => const ListofcollaboratorsWidget(),
            ),
            FFRoute(
              name: 'ProfileInfo',
              path: 'profileInfo',
              requireAuth: true,
              builder: (context, params) => ProfileInfoWidget(
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'peoplewhoputyouinfavorites',
              path: 'peoplewhoputyouinfavorites',
              requireAuth: true,
              builder: (context, params) => const PeoplewhoputyouinfavoritesWidget(),
            ),
            FFRoute(
              name: 'peoplewhoputyouinfavoriteBasic',
              path: 'peoplewhoputyouinfavoriteBasic',
              requireAuth: true,
              builder: (context, params) =>
                  const PeoplewhoputyouinfavoriteBasicWidget(),
            ),
            FFRoute(
              name: 'favV2',
              path: 'favV2',
              requireAuth: true,
              builder: (context, params) => const FavV2Widget(),
            ),
            FFRoute(
              name: 'RegisterProfessional3',
              path: 'registerProfessional3',
              builder: (context, params) => const RegisterProfessional3Widget(),
            ),
            FFRoute(
              name: 'MembresiasV2',
              path: 'membresiasV2',
              builder: (context, params) => MembresiasV2Widget(
                professionalUpdate: params.getParam(
                  'professionalUpdate',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
                isUpdate: params.getParam(
                  'isUpdate',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'RegisterBusiness1',
              path: 'registerBusiness1',
              builder: (context, params) => RegisterBusiness1Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'RegisterBusiness2',
              path: 'registerBusiness2',
              builder: (context, params) => RegisterBusiness2Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'RegisterBusiness3',
              path: 'registerBusiness3',
              builder: (context, params) => const RegisterBusiness3Widget(),
            ),
            FFRoute(
              name: 'RegisterBusiness4',
              path: 'registerBusiness4',
              builder: (context, params) => const RegisterBusiness4Widget(),
            ),
            FFRoute(
              name: 'tinderv2C1',
              path: 'tinderv2C1',
              builder: (context, params) => const Tinderv2C1Widget(),
            ),
            FFRoute(
              name: 'news',
              path: 'news',
              requireAuth: true,
              builder: (context, params) => const NewsWidget(),
            ),
            FFRoute(
              name: 'BlockList',
              path: 'blockList',
              builder: (context, params) => const BlockListWidget(),
            ),
            FFRoute(
              name: 'STANDAR',
              path: 'standar',
              builder: (context, params) => StandarWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
              ),
            ),
            FFRoute(
              name: 'Premium',
              path: 'premium',
              builder: (context, params) => PremiumWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
                isUpdatePremiun: params.getParam(
                  'isUpdatePremiun',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'BASIC',
              path: 'basic',
              builder: (context, params) => BasicWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
              ),
            ),
            FFRoute(
              name: 'MySubscriptionStandard',
              path: 'mySubscriptionStandard',
              builder: (context, params) => const MySubscriptionStandardWidget(),
            ),
            FFRoute(
              name: 'MySubscriptionPremium',
              path: 'mySubscriptionPremium',
              builder: (context, params) => const MySubscriptionPremiumWidget(),
            ),
            FFRoute(
              name: 'MySubscriptionBasic',
              path: 'mySubscriptionBasic',
              builder: (context, params) => const MySubscriptionBasicWidget(),
            ),
            FFRoute(
              name: 'report',
              path: 'report',
              builder: (context, params) => ReportWidget(
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'reportSection',
              path: 'reportSection',
              builder: (context, params) => ReportSectionWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'favV3Copy',
              path: 'favV3Copy',
              requireAuth: true,
              builder: (context, params) => const FavV3CopyWidget(),
            ),
            FFRoute(
              name: 'pantainci1',
              path: 'pantainci1',
              builder: (context, params) => const Pantainci1Widget(),
            ),
            FFRoute(
              name: 'RegisterPfofesional4',
              path: 'registerPfofesional4',
              builder: (context, params) => RegisterPfofesional4Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'cuestionario',
              path: 'cuestionario',
              builder: (context, params) => const CuestionarioWidget(),
            ),
            FFRoute(
              name: 'MapAument',
              path: 'mapAument',
              builder: (context, params) => MapAumentWidget(
                currentLatLng: params.getParam<LatLng>(
                  'currentLatLng',
                  ParamType.LatLng,
                  isList: true,
                ),
                authUser: params.getParam(
                  'authUser',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'recuperarcontrasea',
              path: 'recuperarcontrasea',
              builder: (context, params) => const RecuperarcontraseaWidget(),
            ),
            FFRoute(
              name: 'Deleteaccount',
              path: 'deleteaccount',
              builder: (context, params) => const DeleteaccountWidget(),
            ),
            FFRoute(
              name: 'cadari0',
              path: 'cadari0',
              builder: (context, params) => Cadari0Widget(
                bussinesRef: params.getParam(
                  'bussinesRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'chat_2_DetailsCopy',
              path: 'chat2DetailsCopy',
              requireAuth: true,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsCopyWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
                chatRefTotal: params.getParam(
                  'chatRefTotal',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'avatars',
              path: 'avatars',
              builder: (context, params) => const AvatarsWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
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
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
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
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/pantainci1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/logo-italente.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
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
