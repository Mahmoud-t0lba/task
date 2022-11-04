import 'package:task/components/app_widgets/components.dart';
import 'package:task/components/shared/cache_helper.dart';

void signOut(context, widget) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigateAndFinish(context, widget);
  });
}

String? loginToken = '';
