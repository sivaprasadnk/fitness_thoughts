import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static navigateToDetails({
    required BuildContext context,
    required BlogModel blog,
  }) async {
    AutoRouter.of(context).push(DetailsRoute(id: blog.id!, blog: blog));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => DetailsScreen(blog: blog)));
  }
}
