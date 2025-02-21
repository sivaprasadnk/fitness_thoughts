import 'package:auto_route/auto_route.dart' show AutoRouter;
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_functions.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:fitness_thoughts/presentation/providers/home_screen_provider.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_post_item.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class RecentPostsSection extends StatelessWidget {
  const RecentPostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(recentBlogProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;

        double horizontalPadding = width > 1325
            ? 150
            : width > 950
                ? 80
                : 24;
        var crossAxisCount = 1;
        var postWidth = double.infinity;
        if (context.isLargeDevice) {
          crossAxisCount = width > 1150 ? 3 : 2;

          postWidth = crossAxisCount == 3
              ? horizontalPadding == 150
                  ? (width - (horizontalPadding * 2)) / 3 - 30
                  : (width - (horizontalPadding * 2)) / 3 - 50
              : crossAxisCount == 2
                  ? (width - horizontalPadding * 2) / 2 - 50
                  : double.infinity;
        }
        return Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
          padding: EdgeInsets.all(12),
          child: Consumer(builder: (context, ref, _) {
            var blogs = ref.watch(homeScreenProvider).value;
            if (blogs == null) {
              return SizedBox.shrink();
            }   
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SectionTitle(title: 'R E C E N T\nP O S T S'),
                SizedBox(height: 50),
                if (crossAxisCount == 1)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      var blog = blogs[index];
                      return RecentPostItem(
                        blog: blog,
                        maxLines: 7,
                        height: 670,
                        width: postWidth,
                      );
                    },
                  )
                else
                  Row(
                    children: blogs.take(crossAxisCount).map((blog) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RecentPostItem(
                            blog: blog,
                            width: postWidth,
                            maxLines: 5,
                            height: 650,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    viewAllBlogs(context);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Show all',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                              ),
                            ],
                          ).showCursorOnHover,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        );
      },
    );
  }

  Future<void> viewAllBlogs(BuildContext context) async {
    try {
      // Show the loader dialog
      CommonFunctions.showLoader(context);

      // var blogs = await locator<GetPosts>().call();
      // Close the loader dialog
      if (context.mounted) {
        Navigator.pop(context); // Dismiss loader
        // context.read<AllBlogCubit>().update(blogs);
      }

      // Navigate to the DetailsScreen
      if (context.mounted) {
        AutoRouter.of(context).navigate(AllPostsRoute());

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => AllPostsScreen(),
        //   ),
        // );
      }
    } catch (err) {
      debugPrint("## error :$err");
      // Ensure the loader is dismissed even in case of error
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}
