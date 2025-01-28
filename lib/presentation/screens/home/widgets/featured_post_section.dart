// import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_functions.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/bloc/featured_blog_cubit.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_network_image.dart';
import 'package:fitness_thoughts/presentation/screens/components/read_more_button.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedPostSection extends StatelessWidget {
  const FeaturedPostSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("## width :${context.screenWidth}");
    var width = context.screenWidth;
    var color = kCustomBlueColor;
    return BlocBuilder<FeaturedBlogCubit, BlogModel?>(
      // bloc: ,
      builder: (context, blog) {
        if (blog == null) {
          return SizedBox.shrink();
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
              SectionTitle(
                title: 'F E A T U R E D\nP O S T',
                textColor: color,
              ),
              SizedBox(height: 50),
              if (width > 945)
                GestureDetector(
                  onTap: () async {
                    await CommonFunctions.navigateToDetails(
                        context: context, blog: blog);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (blog.imageAssetPath != null &&
                            blog.imageAssetPath!.isNotEmpty)
                          CommonAssetImage(
                            imagePath: blog.imageAssetPath!,
                            height: 350,
                            width: 450,
                          ),
                        SizedBox(width: 50),
                        Expanded(
                          child: SizedBox(
                            height: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  blog.dateString!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: kGreyColor,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  blog.title!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: color,
                                  ),
                                ),
                                SizedBox(height: 20),
                                MarkdownBody(
                                  data: blog.subTitle!,
                                  // textAlign: TextAlign.justify,
                                  // style: TextStyle(
                                  //   fontSize: 16,
                                  //   color: color,
                                  // ),
                                  // maxLines: width < 1100 ? 6 : 6,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                // Spacer(),
                                ReadMoreButton(
                                  color: color,
                                  callback: () {
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

                                    // AutoRouter.of(context).push(DetailsRoute(
                                    //     id: blog.id!, blog: blog));
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else ...[
                kIsWeb
                    ? CommonAssetImage(
                        imagePath: blog.imageAssetPath!,
                        height: context.isLargeDevice ? 350 : 280,
                        width: context.isLargeDevice ? 450 : double.infinity,
                      )
                    : GestureDetector(
                        onTap: () {
                          CommonFunctions.navigateToDetails(
                            context: context,
                            blog: blog,
                          );
                        },
                        child: CommonNetworkImage(
                          imageUrl: blog.imageNetworkPath!,
                          height: context.isLargeDevice ? 350 : 280,
                          width: context.isLargeDevice ? 450 : double.infinity,
                          cacheKey: blog.cacheKey!,
                        ),
                      ),
                SizedBox(height: 20),
                Text(
                  blog.dateString!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: kGreyColor,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    CommonFunctions.navigateToDetails(
                      context: context,
                      blog: blog,
                    );
                  },
                  child: Text(
                    blog.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    CommonFunctions.navigateToDetails(
                      context: context,
                      blog: blog,
                    );
                  },
                  child: MarkdownBody(
                    data: blog.subTitle!,
                  ),
                ),
                SizedBox(height: 20),
                ReadMoreButton(
                  color: color,
                  callback: () {
                    CommonFunctions.navigateToDetails(
                      context: context,
                      blog: blog,
                    );
                  },
                ),
                SizedBox(height: 70),
              ],
            ],
          ),
        );
        // var provider = ref.watch(featuredBlogProvider);
        // return provider.when(
        //   skipLoadingOnRefresh: true,
        //   data: (blog) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         color: kWhiteColor,
        //         borderRadius: BorderRadius.circular(defaultBorderRadius),
        //       ),
        //       padding: EdgeInsets.all(16),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           SectionTitle(
        //             title: 'F E A T U R E D\nP O S T',
        //             textColor: color,
        //           ),
        //           SizedBox(height: 50),
        //           if (width > 945)
        //             SizedBox(
        //               width: double.infinity,
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   if (blog.imageAssetPath != null &&
        //                       blog.imageAssetPath!.isNotEmpty)
        //                     CommonAssetImage(
        //                       imagePath: blog.imageAssetPath!,
        //                       height: 350,
        //                       width: 450,
        //                     ),
        //                   SizedBox(width: 50),
        //                   Expanded(
        //                     child: SizedBox(
        //                       height: 350,
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         mainAxisSize: MainAxisSize.min,
        //                         children: [
        //                           SizedBox(height: 20),
        //                           Text(
        //                             blog.dateString!,
        //                             style: TextStyle(
        //                               fontWeight: FontWeight.normal,
        //                               fontSize: 12,
        //                               color: kGreyColor,
        //                             ),
        //                           ),
        //                           SizedBox(height: 20),
        //                           Text(
        //                             blog.title!,
        //                             style: TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: 18,
        //                               color: color,
        //                             ),
        //                           ),
        //                           SizedBox(height: 20),
        //                           Text(
        //                             blog.subTitle!,
        //                             textAlign: TextAlign.justify,
        //                             style: TextStyle(
        //                               fontSize: 16,
        //                               color: color,
        //                             ),
        //                             maxLines: width < 1100 ? 6 : 10,
        //                             overflow: TextOverflow.ellipsis,
        //                           ),
        //                           Spacer(),
        //                           ReadMoreButton(
        //                             color: color,
        //                             callback: () {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (_) => DetailsScreen(
        //                                           blog: blog, id: blog.id!)));

        //                               // AutoRouter.of(context).push(DetailsRoute(
        //                               //     id: blog.id!, blog: blog));
        //                             },
        //                           ),
        //                           SizedBox(height: 20),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           else ...[
        //             // kIsWeb
        //             //     ? CommonAssetImage(
        //             //         imagePath: blog.imageAssetPath!,
        //             //         height: context.isLargeDevice ? 350 : 280,
        //             //         width:
        //             //             context.isLargeDevice ? 450 : double.infinity,
        //             //       )
        //             //     : CommonNetworkImage(
        //             //         imageUrl: blog.imageNetworkPath!,
        //             //         height: context.isLargeDevice ? 350 : 280,
        //             //         width:
        //             //             context.isLargeDevice ? 450 : double.infinity,
        //             //       ),
        //             SizedBox(height: 20),
        //             Text(
        //               blog.dateString!,
        //               style: TextStyle(
        //                 fontWeight: FontWeight.normal,
        //                 fontSize: 12,
        //                 color: kGreyColor,
        //               ),
        //             ),
        //             SizedBox(height: 20),
        //             Text(
        //               blog.title!,
        //               style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 18,
        //                 color: color,
        //               ),
        //             ),
        //             SizedBox(height: 20),
        //             Text(
        //               blog.subTitle!,
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 color: color,
        //               ),
        //               maxLines: width < 1100 ? 6 : 10,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //             SizedBox(height: 20),
        //             ReadMoreButton(
        //               color: color,
        //               callback: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (_) =>
        //                             DetailsScreen(blog: blog, id: blog.id!)));

        //                 // AutoRouter.of(context)
        //                 //     .push(DetailsRoute(id: blog.id!, blog: blog));
        //               },
        //             ),
        //             SizedBox(height: 70),
        //           ],
        //         ],
        //       ),
        //     );
        //   },
        //   error: (error, stackTrace) {
        //     return Center(
        //       child: Text(error.toString()),
        //     );
        //   },
        //   loading: () {
        //     return LoadingFeaturedPost();
        //   },
        // );
      },
    );
  }
}
