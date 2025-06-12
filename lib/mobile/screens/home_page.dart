import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.dart';
import 'package:example/mobile/router/router.gr.dart';
import 'package:example/mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

//ignore_for_file: public_member_api_docs

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class RouteDestination {
  final PageRouteInfo route;
  final IconData icon;
  final String label;

  const RouteDestination({
    required this.route,
    required this.icon,
    required this.label,
  });
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final destinations = [
    RouteDestination(
      route: BooksTab(),
      icon: Icons.source,
      label: 'Books',
    ),
    RouteDestination(
      route: ProfileTab(),
      icon: Icons.person,
      label: 'Profile',
    ),
    RouteDestination(
      route: SettingsTab(tab: 'tab'),
      icon: Icons.settings,
      label: 'Settings',
    ),
  ];

  void toggleSettingsTap() => setState(() {
        _showSettingsTap = !_showSettingsTap;
      });

  bool _showSettingsTap = true;

  @override
  Widget build(context) {
    // builder will rebuild everytime this router's stack
    // updates
    // we need it to indicate which NavigationRailDestination is active
    return AutoTabsRouter(
      builder: (context, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: context.topRoute.title(context),
          ),
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav
        ? SizedBox.shrink()
        : BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.source),
                label: 'Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              if (_showSettingsTap)
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
            ],
          );
  }
}
