import 'package:flutter/material.dart';

/// A utility class to manage route-specific app bar configurations
/// This makes it easy to add new routes and their corresponding app bar actions
class RouteAppBarManager {
  static RouteAppBarManager? _instance;
  static RouteAppBarManager get instance => _instance ??= RouteAppBarManager._();
  RouteAppBarManager._();

  final Map<String, RouteAppBarConfig> _routeConfigs = {};

  /// Register a route with its app bar configuration
  void registerRoute(String routeName, RouteAppBarConfig config) {
    _routeConfigs[routeName] = config;
  }

  /// Get the app bar configuration for a specific route
  RouteAppBarConfig getConfigForRoute(String routeName) {
    return _routeConfigs[routeName] ?? const RouteAppBarConfig();
  }

  /// Check if a route has custom app bar configuration
  bool hasConfigForRoute(String routeName) {
    return _routeConfigs.containsKey(routeName);
  }

  /// Get all registered route names
  List<String> get registeredRoutes => _routeConfigs.keys.toList();

  /// Clear all registered routes (useful for testing)
  void clearAll() {
    _routeConfigs.clear();
  }
}

/// Configuration class for route-specific app bar settings
class RouteAppBarConfig {
  final List<Widget> actions;
  final String? customTitle;
  final bool showBackButton;
  final Widget? customLeading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const RouteAppBarConfig({
    this.actions = const [],
    this.customTitle,
    this.showBackButton = true,
    this.customLeading,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// Create a copy of this config with some properties overridden
  RouteAppBarConfig copyWith({
    List<Widget>? actions,
    String? customTitle,
    bool? showBackButton,
    Widget? customLeading,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return RouteAppBarConfig(
      actions: actions ?? this.actions,
      customTitle: customTitle ?? this.customTitle,
      showBackButton: showBackButton ?? this.showBackButton,
      customLeading: customLeading ?? this.customLeading,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }
}

/// Extension to make it easier to create common app bar actions
extension AppBarActionExtensions on RouteAppBarConfig {
  /// Create a search action button
  static Widget searchAction({
    required VoidCallback onPressed,
    String tooltip = 'Search',
  }) {
    return IconButton(
      icon: const Icon(Icons.search),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a settings action button
  static Widget settingsAction({
    required VoidCallback onPressed,
    String tooltip = 'Settings',
  }) {
    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a share action button
  static Widget shareAction({
    required VoidCallback onPressed,
    String tooltip = 'Share',
  }) {
    return IconButton(
      icon: const Icon(Icons.share),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a favorite action button
  static Widget favoriteAction({
    required VoidCallback onPressed,
    bool isFavorite = false,
    String tooltip = 'Add to favorites',
  }) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a filter action button
  static Widget filterAction({
    required VoidCallback onPressed,
    String tooltip = 'Filter',
  }) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a sort action button
  static Widget sortAction({
    required VoidCallback onPressed,
    String tooltip = 'Sort',
  }) {
    return IconButton(
      icon: const Icon(Icons.sort),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  /// Create a more options menu button
  static Widget moreOptionsAction({
    required List<PopupMenuEntry<String>> menuItems,
    required void Function(String) onSelected,
    String tooltip = 'More options',
  }) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      tooltip: tooltip,
      onSelected: onSelected,
      itemBuilder: (context) => menuItems,
    );
  }
}
