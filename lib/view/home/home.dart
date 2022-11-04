import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/components/app_widgets/app_back.dart';
import 'package:task/components/consts/app_images.dart';
import 'package:task/view/home/cubit/cubit.dart';
import 'package:task/view/home/cubit/states.dart';
import 'package:task/view/home/widgets/app_title.dart';
import 'package:task/view/home/widgets/home_button.dart';
import 'package:task/view/home/widgets/images_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: AppBack(
              image: AppImages.homeBack,
              child: Column(
                children: const [
                  AppTitle(),
                  HomeButtons(),
                  SizedBox(height: 20),
                  Expanded(child: ImagesGridView()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
