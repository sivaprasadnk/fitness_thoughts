import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/connectivity_service.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/core/utils/extensions/string_extensions.dart';
import 'package:fitness_thoughts/domain/use_case/get_system_config.dart';
import 'package:fitness_thoughts/presentation/providers/home_screen_provider.dart';
import 'package:fitness_thoughts/presentation/providers/system_config_provider.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
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

  navigate(BuildContext context) async {
    if (kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Text(
                  'Download the app from PlayStore for the best experience !'),
              actions: [
                TextButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse(playStoreUrl));
                  },
                  child: Text('Download now!'),
                )
              ],
            );
          });
    } else {
      // mainLogic({}, context);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      version = 'v${packageInfo.version}+${packageInfo.buildNumber}';
      setState(() {});
      var latest = await locator<GetSystemConfig>().call();
      ref.read(systemConfigProvider.notifier).loadSystemConfig(latest);

      debugPrint("## latest ${latest.buildNumber}");
      debugPrint("## showBiometrics ${latest.showBiometrics}");

      if (latest.buildNumber! > packageInfo.buildNumber.toInt()) {
        debugPrint("## newVersionAvailable!!");
        showUpdateText = true;
        setState(() {});
      } else {
        setState(() {});
        await ref.read(homeScreenProvider.notifier).loadBlogs();
        showUpdateText = false;
        if (context.mounted) {
          Navigator.pop(context);
          AutoRouter.of(context).replace(HomeRoute());

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
          Center(
            child: Visibility(
              visible: showUpdateText != null && showUpdateText!,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(playStoreUrl));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Update available. Click to update',
                      style: TextStyle(
                        color: kCustomBlueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.cloud_download,
                      color: kCustomBlueColor,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
