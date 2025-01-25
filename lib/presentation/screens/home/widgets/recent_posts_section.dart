import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/bloc/recent_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/recent_post_item.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<RecentBlogCubit, List<BlogModel>>(
              builder: (context, blogs) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SectionTitle(title: 'R E C E N T\nP O S T S'),
                SizedBox(height: 50),
                if (postCount == 1)
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
                            height: 650,
                      width: postWidth,
                    );
                  },
                  )
                else
                  Row(
                    children: blogs.take(postCount).map((blog) {
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
              ],
            );
          }),
        );
      },
    );
  }
}
