import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_functions.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/read_more_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogItem extends StatelessWidget {
  final BlogModel blog;
  final double? width;
  final double? height;
  final int? maxLines;
  const BlogItem({
    super.key,
    required this.blog,
    this.height,
    this.width,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    var showAssetImage = kIsWeb || context.isLargeDevice;
    return GestureDetector(
      onTap: () {
        CommonFunctions.navigateToDetails(
          context: context,
          blog: blog,
        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => DetailsScreen(
        //               blog: blog,
        //             )));
        // AutoRouter.of(context).push(DetailsRoute(id: blog.id!, blog: blog));
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: showAssetImage
                    ? CommonAssetImage(
                        imagePath: blog.imageAssetPath!,
                        height: 280,
                        width: double.infinity,
                        cacheHeight: 280,
                      )
                    : CommonNetworkImage(
                        imageUrl: blog.imageNetworkPath!,
                        height: 280,
                        width: double.infinity,
                        cacheKey: blog.cacheKey!,
                      ),
              ),
              SizedBox(height: 20),
              if (blog.dateString != null)
                Text(
                  blog.dateString!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: kGreyColor,
                  ),
                ),
              SizedBox(height: 10),
              if (blog.title != null)
                Text(
                  blog.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kCustomBlueColor,
                  ),
                ),
              SizedBox(height: 20),
              if (blog.subTitle != null)
                MarkdownBody(
                  data: blog.subTitle!,

                  // style: TextStyle(
                  //   fontSize: 16,
                  //   color: kCustomBlueColor,
                  // ),
                  // // maxLines: 8,
                  // maxLines: maxLines,
                  // overflow: TextOverflow.ellipsis,
                ),
              // Spacer(),
              SizedBox(height: 24),
              ReadMoreButton(
                absorbing: true,
                color: kCustomBlueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
