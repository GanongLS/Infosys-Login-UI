import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infosys_test_login_ui/assets/colors.gen.dart';
import 'package:infosys_test_login_ui/assets/fonts.gen.dart';
import 'package:infosys_test_login_ui/features/authentication/bloc/register_bloc/reg_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // width 428, height 926
    // elipsed 512 = 1.196 width ==> 1.2
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - 56;
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
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error.toString(),
                  ),
                ),
              );
            }
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Selamat datang'),
                ),
              );
              // Navigator.pushNamed(context, '/home');
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                ModalRoute.withName('/'),
              );
            }
          },
          builder: (context, state) {
            return Stack(children: [
              Transform.translate(
                // x,y (-78.0, 75.0)
                offset: Offset(-0.182 * screenWidth, 0.080 * screenHeight - 56),
                child: Transform.scale(
                  scale: 1.18,
                  child: Container(
                    height: 1.18 * screenWidth,
                    decoration: const BoxDecoration(
                      color: ColorName.peach,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                //x,y (106, 328.0)
                offset: Offset(0.247 * screenWidth, 0.354 * screenHeight - 56),
                child: Transform.scale(
                  scale: 1.18,
                  child: Container(
                    height: 1.18 * screenWidth,
                    decoration: const BoxDecoration(
                      color: ColorName.peach,
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
                                  const SizedBox(height: 42),
                                  const SizedBox(
                                    width: 240,
                                    child: Text(
                                      'Create Acount :)',
                                      style: TextStyle(
                                        color: ColorName.purple,
                                        fontFamily: FontFamily.inter,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        height: 1.18,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 80),
                                  TextField(
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      labelText: "Enter Email Id",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: FontFamily.inter,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        height: 1.2,
                                      ),
                                    ),
                                    controller: emailController,
                                    onChanged: (value) => setState(() {}),
                                  ),
                                  const SizedBox(height: 52),
                                  TextField(
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      labelText: "Create Username",
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
                                      labelText: "Create Password",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: FontFamily.inter,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        height: 1.2,
                                      ),
                                    ),
                                    controller: passwordController,
                                    onChanged: (value) => setState(() {}),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 88),
                            ElevatedButton(
                              onPressed: () {
                                context.read<RegisterBloc>().add(
                                      RegisterRequested(
                                        email: emailController.text.trim(),
                                        username: usernameController.text.trim(),
                                        password: passwordController.text.trim(),
                                      ),
                                    );
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
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontFamily.inder,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 36,
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
            ]);
          },
        ));
  }
}
