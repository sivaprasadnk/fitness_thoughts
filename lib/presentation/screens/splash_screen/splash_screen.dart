// import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/core/utils/extensions/string_extensions.dart';
import 'package:fitness_thoughts/domain/use_case/get_latest_version_from_db.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:fitness_thoughts/presentation/bloc/featured_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/bloc/recent_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String version = "";
  bool? showUpdateText;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
              content: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius)),
                child: Text(
                    'Download the app from PlayStore for the best experience !'),
              ),
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
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      version = 'v${packageInfo.version}+${packageInfo.buildNumber}';
      setState(() {});
      var latest = await locator<GetLatestVersionFromDb>().call();
      if (latest.buildNumber! > packageInfo.buildNumber.toInt()) {
        debugPrint("## newVersionAvailable!!");
        showUpdateText = true;
        setState(() {});
      } else {
        setState(() {});
        var blogs = await locator<GetPosts>().call();
        if (blogs.isNotEmpty) {
          var featured = blogs.first;
          var featuredList = blogs.where((blog) => blog.isFeatured!).toList();
          if (featuredList.isNotEmpty) {
            featured = featuredList.first;
            blogs = blogs.where((blog) => blog.isFeatured! != true).toList();
          }
          if (context.mounted) {
            showUpdateText = false;

            context.read<FeaturedBlogCubit>().update(featured);
            context.read<RecentBlogCubit>().update(blogs);
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            // AutoRouter.of(context).popForced();
            // AutoRouter.of(context).push(HomeRoute());
          }
        } else {
          const snackBar = SnackBar(
            content: Text('No internet connection. Please try again !'),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
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
