import 'package:flutter/material.dart';
import 'package:task/components/app_widgets/custom_btn.dart';
import 'package:task/components/consts/app_colors.dart';
import 'package:task/components/consts/app_images.dart';
import 'package:task/components/consts/const.dart';
import 'package:task/view/auth/login/login_screen.dart';
import 'package:task/view/home/widgets/custom_dialog.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Button1(),
          SizedBox(width: 10),
          Button2(),
        ],
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: () => signOut(context, const LoginScreen()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImages.logout, width: 30, height: 30),
          const SizedBox(width: 10),
          const Text(
            'log out',
            style: TextStyle(
              color: ColorManager.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: () =>
          showDialog(context: context, builder: (context) => const DialogFb1()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImages.upload, width: 30, height: 30),
          const SizedBox(width: 10),
          const Text(
            'upload',
            style: TextStyle(
              color: ColorManager.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
