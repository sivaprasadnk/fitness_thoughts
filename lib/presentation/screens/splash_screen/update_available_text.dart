import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAvailableText extends StatelessWidget {
  const UpdateAvailableText({super.key, this.showUpdateText});
  final bool? showUpdateText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: showUpdateText != null && showUpdateText!,
        child: GestureDetector(
          onTap: () async {
            await launchUrl(Uri.parse(playStoreUrl));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update available. Click to update',
                style: TextStyle(
                  color: kCustomBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.cloud_download,
                color: kCustomBlueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
