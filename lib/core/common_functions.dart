import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class CommonFunctions {
  static navigateToDetails({
    required BuildContext context,
    required BlogModel blog,
    required bool biometricsRequired,
  }) async {
    try {
      if (biometricsRequired) {
        var auth = locator<LocalAuthentication>();
        final List<BiometricType> availableBiometrics =
            await auth.getAvailableBiometrics();
        if (availableBiometrics.isNotEmpty) {
          final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Please authenticate to view details');

          if (didAuthenticate && context.mounted) {
            AutoRouter.of(context).navigate(DetailsRoute(id: blog.id!));
          }
          // Some biometrics are enrolled.
        } else {
          if (context.mounted) {
            AutoRouter.of(context).navigate(DetailsRoute(id: blog.id!));
          }
        }
      } else {
        AutoRouter.of(context).navigate(DetailsRoute(id: blog.id!));

      }
    } on PlatformException catch (exc) {
      debugPrint("## PlatformException $exc");
      if (context.mounted) {
        Navigator.pop(context);
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
