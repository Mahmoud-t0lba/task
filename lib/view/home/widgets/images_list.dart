import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:task/view/home/cubit/cubit.dart';

class ImagesGridView extends StatelessWidget {
  const ImagesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Center(
      child: SmartRefresher(
        controller: cubit.refreshController,
        onRefresh: cubit.onRefresh,
        child: Conditional.single(
          context: context,
          conditionBuilder: (context) => cubit.homeModel != null,
          widgetBuilder: (context) {
            return GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1 / 1,
              children: List.generate(
                cubit.homeModel!.data!.images!.length,
                (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          cubit.homeModel!.data!.images![index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          fallbackBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
