import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/model/washiron_model.dart';
import 'package:http/http.dart' as http;

class wash_fold_provi extends ChangeNotifier{

  washIron? wash;
  bool status=false;

 getproduct(BuildContext context) async {

   var url = Uri.parse(
       '${AppConstant.BASEURL}api_mrbubble.php?request_for=get_category');
   var response = await http.get(url);
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');
   var val=jsonDecode(response.body);
   wash=washIron.fromJson(val);
   status=true;
   notifyListeners();

  }


}