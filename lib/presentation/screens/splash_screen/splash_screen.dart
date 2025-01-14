import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate(context);
    });
    super.initState();
  }

  navigate(BuildContext context) async {
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (context.mounted) {
        AutoRouter.of(context).popForced();
        AutoRouter.of(context).push(HomeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          kAppName,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
