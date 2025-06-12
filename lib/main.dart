import 'package:example/data/db.dart';
import 'package:example/mobile/router/auth_guard.dart';
import 'package:example/mobile/router/router.dart';
import 'package:example/mobile/router/route_observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//ignore_for_file: public_member_api_docs

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authService = AuthService();

  late final _rootRouter = AppRouter(authService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _rootRouter.config(
        reevaluateListenable: authService,
        navigatorObservers: () => [
          CustomRouteObserver(),
        ],
        placeholder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      theme: ThemeData.light(),
      builder: (_, router) {
        return ChangeNotifierProvider<AuthService>(
          create: (_) => authService,
          child: BooksDBProvider(
            child: router!,
          ),
        );
      },
    );
  }
}
