import 'package:flutter/material.dart';
import 'package:infosys_test_login_ui/assets/assets.gen.dart';
import 'package:infosys_test_login_ui/assets/colors.gen.dart';
import 'package:infosys_test_login_ui/assets/fonts.gen.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  @override
  Widget build(BuildContext context) {
    // widht 428, height 926
    // elipsed 460 = 49.6 % height ==> 50%
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Transform.translate(
          offset: Offset(-0.160 * screenWidth, -0.040 * screenHeight), // x,y (-72.0, -38.0)
          child: Transform.scale(
            scale: 1.08,
            child: Container(
              height: 1.08 * screenWidth,
              decoration:
                  const BoxDecoration(color: ColorName.lightPurple, shape: BoxShape.circle),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.267 * screenWidth, 0.233 * screenHeight), //x,y (111.0, 215.0)
          child: Transform.scale(
            scale: 1.08,
            child: Container(
              height: 1.08 * screenWidth,
              decoration: const BoxDecoration(
                color: ColorName.lightPurple,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.581 * screenWidth, 0.177 * screenHeight), //x,y (249.0, 164.0)
          child: Assets.images.greetSpiral.image(width: 103.0, height: 103.0),
        ),
        Transform.translate(
          offset: Offset(0.280 * screenWidth, 0.321 * screenHeight), //x,y (125.0, 298.0)
          child: Assets.images.greetFace.image(width: 165.0, height: 165.0),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 32, bottom: 46),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s Get Started',
                          style: TextStyle(
                            color: ColorName.purple,
                            fontFamily: FontFamily.inter,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            fontSize: 75,
                            // Adjust based on font size to achieve similar line height
                            height: 1,
                            letterSpacing: 0,
                            // overflow: TextOverflow.visible,
                            // height: 75,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Grow Together',
                          style: TextStyle(
                            color: ColorName.purple,
                            fontFamily: FontFamily.inter,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            // height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_in');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(281, 62),
                      backgroundColor: ColorName.purple,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                    child: const Text(
                      'JOIN NOW',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontFamily.inder,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 36),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
