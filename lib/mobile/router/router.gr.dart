// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:example/mobile/screens/books/book_details_page.dart' as _i1;
import 'package:example/mobile/screens/books/book_list_page.dart' as _i2;
import 'package:example/mobile/screens/home_page.dart' as _i4;
import 'package:example/mobile/screens/login_page.dart' as _i5;
import 'package:example/mobile/screens/profile/dummy_page.dart' as _i3;
import 'package:example/mobile/screens/profile/my_books_page.dart' as _i6;
import 'package:example/mobile/screens/profile/profile_page.dart' as _i7;
import 'package:example/mobile/screens/settings_page.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.BookDetailsPage]
class BookDetailsRoute extends _i9.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i10.Key? key,
    int id = -1,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(key: key, id: id),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BookDetailsRouteArgs>(
        orElse: () => BookDetailsRouteArgs(id: pathParams.getInt('id', -1)),
      );
      return _i1.BookDetailsPage(key: args.key, id: args.id);
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({this.key, this.id = -1});

  final _i10.Key? key;

  final int id;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.BookListScreen]
class BookListRoute extends _i9.PageRouteInfo<void> {
  const BookListRoute({List<_i9.PageRouteInfo>? children})
      : super(BookListRoute.name, initialChildren: children);

  static const String name = 'BookListRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookListScreen();
    },
  );
}

/// generated route for
/// [_i3.DummyPage]
class DummyRoute extends _i9.PageRouteInfo<void> {
  const DummyRoute({List<_i9.PageRouteInfo>? children})
      : super(DummyRoute.name, initialChildren: children);

  static const String name = 'DummyRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.DummyPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    bool showBackButton = true,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key, showBackButton: showBackButton),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i5.LoginPage(key: args.key, showBackButton: args.showBackButton);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.showBackButton = true});

  final _i10.Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [_i6.MyBooksPage]
class MyBooksRoute extends _i9.PageRouteInfo<MyBooksRouteArgs> {
  MyBooksRoute({
    _i10.Key? key,
    String? filter = 'none2',
    List<_i9.PageRouteInfo>? children,
  }) : super(
          MyBooksRoute.name,
          args: MyBooksRouteArgs(key: key, filter: filter),
          rawQueryParams: {'filter': filter},
          initialChildren: children,
        );

  static const String name = 'MyBooksRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<MyBooksRouteArgs>(
        orElse: () =>
            MyBooksRouteArgs(filter: queryParams.optString('filter', 'none2')),
      );
      return _i6.MyBooksPage(key: args.key, filter: args.filter);
    },
  );
}

class MyBooksRouteArgs {
  const MyBooksRouteArgs({this.key, this.filter = 'none2'});

  final _i10.Key? key;

  final String? filter;

  @override
  String toString() {
    return 'MyBooksRouteArgs{key: $key, filter: $filter}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyBooksRouteArgs) return false;
    return key == other.key && filter == other.filter;
  }

  @override
  int get hashCode => key.hashCode ^ filter.hashCode;
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsTab extends _i9.PageRouteInfo<SettingsTabArgs> {
  SettingsTab({
    _i10.Key? key,
    String tab = 'none',
    String query = 'none',
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SettingsTab.name,
          args: SettingsTabArgs(key: key, tab: tab, query: query),
          rawPathParams: {'tab': tab},
          rawQueryParams: {'query': query},
          initialChildren: children,
        );

  static const String name = 'SettingsTab';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<SettingsTabArgs>(
        orElse: () => SettingsTabArgs(
          tab: pathParams.getString('tab', 'none'),
          query: queryParams.getString('query', 'none'),
        ),
      );
      return _i8.SettingsPage(key: args.key, tab: args.tab, query: args.query);
    },
  );
}

class SettingsTabArgs {
  const SettingsTabArgs({this.key, this.tab = 'none', this.query = 'none'});

  final _i10.Key? key;

  final String tab;

  final String query;

  @override
  String toString() {
    return 'SettingsTabArgs{key: $key, tab: $tab, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsTabArgs) return false;
    return key == other.key && tab == other.tab && query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ tab.hashCode ^ query.hashCode;
}
