import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/bloc/all_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/components/blog_item.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        return Scaffold(
          appBar: CommonAppBar(
            automaticallyImplyLeading: width < mobileBreakPoint,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(12),
                  child: BlocBuilder<AllBlogCubit, List<BlogModel>>(
                      builder: (context, blogs) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionTitle(title: 'A L L\nP O S T S'),
                          SizedBox(height: 50),
                          if (crossAxisCount == 1)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: blogs.length,
                              itemBuilder: (context, index) {
                                var blog = blogs[index];
                                return BlogItem(
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
                                    child: BlogItem(
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
                      ),
                    );
                  }),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
