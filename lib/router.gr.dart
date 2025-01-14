// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:fitness_thoughts/data/models/blog_model.dart' as _i6;
import 'package:fitness_thoughts/presentation/screens/details/details_screen.dart'
    as _i1;
import 'package:fitness_thoughts/presentation/screens/home/home_screen.dart'
    as _i2;
import 'package:fitness_thoughts/presentation/screens/splash_screen/splash_screen.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i4.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i5.Key? key,
    required _i6.BlogModel blog,
    required int id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            blog: blog,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsScreen(
        key: args.key,
        blog: args.blog,
        id: args.id,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.blog,
    required this.id,
  });

  final _i5.Key? key;

  final _i6.BlogModel blog;

  final int id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, blog: $blog, id: $id}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
