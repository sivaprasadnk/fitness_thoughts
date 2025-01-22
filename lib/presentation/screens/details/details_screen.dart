// import 'package:auto_route/annotations.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                : 24;
        return Scaffold(
          // backgroundColor: kWhiteColor,
          appBar: AppBar(
            // backgroundColor: kWhiteColor,
            title: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(kAppName),
            ),
            elevation: 0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: width < mobileBreakPoint,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              // padding: EdgeInsets.symmetric(horizontal: width > 945 ? 100 : 20),
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
                    padding: EdgeInsets.all(padding),
                    // margin: EdgeInsets.only(left: 200, right: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (blog.dateString != null) Text(blog.dateString!),
                        if (blog.dateString != null) SizedBox(height: 16),
                        if (blog.title != null)
                          Text(
                            blog.title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.isLargeDevice ? 36 : 24,
                              fontFamily: kLoraFont,
                              color: kCustomBlueColor,
                            ),
                          ),
                        if (blog.title != null) SizedBox(height: 32),
                        if (kIsWeb || width > mobileBreakPoint)
                          CommonAssetImage(
                            imagePath: blog.imageAssetPath!,
                            height: 280,
                            width: double.infinity,
                          )
                        else
                          CommonNetworkImage(
                            imageUrl: blog.imageNetworkPath!,
                            height: 280,
                            width: double.infinity,
                            blogId: blog.id!,
                          ),
                        if (blog.imageAssetPath != null) SizedBox(height: 32),
                        if (blog.subTitle != null)
                          Text(
                            blog.subTitle!,
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: kLoraFont,
                              color: kCustomBlueColor,
                            ),
                          ),
                        if (blog.subTitle != null) SizedBox(height: 16),
                        if (blog.content != null) Text(blog.content!),
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
