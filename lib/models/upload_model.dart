class UploadModel {
  String? status;
  List<String>? data;
  String? message;

  UploadModel({this.status, this.data, this.message});

  UploadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}
