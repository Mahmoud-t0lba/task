import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/components/consts/const.dart';
import 'package:task/components/consts/themes.dart';
import 'package:task/view/auth/login/login_screen.dart';
import 'package:task/view/home/cubit/cubit.dart';
import 'package:task/view/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: loginToken == null ? const LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
