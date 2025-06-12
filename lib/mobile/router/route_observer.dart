import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Global state manager for route history and current route tracking
class RouteHistoryManager {
  static final RouteHistoryManager _instance = RouteHistoryManager._internal();
  factory RouteHistoryManager() => _instance;
  RouteHistoryManager._internal();

  final List<String> _navigationStack = [];
  final ValueNotifier<bool> canGoBack = ValueNotifier<bool>(false);
  final ValueNotifier<String?> currentRoute = ValueNotifier<String?>(null);
  final ValueNotifier<Map<String, dynamic>> currentRouteData = ValueNotifier<Map<String, dynamic>>({});

  void pushRoute(String routeName, {Map<String, dynamic>? routeData}) {
    // Update current route information
    currentRoute.value = routeName;
    currentRouteData.value = routeData ?? {};

    if (_isMeaningfulRoute(routeName)) {
      _navigationStack.add(routeName);
      _scheduleUpdate();
    }
  }

  void popRoute() {
    if (_navigationStack.isNotEmpty) {
      _navigationStack.removeLast();
      _scheduleUpdate();
    }

    // Update current route to the previous one if available
    if (_navigationStack.isNotEmpty) {
      currentRoute.value = _navigationStack.last;
    }
  }

  bool _isMeaningfulRoute(String routeName) {
    // Skip basic tab routes and home route - only track actual page navigation
    final skipRoutes = {
      'HomeRoute',
      'BooksTab',
      'ProfileTab',
      'SettingsTab',
    };

    return !skipRoutes.contains(routeName);
  }

  void _scheduleUpdate() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _updateCanGoBack();
    });
  }

  void _updateCanGoBack() {
    // Show back button only if we have 2 or more routes in our navigation stack
    // (meaning there's actually a previous screen to go back to)
    final newValue = _navigationStack.length >= 2;

    if (canGoBack.value != newValue) {
      canGoBack.value = newValue;
    }
  }

  bool get hasBackRoute => canGoBack.value;

  void clearHistory() {
    _navigationStack.clear();
    currentRoute.value = null;
    currentRouteData.value = {};
    _scheduleUpdate();
  }

  List<String> get navigationStack => List.unmodifiable(_navigationStack);
}

class CustomRouteObserver extends AutoRouteObserver {
  final RouteHistoryManager _historyManager = RouteHistoryManager();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      final routeData = _extractRouteData(route);
      _historyManager.pushRoute(route.settings.name!, routeData: routeData);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null) {
      _historyManager.popRoute();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // For replace, we don't change the stack size, just update the top route
    if (newRoute?.settings.name != null) {
      _historyManager.popRoute(); // Remove old
      final routeData = _extractRouteData(newRoute!);
      _historyManager.pushRoute(newRoute.settings.name!, routeData: routeData); // Add new
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route.settings.name != null) {
      _historyManager.popRoute();
    }
  }

  Map<String, dynamic> _extractRouteData(Route<dynamic> route) {
    final routeData = <String, dynamic>{};

    // Extract route arguments if available
    if (route.settings.arguments != null) {
      routeData['arguments'] = route.settings.arguments;
    }

    // Extract path parameters if it's an AutoRoute
    final settings = route.settings;
    routeData['name'] = settings.name;

    return routeData;
  }

  ValueNotifier<bool> get canGoBack => _historyManager.canGoBack;
  ValueNotifier<String?> get currentRoute => _historyManager.currentRoute;
  ValueNotifier<Map<String, dynamic>> get currentRouteData => _historyManager.currentRouteData;
  bool get hasBackRoute => _historyManager.hasBackRoute;
  List<String> get navigationStack => _historyManager.navigationStack;
}
