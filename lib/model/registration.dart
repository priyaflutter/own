class Registration {
  int? success;
  int? id;

  Registration({this.success, this.id});

  Registration.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    return data;
  }
}
