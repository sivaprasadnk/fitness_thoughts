// // import 'package:auto_route/auto_route.dart';
// import 'package:fitness_thoughts/router.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
// class AppRouter extends RootStackRouter {
//   @override
//   RouteType get defaultRouteType =>
//       RouteType.adaptive(); //.cupertino, .adaptive ..etc

//   @override
//   List<AutoRoute> get routes => [
//         // HomeScreen is generated as HomeRoute because
//         // of the replaceInRouteName property
//         // AutoRoute(
//         //   page: SplashRoute.page,
//         //   initial: true,
//         //   path: '/',
//         // ),
//         AutoRoute(
//           page: HomeRoute.page,
//           initial: true,
//           path: '/',
//         ),
//         AutoRoute(page: DetailsRoute.page, path: '/blog/:id')
//       ];

//   @override
//   List<AutoRouteGuard> get guards => [
//         // optionally add root guards here
//       ];
// }
