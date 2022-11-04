import 'package:task/models/upload_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingHomeDataState extends HomeStates {}

class HomeSuccessHomeDataState extends HomeStates {}

class HomeErrorHomeDataState extends HomeStates {}

class HomeLoadingUploadImageState extends HomeStates {}

class HomeSuccessUploadImageState extends HomeStates {
  final UploadModel uploadModel;

  HomeSuccessUploadImageState(this.uploadModel);
}

class HomeErrorUploadImageState extends HomeStates {
  final String error;

  HomeErrorUploadImageState(this.error);
}
