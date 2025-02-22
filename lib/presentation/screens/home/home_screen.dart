import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/cover_image.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/featured_post_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/footer_widget.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/quote_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_posts_section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        double horizontalPadding = width > 1325
            ? 150
            : width > 950
                ? 80
                : 16;
        return Scaffold(
          extendBodyBehindAppBar: false,
          appBar: CommonAppBar(automaticallyImplyLeading: false),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  CoverImage(),
                  SizedBox(height: 20),
                  FeaturedPostSection(),
                  SizedBox(height: width > 945 ? 75 : 16),
                  RecentPostsSection(),
                  QuoteSection(),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
