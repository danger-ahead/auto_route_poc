import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.gr.dart';
import 'package:example/mobile/widgets/route_app_bar_manager.dart';
import 'package:flutter/material.dart';

void initializeRouteAppBarConfigs() {
  final manager = RouteAppBarManager.instance;

  manager.registerRoute(
    '/profile',
    RouteAppBarConfig(
      actions: [
        AppBarActionExtensions.searchAction(
          onPressed: () {
            // TODO: Implement search
          },
        ),
      ],
    ),
  );

  // Book List Route
  manager.registerRoute(
    '/books',
    RouteAppBarConfig(
      actions: [
        AppBarActionExtensions.searchAction(
          onPressed: () {
            // TODO: Implement search
          },
        ),
        AppBarActionExtensions.filterAction(
          onPressed: () {
            // TODO: Implement filter
          },
        ),
      ],
    ),
  );

  // Book Details Route
  manager.registerRoute(
    '/books/',
    RouteAppBarConfig(
      actions: [
        AppBarActionExtensions.favoriteAction(
          onPressed: () {
            // TODO: Implement favorite
          },
        ),
        AppBarActionExtensions.shareAction(
          onPressed: () {
            // TODO: Implement share
          },
        ),
        AppBarActionExtensions.moreOptionsAction(
          menuItems: [
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
          onSelected: (value) {
            // TODO: Handle menu selection
          },
        ),
      ],
    ),
  );

  // My Books Route
  manager.registerRoute(
    '/my-books',
    RouteAppBarConfig(
      actions: [
        AppBarActionExtensions.sortAction(
          onPressed: () {
            // TODO: Implement sort
          },
        ),
        IconButton(
          icon: const Icon(Icons.view_list),
          tooltip: 'Change view',
          onPressed: () {
            // TODO: Implement view change
          },
        ),
      ],
    ),
  );

  // Settings Tab
  manager.registerRoute(
    '/settings',
    RouteAppBarConfig(
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline),
          tooltip: 'Help',
          onPressed: () {
            // TODO: Implement help
          },
        ),
      ],
    ),
  );
}
