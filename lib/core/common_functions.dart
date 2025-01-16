import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/presentation/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static navigateToDetails({
    required BuildContext context,
    required BlogModel blog,
  }) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => DetailsScreen(blog: blog)));
  }
}
