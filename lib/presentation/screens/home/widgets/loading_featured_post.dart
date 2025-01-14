import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class LoadingFeaturedPost extends StatelessWidget {
  const LoadingFeaturedPost({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.screenWidth;
    double horizontalPadding = width > 1325 ? 150 : 100;
    horizontalPadding = context.horizontalPadding;
    var color = kCustomBlueColor;

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: width > 945 ? 75 : 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
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
              SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: kGreyColor,
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
                            Container(
                              height: 15,
                              width: 75,
                              color: kGreyColor,
                            ),
                            // Text(
                            //   blog.dateString!,
                            //   style: TextStyle(
                            //     color: color,
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            Container(
                              height: 15,
                              width: double.infinity,
                              color: kGreyColor,
                            ),
                            // Text(
                            //   blog.title!,
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 18,
                            //     color: color,
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            // Text(
                            //   blog.subTitle!,
                            //   textAlign: TextAlign.justify,
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: color,
                            //   ),
                            //   maxLines: width < 1100 ? 6 : 10,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            Container(
                              height: 15,
                              width: double.infinity,
                              color: kGreyColor,
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 15,
                              width: double.infinity,
                              color: kGreyColor,
                            ),
                            SizedBox(height: 10),

                            Container(
                              height: 15,
                              width: double.infinity,
                              color: kGreyColor,
                            ),
                            Spacer(),
                            // ReadMoreButton(
                            //   color: color,
                            //   callback: () {
                            //     AutoRouter.of(context).push(
                            //         DetailsRoute(
                            //             id: blog.id!, blog: blog));
                            //   },
                            // ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    // if (width > 1337) SizedBox(width: 200),
                  ],
                ),
              )
            else ...[
              Padding(
                padding: EdgeInsets.only(
                  right: context.isLargeDevice ? horizontalPadding : 0,
                ),
                child: Container(
                  color: kGreyColor,
                  height: context.isLargeDevice ? 350 : 280,
                  width: context.isLargeDevice ? 450 : double.infinity,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 15,
                width: 75,
                color: kGreyColor,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: horizontalPadding),
                child: Container(
                  color: kGreyColor,
                  width: double.infinity,
                  height: 20,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: horizontalPadding),
                child: Column(
                  children: [
                    Container(
                      height: 15,
                      width: double.infinity,
                      color: kGreyColor,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 15,
                      width: double.infinity,
                      color: kGreyColor,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 15,
                      width: double.infinity,
                      color: kGreyColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 70),
            ],
          ],
        ),
      ),
    );
  }
}
