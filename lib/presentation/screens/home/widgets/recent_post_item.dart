import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/read_more_button.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:universal_html/html.dart' as html;
class RecentPostItem extends StatelessWidget {
  const RecentPostItem({
    super.key,
    required this.blog,
    this.width,
    this.height,
    this.showBorder = true,
    this.maxLines,
  });
  final BlogModel blog;
  final double? width;
  final double? height;
  final bool showBorder;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    var showAssetImage = kIsWeb || context.isLargeDevice;
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(DetailsRoute(id: blog.id!, blog: blog));
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: showBorder ? Border.all() : null,
        ),
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
                      )
                    : CommonNetworkImage(
                        imageUrl: blog.imageNetworkPath!,
                        height: 280,
                        width: double.infinity,
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
                Text(
                  blog.subTitle!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: kCustomBlueColor,
                  ),
                  // maxLines: 8,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
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
