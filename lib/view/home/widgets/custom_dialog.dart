import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task/components/app_widgets/components.dart';
import 'package:task/components/app_widgets/glass_button.dart';
import 'package:task/components/consts/app_images.dart';
import 'package:task/view/home/cubit/cubit.dart';
import 'package:task/view/home/widgets/dialog_btn.dart';

class DialogFb1 extends StatelessWidget {
  const DialogFb1({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.transparent,
      child: GlassButton(
        height: 250,
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleBtn(
              text: 'Gallery',
              image: AppImages.pics,
              onTap: () {
                cubit.getFromGallery().then((value) {
                  cubit.uploadImage(image: cubit.selectedImage);
                }).catchError((error) {
                  customSnackBar(context, text: error.toString());
                  // print('====Upload Error====<${error.toString()}>');
                });
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 30),
            SimpleBtn(
              text: 'Camera',
              image: AppImages.cam,
              onTap: () {
                cubit.getFromCamera().then((value) {
                  cubit.uploadImage(image: cubit.selectedImage);
                }).catchError((error) {
                  customSnackBar(context, text: error.toString());
                  // print('====Upload Error====<${error.toString()}>');
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
