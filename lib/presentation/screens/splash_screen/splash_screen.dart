// import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/domain/use_case/get_featured_post.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:fitness_thoughts/presentation/bloc/featured_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/bloc/recent_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate(context);
    });
    super.initState();
  }

  navigate(BuildContext context) async {
    var blog = await locator<GetFeaturedPost>().call();
    var blogs = await locator<GetRecentPosts>().call();
    if (context.mounted) {
      context.read<FeaturedBlogCubit>().update(blog);
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
