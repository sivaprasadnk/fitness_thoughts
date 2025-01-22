// import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:fitness_thoughts/presentation/bloc/featured_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/bloc/recent_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String version = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate(context);
    });
    super.initState();
  }

  navigate(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version = 'v${packageInfo.version}+${packageInfo.buildNumber}';
    setState(() {});
    var blogs = await locator<GetPosts>().call();
    var featured = blogs.first;
    var featuredList = blogs.where((blog) => blog.isFeatured == "Y").toList();
    if (featuredList.isNotEmpty) {
      featured = featuredList.first;
    }
    if (context.mounted) {
      context.read<FeaturedBlogCubit>().update(featured);
      context.read<RecentBlogCubit>().update(blogs);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // AutoRouter.of(context).popForced();
      // AutoRouter.of(context).push(HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              child: Image.asset(
                kPlayStoreIconAssetPath,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              version,
              style: TextStyle(
                color: kCustomBlueColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        // child: Text(
        //   kAppName,
        //   style: TextStyle(
        //     fontSize: 32,
        //   ),
        // ),
      ),
    );
  }
}
