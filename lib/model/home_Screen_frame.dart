class home_screen_frame {
  int? success;
  List<GetMainService>? getMainService;

  home_screen_frame({this.success, this.getMainService});

  home_screen_frame.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['get_main_service'] != null) {
      getMainService = <GetMainService>[];
      json['get_main_service'].forEach((v) {
        getMainService!.add(new GetMainService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.getMainService != null) {
      data['get_main_service'] =
          this.getMainService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetMainService {
  String? id;
  String? serviceName;
  String? image;

  GetMainService({this.id, this.serviceName, this.image});

  GetMainService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['service_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_name'] = this.serviceName;
    data['image'] = this.image;
    return data;
  }
}
