// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:fitness_thoughts/presentation/screens/all_posts/all_posts_screen.dart'
    as _i1;
import 'package:fitness_thoughts/presentation/screens/details/details_screen.dart'
    as _i2;
import 'package:fitness_thoughts/presentation/screens/home/home_screen.dart'
    as _i3;
import 'package:fitness_thoughts/presentation/screens/splash_screen/splash_screen.dart'
    as _i4;
import 'package:flutter/foundation.dart' as _i6;

/// generated route for
/// [_i1.AllPostsScreen]
class AllPostsRoute extends _i5.PageRouteInfo<void> {
  const AllPostsRoute({List<_i5.PageRouteInfo>? children})
    : super(AllPostsRoute.name, initialChildren: children);

  static const String name = 'AllPostsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AllPostsScreen();
    },
  );
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i6.Key? key,
    required int id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DetailsRouteArgs>(
        orElse: () => DetailsRouteArgs(id: pathParams.getInt('id')),
      );
      return _i2.DetailsScreen(key: args.key, id: args.id);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.id});

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
