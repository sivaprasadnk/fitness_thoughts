// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/notification_service.dart';
import 'package:fitness_thoughts/router.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // providers: [
      //   BlocProvider(create: (_) => FeaturedBlogCubit()),
      //   BlocProvider(create: (_) => RecentBlogCubit()),
      //   BlocProvider(create: (_) => AllBlogCubit()),
      // ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        // routerDelegate: _appRouter.delegate(),
        // routeInformationParser: _appRouter.defaultRouteParser(),
        title: kAppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBgColor,
          fontFamily: kLoraFont,
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: kWhiteColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SplashScreen(),
      ),
    );
  }
}
