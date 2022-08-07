class Catogary {
  int? success;
  List<GetService>? getService;

  Catogary({this.success, this.getService});

  Catogary.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['get_service'] != null) {
      getService = <GetService>[];
      json['get_service'].forEach((v) {
        getService!.add(new GetService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.getService != null) {
      data['get_service'] = this.getService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetService {
  String? mainServiceId;
  String? id;
  String? name;
  String? image;

  GetService({this.mainServiceId, this.id, this.name, this.image});

  GetService.fromJson(Map<String, dynamic> json) {
    mainServiceId = json['main_service_id'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_service_id'] = this.mainServiceId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
