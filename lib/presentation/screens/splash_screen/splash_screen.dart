import 'package:app_version_details/app_version_details.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_functions.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/connectivity_service.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/core/utils/extensions/string_extensions.dart';
import 'package:fitness_thoughts/domain/use_case/get_system_config.dart';
import 'package:fitness_thoughts/presentation/providers/home_screen_provider.dart';
import 'package:fitness_thoughts/presentation/providers/system_config_provider.dart';
import 'package:fitness_thoughts/presentation/screens/splash_screen/update_available_text.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();  
  late ConnectivityService _connectivityService;
  String version = "";
  bool? showUpdateText;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectivityService = ConnectivityService(_scaffoldMessengerKey);
      _connectivityService.startListening();
      navigate(context);
    });
    super.initState();
  }

  void updateShowUpdateText({required bool value}) {
    setState(() {
      showUpdateText = value;
    });
  }

  navigate(BuildContext context) async {
    if (kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      CommonFunctions.showPlaystoreDownloadDialog(context: context);
    } else {
      version = (await AppVersionDetails().getAppVersion()) ?? "v1.0.0+1";
      String buildNumber = version.split("+").last;
      setState(() {});
      var token = await FirebaseMessaging.instance.getToken() ?? "";
      debugPrint("token ::$token");
      var latest = await locator<GetSystemConfig>().call(token);
      ref.read(systemConfigProvider.notifier).loadSystemConfig(latest);


      if (latest.buildNumber! > buildNumber.toInt()) {
        debugPrint("## newVersionAvailable!!");
        updateShowUpdateText(value: true);
        setState(() {});
      } else {
        setState(() {});
        await ref.read(homeScreenProvider.notifier).loadBlogs();
        updateShowUpdateText(value: false);

        if (context.mounted) {
          Navigator.pop(context);
          AutoRouter.of(context).replace(HomeRoute());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: context.screenHeight * .33),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              child: Image.asset(
                kPlayStoreIconAssetPath,
                height: 200,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                version,
                style: TextStyle(
                  color: kCustomBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          UpdateAvailableText(showUpdateText: showUpdateText),
        ],
      ),
    );
  }
}
