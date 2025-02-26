import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  // @override
  // RouterConfig<UrlState> config({
  //   DeepLinkTransformer? deepLinkTransformer,
  //   DeepLinkBuilder? deepLinkBuilder,
  //   String? navRestorationScopeId,
  //   WidgetBuilder? placeholder,
  //   NavigatorObserversBuilder navigatorObservers =
  //       AutoRouterDelegate.defaultNavigatorObserversBuilder,
  //   bool includePrefixMatches = !kIsWeb,
  //   bool Function(String? location)? neglectWhen,
  //   bool rebuildStackOnDeepLink = false,
  //   Listenable? reevaluateListenable,
  // }) {
  //   // TODO: implement config
  //   return super.config(
  //       deepLinkTransformer: deepLinkTransformer,
  //       deepLinkBuilder: deepLinkBuilder,
  //       navRestorationScopeId: navRestorationScopeId,
  //       placeholder: placeholder,
  //       navigatorObservers: navigatorObservers,
  //       includePrefixMatches: includePrefixMatches,
  //       neglectWhen: neglectWhen,
  //       rebuildStackOnDeepLink: rebuildStackOnDeepLink,
  //       reevaluateListenable: reevaluateListenable);
  // }

  @override
  RouteType get defaultRouteType =>
      RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: false,
          path: '/home',
        ),
        AutoRoute(page: DetailsRoute.page, path: '/home/blogs/:id'),
        AutoRoute(page: AllPostsRoute.page, path: '/home/blogs/'),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];

      

  // @override
  // RouteType get defaultRouteType => const RouteType.material();

  // @override
  // Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  //   // Redirect to home if the path is unknown (e.g., after refresh)
  //   if (settings.name == null || settings.name!.isEmpty) {
  //     return MaterialPageRoute(builder: (_) => const HomeScreen());
  //   }
  //   return null;
  // }    
}
