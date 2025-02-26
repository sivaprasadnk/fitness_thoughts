import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/presentation/providers/home_screen_provider.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/cover_image.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/featured_post_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/footer_widget.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/loading_featured_post.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/quote_section.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_posts_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint("## executing initstate");
      await ref.read(homeScreenProvider.notifier).loadBlogs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = ref.watch(homeScreenProvider).value;
    var listIsEmpty = list == null || list.isEmpty;
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
                  listIsEmpty ? LoadingFeaturedPost() : FeaturedPostSection(),
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
