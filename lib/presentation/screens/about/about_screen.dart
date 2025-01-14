import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.screenWidth;
    return Scaffold(
      backgroundColor: kBlueGreyColor,
      appBar: AppBar(
        backgroundColor: kBlueGreyColor,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(kAppName),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100) +
              EdgeInsets.only(left: width > 1325 ? 200 : width * .08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: 'A B O U T',
                textColor: kWhiteColor,
              ),
              SizedBox(height: 20),
              Container(
                height: 6,
                width: 50,
                color: Colors.orange,
              ),
              SizedBox(height: 50),
              Text(
                about,
                style: TextStyle(
                  color: kWhiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
