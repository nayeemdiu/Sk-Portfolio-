import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skportfolio/widget/skill_card.dart';
import '../compunent/breakpoints.dart';
import '../compunent/custom_colors.dart';
import '../compunent/image_asset_constants.dart';
import 'hello_with_bio.dart';
import 'info.dart';

class LowerContainer extends StatelessWidget {
  final double width;
  const LowerContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= Breakpoints.lg) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Skills GridView for larger screens
                  Container(
                    width: width * 0.50,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      physics: NeverScrollableScrollPhysics(),
                      children: _buildSkillCards(width, 0.35),
                    ),
                  ),
                  SizedBox(width: 0.05 * width),
                  // Hello with bio and info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HelloWithBio(
                        ratio: 0.4,
                        width: width,
                      ),
                      const SizedBox(height: 30),
                      Info(width: width, ratio: 0.4),
                    ],
                  )
                ],
              );
            } else {
              // For smaller screens
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Skills GridView for small screens
                    Container(
                      width: width * 0.9,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Set to 2 for better mobile view
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1, // Ensure square cells
                        ),
                        itemCount: _buildSkillCards(width, 0.3).length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(), // Disable scroll inside the GridView
                        itemBuilder: (context, index) {
                          return _buildSkillCards(width, 0.3)[index];
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
          const SizedBox(height: 30),
          Text(
            'Some of My Interests',
            style: GoogleFonts.lobster(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          // You can add interest widgets here
        ],
      ),
    );
  }

  List<Widget> _buildSkillCards(double width, double ratio) {
    return [
      SkillCard(
        title: 'Flutter Development',
        description: 'I\'m developing Android, iOS, and web applications using Flutter',
        icon: ImageAssetConstants.flutter,
        width: width,
        ratio: ratio,
      ),
      SkillCard(
        title: 'Backend Development',
        description: 'Developing backend applications using Spring Boot, NodeJS, and more.',
        icon: ImageAssetConstants.backendIcon,
        width: width,
        ratio: ratio,
      ),
      SkillCard(
        title: 'Python Development',
        description: 'Building machine learning projects with Python, TensorFlow, and more.',
        icon: ImageAssetConstants.python,
        width: width,
        ratio: ratio,
      ),
    ];
  }
}
