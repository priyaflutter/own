class washIron {
  int? success;
  List<GetCategory>? getCategory;

  washIron({this.success, this.getCategory});

  washIron.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['get_category'] != null) {
      getCategory = <GetCategory>[];
      json['get_category'].forEach((v) {
        getCategory!.add(new GetCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.getCategory != null) {
      data['get_category'] = this.getCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCategory {
  String? id;
  String? name;
  String? serviceId;
  String? mainServiceId;
  String? packagePrice;
  String? price;
  String? packApplied;
  String? image;

  GetCategory(
      {this.id,
        this.name,
        this.serviceId,
        this.mainServiceId,
        this.packagePrice,
        this.price,
        this.packApplied,
        this.image});

  GetCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceId = json['service_id'];
    mainServiceId = json['main_service_id'];
    packagePrice = json['package_price'];
    price = json['price'];
    packApplied = json['pack_applied'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['service_id'] = this.serviceId;
    data['main_service_id'] = this.mainServiceId;
    data['package_price'] = this.packagePrice;
    data['price'] = this.price;
    data['pack_applied'] = this.packApplied;
    data['image'] = this.image;
    return data;
  }
}
