// import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/providers/blog_details_provider.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/loading_shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    // required this.blog,
    @PathParam('id') required this.id,
  });
  // final BlogModel blog;
  final int id;
  @override
  Widget build(BuildContext context) {
    // var blog = blogs.where((blog) => blog.id! == id).first;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        // double padding = width > mobileBreakPoint ? 50 : 20;
        double horizontalPadding = width > 1325
            ? 150
            : width > 950
                ? 80
                : 16;
        return Scaffold(
          appBar: CommonAppBar(
            automaticallyImplyLeading: width < mobileBreakPoint,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    padding: EdgeInsets.all(12),
                    // margin: EdgeInsets.only(left: 200, right: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final blogDetails =
                                ref.watch(blogDetailsProvider(id));
                            return blogDetails.when(
                              data: (blog) {
                                return Column(
                                  children: [
                                    if (blog.dateString != null)
                                      Center(child: Text(blog.dateString!)),
                                    if (blog.dateString != null)
                                      SizedBox(height: 16),
                                    if (blog.title != null)
                                      Center(
                                        child: MarkdownBody(
                                          data: blog.title!,
                                          // style: TextStyle(
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize:
                                          //       context.isLargeDevice ? 24 : 18,
                                          //   fontFamily: kLoraFont,
                                          //   color: kCustomBlueColor,
                                          // ),
                                        ),
                                      ),
                                    if (blog.title != null)
                                      SizedBox(height: 32),
                                    if (kIsWeb || width > mobileBreakPoint)
                                      CommonAssetImage(
                                        imagePath: blog.imageAssetPath!,
                                        height: 280,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                        cacheHeight: 350,
                                      )
                                    else
                                      CommonNetworkImage(
                                        imageUrl: blog.imageNetworkPath!,
                                        height: 280,
                                        width: double.infinity,
                                        cacheKey: blog.cacheKey!,
                                      ),
                                    if (blog.imageAssetPath != null)
                                      SizedBox(height: 32),
                                    if (blog.subTitle != null)
                                      MarkdownBody(
                                        data: blog.subTitle!,
                                        // style: TextStyle(
                                        //   fontSize: 16,
                                        //   fontFamily: kLoraFont,
                                        //   color: kCustomBlueColor,
                                        // ),
                                      ),
                                    if (blog.subTitle != null)
                                      SizedBox(height: 16),
                                    if (blog.content != null)
                                      MarkdownBody(
                                        data: blog.content!,
                                        // extensionSet: md.ExtensionSet(
                                        //   md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                                        //   <md.InlineSyntax>[
                                        //     md.EmojiSyntax(),
                                        //     ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                                        //   ],
                                        // ),
                                        // style: TextStyle(
                                        // fontSize: 16,
                                        // fontFamily: kLoraFont,
                                        // color: kCustomBlueColor,
                                        // ),
                                      ),
                                  ],
                                );
                              },
                              error: (err, stack) {
                                return Center(
                                  child: Text(err.toString()),
                                );
                              },
                              loading: () {
                                return SizedBox(
                                  height: context.screenHeight,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: LoadingShimmer(
                                          width: 100,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Center(
                                        child: LoadingShimmer(
                                          width: double.infinity,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: LoadingShimmer(
                                          width: double.infinity,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(height: 32),
                                      if (kIsWeb || width > mobileBreakPoint)
                                        Center(
                                          child: LoadingShimmer(
                                            width: double.infinity,
                                            height: 250,
                                          ),
                                        )
                                      else
                                        Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              defaultBorderRadius,
                                            ),
                                            child: LoadingShimmer(
                                              width: double.infinity,
                                              height: 250,
                                            ),
                                          ),
                                        ),
                                      SizedBox(height: 32),
                                      Center(
                                        child: LoadingShimmer(
                                          width: double.infinity,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Center(
                                        child: LoadingShimmer(
                                          width: double.infinity,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // child: Center(
                                  //   child: CircularProgressIndicator(),
                                  // ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
