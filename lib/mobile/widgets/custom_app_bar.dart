import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/widgets/route_app_bar_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    // Get the actual active route name from the router
    final path = _getActiveRoutePath(context);

    // Get route-specific actions
    final routeActions = _getRouteActions(context, path);

    return AppBar(
      title: Text(title),
      leading: _buildLeading(context),
      automaticallyImplyLeading: false,
      actions: _buildActions(context, routeActions),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) {
      return leading;
    }

    if (context.router.canNavigateBack && automaticallyImplyLeading) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.router.back();
        },
      );
    }

    return null;
  }

  List<Widget> _buildActions(BuildContext context, List<Widget> routeActions) {
    final allActions = <Widget>[];

    // Add route-specific actions
    allActions.addAll(routeActions);

    // Add any additional actions passed to the widget
    if (actions != null) {
      allActions.addAll(actions!);
    }

    return allActions;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getActiveRoutePath(BuildContext context) {
    return context.router.currentPath;
  }

  List<Widget> _getRouteActions(BuildContext context, String path) {
    // Get route-specific actions from RouteAppBarManager
    final config = RouteAppBarManager.instance.getConfigForRoute(path);
    return config.actions;
  }
}
