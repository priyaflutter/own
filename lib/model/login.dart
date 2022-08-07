class Login {
  int? success;
  String? id;
  String? name;
  String? email;
  String? mobileNo;
  String? password;
  String? googleId;
  String? fbId;
  String? loginType;
  String? created;

  Login(
      {this.success,
        this.id,
        this.name,
        this.email,
        this.mobileNo,
        this.password,
        this.googleId,
        this.fbId,
        this.loginType,
        this.created});

  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    googleId = json['google_id'];
    fbId = json['fb_id'];
    loginType = json['login_type'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['google_id'] = this.googleId;
    data['fb_id'] = this.fbId;
    data['login_type'] = this.loginType;
    data['created'] = this.created;
    return data;
  }
}
