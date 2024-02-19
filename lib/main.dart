import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infosys_test_login_ui/features/authentication/authentication.dart';
import 'package:infosys_test_login_ui/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:infosys_test_login_ui/features/authentication/bloc/register_bloc/reg_bloc.dart';
import 'package:infosys_test_login_ui/features/home/page/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const GreetingPage(),
          '/sign_in': (context) => const SignInPage(),
          '/sign_up': (context) => const SignUpPage(),
          '/home': (context) => const MyHomePage(title: 'My Home'),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
