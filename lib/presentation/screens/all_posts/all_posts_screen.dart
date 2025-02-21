import 'package:auto_route/annotations.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/providers/all_blog_provider.dart';
import 'package:fitness_thoughts/presentation/screens/components/blog_item.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/components/loading_shimmer.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
@RoutePage()
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
                : 16;
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    padding: EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionTitle(title: 'A L L\nP O S T S'),
                          SizedBox(height: 50),
                          if (crossAxisCount == 1)
                            Consumer(builder: (context, ref, _) {
                              var provider = ref.watch(allBlogsProvider);
                              return provider.when(
                                data: (blogs) {
                                  return ListView.builder(
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
                                  );
                                },
                                error: (err, stack) {
                                  return Center(
                                    child: Text(err.toString()),
                                  );
                                },
                                loading: () {
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16);
                                    },
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                defaultBorderRadius),
                                            child: LoadingShimmer(
                                              width: double.infinity,
                                              height: 280,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          LoadingShimmer(
                                            width: 75,
                                            height: 10,
                                          ),
                                          SizedBox(height: 10),
                                          LoadingShimmer(
                                            width: double.infinity,
                                            height: 20,
                                          ),
                                          SizedBox(height: 8),
                                          LoadingShimmer(
                                            width: double.infinity,
                                            height: 20,
                                          ),
                                          SizedBox(height: 24),
                                          LoadingShimmer(
                                            width: double.infinity,
                                            height: 16,
                                          ),
                                          SizedBox(height: 10),
                                          LoadingShimmer(
                                            width: double.infinity,
                                            height: 16,
                                          ),
                                          SizedBox(height: 10),
                                          LoadingShimmer(
                                            width: double.infinity,
                                            height: 16,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                              // return  ListView.builder(
                              //   shrinkWrap: true,
                              //   physics: NeverScrollableScrollPhysics(),
                              //   scrollDirection: Axis.vertical,
                              //   itemCount: blogs.length,
                              //   itemBuilder: (context, index) {
                              //     var blog = blogs[index];
                              //     return BlogItem(
                              //       blog: blog,
                              //       maxLines: 7,
                              //       height: 670,
                              //       width: postWidth,
                              //     );
                              //   },
                              // );
                            })
                          else
                            Consumer(builder: (context, ref, __) {
                              var provider = ref.watch(allBlogsProvider);

                              return provider.when(
                                data: (blogs) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: splitList(blogs, crossAxisCount)
                                        .map((blogg) {
                                      return Row(
                                        children: blogg.map((blog) {
                                          return Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: BlogItem(
                                                blog: blog,
                                                width: postWidth,
                                                maxLines: 5,
                                                height: 650,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }).toList(),
                                  );
                                  //   return Row(
                                  //     children:
                                  //         blogs.take(crossAxisCount).map((blog) {
                                  //       return Expanded(
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.all(8.0),
                                  //           child: BlogItem(
                                  //             blog: blog,
                                  //             width: postWidth,
                                  //             maxLines: 5,
                                  //             height: 650,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }).toList(),
                                  //   );
                                },
                                error: (err, stack) {
                                  return Center(
                                    child: Text(err.toString()),
                                  );
                                },
                                loading: () {
                                  return SizedBox(
                                    height: 650,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
                              );
                            }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<List<Widget>> splitList<Widget>(List<Widget> list, int chunkSize) {
    List<List<Widget>> result = [];

    for (int i = 0; i < list.length; i += chunkSize) {
      int end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
      result.add(list.sublist(i, end));
    }

    return result;
  }
}
