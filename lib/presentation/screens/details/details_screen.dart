import 'package:auto_route/annotations.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.blog,
    @PathParam('id') required this.id,
  });
  final BlogModel blog;
  final int id;
  @override
  Widget build(BuildContext context) {
    double padding = context.isLargeDevice ? 50 : 20;
    // var blog = blogs.where((blog) => blog.id! == id).first;
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
        automaticallyImplyLeading: context.isMobileDevice,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          // padding: EdgeInsets.symmetric(horizontal: width > 945 ? 100 : 20),
          padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  // border: Border.all(),
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
                        ),
                      ),
                    if (blog.title != null) SizedBox(height: 32),
                    if (blog.imageAssetPath != null &&
                        blog.imageAssetPath!.isNotEmpty)
                      CommonAssetImage(
                        imagePath: blog.imageAssetPath!,
                        height: context.screenHeight * .5,
                        width: double.infinity,
                      )
                    else if (blog.imageNetworkPath != null &&
                        blog.imageNetworkPath!.isNotEmpty)
                      CommonNetworkImage(
                        imageUrl: blog.imageNetworkPath!,
                        height: context.isLargeDevice
                            ? context.screenHeight * .5
                            : 280,
                        width: double.infinity,
                      ),
                    if (blog.imageAssetPath != null) SizedBox(height: 32),
                    if (blog.subTitle != null)
                      Text(
                        blog.subTitle!,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          // fontSize: 48,
                          fontFamily: kLoraFont,
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
  }
}
