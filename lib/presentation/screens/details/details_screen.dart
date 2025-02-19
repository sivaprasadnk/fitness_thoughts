// import 'package:auto_route/annotations.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_appbar.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// @RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.blog,
    // @PathParam('id') required this.id,
  });
  final BlogModel blog;
  // final int id;
  @override
  Widget build(BuildContext context) {
    // var blog = blogs.where((blog) => blog.id! == id).first;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        double padding = width > mobileBreakPoint ? 50 : 20;
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
                        if (blog.dateString != null)
                          Center(child: Text(blog.dateString!)),
                        if (blog.dateString != null) SizedBox(height: 16),
                        if (blog.title != null)
                          Center(
                            child: Text(
                              blog.title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.isLargeDevice ? 24 : 24,
                                fontFamily: kLoraFont,
                                color: kCustomBlueColor,
                              ),
                            ),
                          ),
                        if (blog.title != null) SizedBox(height: 32),
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
                        if (blog.imageAssetPath != null) SizedBox(height: 32),
                        if (blog.subTitle != null)
                          MarkdownBody(
                            data: blog.subTitle!,
                            // style: TextStyle(
                            //   fontSize: 16,
                            //   fontFamily: kLoraFont,
                            //   color: kCustomBlueColor,
                            // ),
                          ),
                        if (blog.subTitle != null) SizedBox(height: 16),
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
