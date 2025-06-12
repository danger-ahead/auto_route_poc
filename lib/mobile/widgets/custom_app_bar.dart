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
    // Get the actual active route name from the router
    final routeName = _getActiveRouteName(context);

    // Get route-specific actions
    final routeActions = _getRouteActions(context, routeName);

    // Debug: Print route information
    print('🔍 Current route name: $routeName');
    print('🔍 Route actions count: ${routeActions.length}');

    return ValueListenableBuilder<bool>(
      valueListenable: RouteHistoryManager().canGoBack,
      builder: (context, canGoBack, child) {
        return AppBar(
          title: Text(title),
          leading: _buildLeading(context, canGoBack),
          automaticallyImplyLeading: false,
          actions: _buildActions(context, routeActions),
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

  List<Widget> _getRouteActions(BuildContext context, String routeName) {
    switch (routeName) {
      case 'BookListRoute':
        return [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search books',
            onPressed: () => _showSearchDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter books',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filter books')),
              );
            },
          ),
        ];

      case 'ProfileRoute':
        return [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Profile settings',
            onPressed: () => context.navigateToPath('/settings/profile'),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit profile',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profile')),
              );
            },
          ),
        ];

      case 'BookDetailsRoute':
        return [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Add to favorites',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to favorites')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share book',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share book')),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More options',
            onSelected: (value) {
              switch (value) {
                case 'download':
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Downloading book...')),
                  );
                  break;
                case 'report':
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report book')),
                  );
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'download',
                child: Row(
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text('Download'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.report),
                    SizedBox(width: 8),
                    Text('Report'),
                  ],
                ),
              ),
            ],
          ),
        ];

      case 'MyBooksRoute':
        return [
          IconButton(
            icon: const Icon(Icons.sort),
            tooltip: 'Sort books',
            onPressed: () => _showSortDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: 'Change view',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Toggle view mode')),
              );
            },
          ),
        ];

      case 'SettingsTab':
        return [
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: 'Help',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help & Support')),
              );
            },
          ),
        ];

      default:
        return [];
    }
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Books'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter book title or author...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Searching books...')),
              );
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort Books'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sort_by_alpha),
              title: const Text('By Title'),
              onTap: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sorted by title')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('By Author'),
              onTap: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sorted by author')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('By Date Added'),
              onTap: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sorted by date')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getActiveRouteName(BuildContext context) {
    // Get the top route from context - this should be the actual page route
    final topRoute = context.topRoute;
    final routeName = topRoute.name;

    print('🔍 Top route: $routeName');
    print('🔍 Current route: ${context.routeData.name}');
    print('🔍 Route breadcrumbs: ${context.router.routeData.breadcrumbs.map((r) => r.name).toList()}');

    return routeName;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
