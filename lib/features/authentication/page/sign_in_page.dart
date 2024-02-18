import 'package:flutter/material.dart';
import 'package:infosys_test_login_ui/assets/colors.gen.dart';
import 'package:infosys_test_login_ui/assets/fonts.gen.dart';
// import 'package:infosys_test_login_ui/features/authentication/authentication.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // width 428, height 926
    // elipsed 512 = 1.196 width ==> 1.2
    double appbarHeight = 56;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - appbarHeight;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 24),
          decoration: const BoxDecoration(
            color: ColorName.purple,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        leadingWidth: 68,
        centerTitle: false,
      ),
      body: Stack(children: [
        Transform.translate(
          // x,y (-144.0, 224.0)
          offset: Offset(-0.246 * screenWidth, 0.266 * screenHeight - 56),
          child: Transform.scale(
            scale: 1.18,
            child: Container(
              height: 1.18 * screenWidth,
              decoration: const BoxDecoration(
                color: ColorName.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Transform.translate(
          //x,y (59.7, 495.8)
          offset: Offset(0.219 * screenWidth, 0.525 * screenHeight - 56),
          child: Transform.scale(
            scale: 1.18,
            child: Container(
              height: 1.18 * screenWidth,
              decoration: const BoxDecoration(
                color: ColorName.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 54),
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: ColorName.purple,
                                fontFamily: FontFamily.inter,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                // Adjust based on font size to achieve similar line height
                                height: 1.18,
                                letterSpacing: 0,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Enter Your Username & Password',
                              style: TextStyle(
                                color: ColorName.purple,
                                fontFamily: FontFamily.inter,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 164),
                            TextField(
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: FontFamily.inter,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  height: 1.2,
                                ),
                              ),
                              controller: usernameController,
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 52),
                            TextField(
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: FontFamily.inter,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  height: 1.2,
                                ),
                              ),
                              controller: usernameController,
                              onChanged: (value) => setState(() {}),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 88),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(232, 54),
                          backgroundColor: ColorName.purple,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.inder,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Forgotten Passwoard?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamily.inter,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/sign_up");
                        },
                        child: const Text(
                          'Or Create a New Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: FontFamily.inter,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.2,
                          ),
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
          ),
        ),
      ]),
    );
  }
}
