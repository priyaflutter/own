import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/model/catogary.dart';
import 'package:http/http.dart' as http;
import 'package:skedulrs/model/home_Screen_frame.dart';

class Service_pro extends ChangeNotifier{

  Catogary? cat;
  bool status=false;

  getproduct(BuildContext context) async {

    var url = Uri.parse(
        '${AppConstant.BASEURL}api_mrbubble.php?request_for=get_service&main_service_id=1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var val=jsonDecode(response.body);
      cat=Catogary.fromJson(val);
      status=true;
    notifyListeners();
    if(cat!.success==1)
      {

      }
  }

  home_screen_frame?  imageupdate;
  Homescreenframe(BuildContext context) async {

    var url = Uri.parse(
        '${AppConstant.BASEURL}api_mrbubble.php?request_for=get_main_service');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var val=jsonDecode(response.body);
    imageupdate=home_screen_frame.fromJson(val);
    notifyListeners();
  }
}