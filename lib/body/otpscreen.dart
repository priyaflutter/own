import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class mobile extends StatefulWidget {
  String name1;
  String password1;
  String mail1;
  String otp;
  String mobile1;

  mobile(this.name1, this.password1, this.mail1, this.otp, this.mobile1);

  State<mobile> createState() => _mobileState();
}

class _mobileState extends State<mobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
    ToastContext().init(context);
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: theight,
        width: twidth,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: theight * 0.40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(theight * 0.10),
                        bottomLeft: Radius.circular(theight * 0.10),
                      ),
                      gradient: const LinearGradient(
                          stops: [
                            0.0,
                            0.5,
                          ],
                          colors: [
                            Color(0xff4c494c),
                            Color(0xff878287)
                          ],
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft),
                    ),
                  ),
                ),
                Container(
                  height: theight * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: theight * 0.05,
                      ),
                      Center(
                          child: Icon(
                        Icons.mobile_friendly_outlined,
                        size: theight * 0.10,
                      )),
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontSize: theight * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+91 ${widget.mobile1}",
                        style: TextStyle(
                            fontSize: theight * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: theight * 0.10,
            ),
            Container(
              height: theight * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: PinCodeTextField(
                  length: 6,
                  appContext: context,
                  obscureText: false,
                  showCursor: true,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 45,
                    fieldWidth: 45,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(0),
                    selectedColor: Theme.of(context).primaryColor,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Color(0xFFF4F7FC),
                    inactiveColor: Color(0x30192D6B),
                    activeColor: Color(0x50192D6B),
                    activeFillColor: Color(0xFFF4F7FC),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: (value) => _verificationCode = value,
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
            ),
            Text("00:$_start"),
            Spacer(),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Submit();
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(theight * 0.02),
                  height: theight * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xff4c494c)),
                  child: Center(
                      child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontSize: theight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> Submit() async {
    EasyLoading.show(status: "loading...").whenComplete(() async {    
      // if (widget.otp == _verificationCode) {
        print("otttppp done");

        var url = Uri.parse(
            '${AppConstant.BASEURL}api_mrbubble.php?request_for=register&mo_no=${widget.mobile1}&name=${widget.name1}&email=${widget.mail1}&password=${widget.password1}&login_type=1&google_id=&fb_id');
        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        var val = jsonDecode(response.body);

        if (val['success'] == 1) {
          AppConstant.gettost("Registration Sucessfully");
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return home();
            },
          ));

          EasyLoading.dismiss();
        }
        else {
          Toast.show("Mobile Number Already Register",
              duration: Toast.lengthShort, gravity: Toast.center);
        }
        EasyLoading.dismiss();
    //   } else if (_verificationCode.isEmpty) {
    //     Toast.show("Please Enter OTP",
    //         duration: Toast.lengthShort, gravity: Toast.center);
    //   } else {
    //     Toast.show("Invalid OTP",
    //         duration: Toast.lengthShort, gravity: Toast.center);
    //   }
    //   EasyLoading.dismiss();
    });
  }

  String _verificationCode = "";
  Timer? _timer;
  int _start = 30;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }
}
