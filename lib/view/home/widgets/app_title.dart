import 'package:flutter/material.dart';
import 'package:task/components/consts/app_colors.dart';
import 'package:task/components/consts/app_images.dart';
import 'package:task/components/shared/cache_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome,\n${CacheHelper.getData(key: 'name')}',
            style: const TextStyle(
              color: ColorManager.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.profile),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
