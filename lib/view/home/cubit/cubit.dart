import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:task/components/consts/const.dart';
import 'package:task/components/shared/dio_helper.dart';
import 'package:task/components/shared/end_points.dart';
import 'package:task/models/home_model.dart';
import 'package:task/models/login_model.dart';
import 'package:task/models/upload_model.dart';
import 'package:task/view/home/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  UploadModel? uploadModel;
  LoginModel? loginModel;
  File selectedImage = File('');

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  Future<void> onRefresh() async => getHomeData();

  /// get home data
  void getHomeData() {
    emit(HomeLoadingHomeDataState());
    DioHelper.getData(
      url: AppEndPoints.myGallery,
      token: 'Bearer $loginToken',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      loginModel = LoginModel.fromJson(value.data);
      // print('length=======<${homeModel!.data!.images!.length}>=======');
      emit(HomeSuccessHomeDataState());
    }).catchError((error) {
      // print('====Error=======<${error.toString()}>=======');
      emit(HomeErrorHomeDataState());
    });
  }

  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
    }
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
    }
  }

  void uploadImage({required File image}) {
    emit(HomeLoadingUploadImageState());
    DioHelper.postData(
      url: AppEndPoints.upload,
      token: 'Bearer $loginToken',
      data: FormData.fromMap({
        'img': MultipartFile.fromFileSync(image.path,
            filename: image.path.split('/').last),
      }),
    ).then((value) {
      uploadModel = UploadModel.fromJson(value.data);
      emit(HomeSuccessUploadImageState(uploadModel!));
    }).catchError((error) {
      // print('====Error====<${error.toString()}====');
      emit(HomeErrorUploadImageState(error.toString()));
    });
  }
}
