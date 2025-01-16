import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/providers/recent_blog_provider.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_post_item.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentPostsSection extends StatelessWidget {
  const RecentPostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;

      double horizontalPadding = width > 1325
          ? 150
          : width > 950
              ? 80
              : 24;
      var postCount = 1;
      var postWidth = double.infinity;
      if (context.isLargeDevice) {
        postCount = width > 1150 ? 3 : 2;

        postWidth = postCount == 3
            ? horizontalPadding == 150
                ? (width - (horizontalPadding * 2)) / 3 - 30
                : (width - (horizontalPadding * 2)) / 3 - 50
            : postCount == 2
                ? (width - horizontalPadding * 2) / 2 - 50
                : double.infinity;
      }

      return Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionTitle(title: 'R E C E N T\nP O S T S'),
            SizedBox(height: 50),
            Consumer(builder: (context, ref, _) {
              var provider = ref.watch(recentBlogProvider);
              return provider.when(
                data: (blogs) {
                  return postCount > 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: blogs.take(postCount).map((blog) {
                            return RecentPostItem(
                              blog: blog,
                              maxLines: 7,
                              height: 630,
                              showBorder: false,
                              width: postWidth,
                            );
                          }).toList(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: blogs.length,
                          itemBuilder: (context, index) {
                            var blog = blogs[index];
                          return RecentPostItem(
                            blog: blog,
                            maxLines: 7,
                            height: 650,
                              width: postWidth,
                            );
                          },
                        );
                  // : Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: blogs.map((blog) {
                  //       return RecentPostItem(
                  //         blog: blog,
                  //         maxLines: 7,
                  //         height: 650,
                  //         showBorder: false,
                  //         width: postWidth,
                  //       );
                  //     }).toList(),
                  //   );
                },
                error: (err, _) {
                  return Center(
                    child: Text(err.toString()),
                  );
                },
                loading: () {
                  return postCount > 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [1, 1, 1, 1].take(postCount).map((blog) {
                            return SizedBox(
                              height: 630,
                              width: postWidth,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }).toList(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [1, 1, 1, 1].map((blog) {
                            return SizedBox(
                              height: 650,
                              width: postWidth,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }).toList(),
                        );
                },
              );

              // : RecentPostItem(
              //     blog: blogs.first,
              //     maxLines: 7,
              //     height: 680,
              //     showBorder: false,
              //     width: postwidth,
              //   );
            }),
          ],
        ),
      );
    });
  }
}
