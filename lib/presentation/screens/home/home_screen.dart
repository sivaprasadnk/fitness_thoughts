import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/screens/about/about_screen.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/cover_image.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/featured_post_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/footer_widget.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/menu_icon.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/quote_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_posts_section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.screenWidth;
    double horizontalPadding = context.horizontalPadding;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          kAppName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: (width > mobileBreakPoint)
            ? [
                GestureDetector(
                  onTap: () {},
                  child: Text('Home'),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  child: Text('About'),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {},
                  child: Text('Contact'),
                ),
                SizedBox(width: 50),
              ]
            : [
                MenuIcon(),
                SizedBox(width: 16),
              ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              CoverImage(),
              SizedBox(height: 50),
              FeaturedPostSection(),
              SizedBox(height: width > 945 ? 75 : 16),
              RecentPostsSection(),
              SizedBox(height: width > 945 ? 75 : 0),
              QuoteSection(),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
