import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.dart';
import 'package:example/mobile/router/router.gr.dart';
import 'package:flutter/material.dart';

//ignore_for_file: public_member_api_docs
final profileRoute = AutoRoute(
  path: 'profile',
  page: ProfileTab.page,
  children: [
    AutoRoute(path: '', page: ProfileRoute.page),
    AutoRoute(path: 'my-books', page: MyBooksRoute.page),
    CustomRoute(
      path: 'bottom-sheet',
      page: DummyRoute.page,
      title: (context, data) => 'Modal Bottom Sheet',
      customRouteBuilder: <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return ModalBottomSheetRoute(
          settings: page,
          builder: (context) => Container(
            height: 100,
            color: Colors.red,
          ),
          isScrollControlled: true,
        );
      },
    ),
  ],
);
