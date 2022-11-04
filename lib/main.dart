import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/components/consts/const.dart';
import 'package:task/components/shared/bloc_observer.dart';
import 'package:task/components/shared/cache_helper.dart';
import 'package:task/components/shared/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  loginToken = CacheHelper.getData(key: 'token');
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

/// eden.miller@example.org
/// password
