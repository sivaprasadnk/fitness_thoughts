import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static navigateToDetails({
    required BuildContext context,
    required BlogModel blog,
  }) async {
    try {
      // Show the loader dialog
      // showLoader(context);

      // // // Spawn the isolate to fetch blog details
      // // var blogDetails = await locator<GetPostDetails>().call(blog.id!);
      // // // Close the loader dialog
      // if (context.mounted) {
      //   Navigator.pop(context); // Dismiss loader
      // }

      // Navigate to the DetailsScreen
      if (context.mounted) {
        AutoRouter.of(context).navigate(DetailsRoute(id: blog.id!));
        // AutoRoute..navigateNamed('/books');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => DetailsScreen(id: blog.id!),
        //   ),
        // );
      }
    } catch (err) {
      debugPrint("## error :$err");
      // Ensure the loader is dismissed even in case of error
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  static Future showLoader(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  'Loading, please wait...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
