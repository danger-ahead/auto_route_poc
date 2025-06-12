import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/route_observer.dart';
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
    return ValueListenableBuilder<bool>(
      valueListenable: RouteHistoryManager().canGoBack,
      builder: (context, canGoBack, child) {
        return AppBar(
          title: Text(title),
          leading: _buildLeading(context, canGoBack),
          automaticallyImplyLeading: false,
          actions: _buildActions(context),
        );
      },
    );
  }

  Widget? _buildLeading(BuildContext context, bool canGoBack) {
    if (leading != null) {
      return leading;
    }

    if (canGoBack && automaticallyImplyLeading) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _handleBackNavigation(context);
        },
      );
    }

    return null;
  }

  void _handleBackNavigation(BuildContext context) {
    // Use auto_route's built-in back navigation
    // This will automatically handle cross-tab navigation
    context.router.back();
  }

  List<Widget> _buildActions(BuildContext context) {
    final routeName = context.routeData.name;
    final dynamicActions = _getDynamicActions(context, routeName);

    final allActions = <Widget>[];
    allActions.addAll(dynamicActions);

    if (actions != null) {
      allActions.addAll(actions!);
    }

    return allActions;
  }

  List<Widget> _getDynamicActions(BuildContext context, String routeName) {
    switch (routeName) {
      case 'BookListRoute':
        return [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search books')),
              );
            },
          ),
        ];
      case 'ProfileRoute':
        return [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
              context.navigateToPath('/settings/profile');
            },
          ),
        ];
      case 'BookDetailsRoute':
        return [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to favorites')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share book')),
              );
            },
          ),
        ];
      case 'MyBooksRoute':
        return [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sort books')),
              );
            },
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
