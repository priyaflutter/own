import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/body/otpscreen.dart';
import 'package:skedulrs/model/login.dart';
import 'package:skedulrs/model/registration.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }

  @override
  Widget build(BuildContext context) {

    otp = Random().nextInt(999999).toString().padLeft(6, '0');

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: twidth,
          height: theight,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [
            Color(0xf02d2c2c),
            Color(0xf06f6f6f),
            Color(0xf02d2c2c)
          ])),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: theight*0.40,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left:theight * 0.02,top: theight * 0.05),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/bk_sign_up.jpg"),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          Text(
                            "Welcome User",
                            textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                fontSize: theight * 0.04,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: theight * 0.07),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/bgnew.png"),
                                fit: BoxFit.fill)),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have already account?",
                                style: GoogleFonts.montserrat(
                                  fontSize: theight * 0.02,
                                  color: Colors.white,
                                )
                            ),
                            GestureDetector(
                              onTap: () {
                                print("registere");
                                Navigator.pop(context);
                              },
                              child: Text(
                                " Login",
                                  style: GoogleFonts.montserrat(
                                    fontSize: theight * 0.02,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(alignment: Alignment.bottomRight,
                  children: [
                    Container(
                    margin: EdgeInsets.all(theight * 0.01),
                    padding: EdgeInsets.fromLTRB(theight * 0.02,
                        theight * 0.02, theight * 0.02, theight*0.01),
                    height: theight * 0.55,
                    width: twidth * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(theight * 0.01))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sign up to join",
                        style: GoogleFonts.montserrat(
                          fontSize: theight * 0.02,
                          color: Color(0xffbd7c1e),
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height: theight*0.01,),
                        TextFormField(
                          controller: name,
                          enabled: true,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                              hintStyle: TextStyle(fontFamily: "Montserrat")
                          ),
                        ),
                        TextFormField(
                          controller: mobileno,
                          enabled: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 10,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(fontFamily: "Montserrat"),
                            counterText: "",
                          ),
                        ),
                        Form(
                          key: form,
                          child: TextFormField(
                            onChanged: (value) {
                              form.currentState!.validate();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter mail ID";
                              } else {
                                result = validatemail(value);
                                if (result) {
                                  return null;
                                } else {
                                  return "";
                                }
                              }
                            },
                            controller: mail,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email Address",
                                hintStyle: TextStyle(fontFamily: "Montserrat")
                            ),
                          ),
                        ),
                        TextFormField(
                          onTap: () {
                            print("ttttttttttt");
                          },
                          controller: password,
                          textInputAction: TextInputAction.done,
                          obscureText: show,
                          decoration: InputDecoration(
                            hintText: "Password",
                              hintStyle: TextStyle(fontFamily: "Montserrat"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  print("showwwwwwwwwww");
                                  setState(() {
                                    showw();
                                  });
                                },
                                icon: Icon(show
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(height: theight*0.01,),
                        GestureDetector(
                          onTap: () async {
                                Registerpage();
                          },
                          child: Container(
                            width: twidth*0.30,
                            height: theight*0.06,
                            // margin: EdgeInsets.only(right:theight*0.04),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(theight*0.01)),
                                border: Border.all(color: Colors.black),
                                // color: Colors.white
                              // color: Color(0xffda9e41)
                            ),
                            child: Center(
                              child: Text("Register",
                                  style: GoogleFonts.montserrat(
                                    fontSize: theight * 0.02,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            fontSize: theight * 0.02,
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: theight * 0.07,
                                width: twidth * 0.32,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.grey),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(theight * 0.01))),
                                child: Image.asset(
                                  "images/fb.png",
                                  width: twidth * 0.01,
                                )),
                            Container(
                                height: theight * 0.07,
                                width: twidth * 0.32,
                                padding: EdgeInsets.all(theight * 0.01),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.grey),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(theight * 0.01))),
                                child: Image.asset(
                                  "images/google.png",
                                )),
                          ],
                        ),

                      ],
                    ),
                  ),

                  ],
                ),
              ]),
        ),
      ),
    );
  }

  TextEditingController mobileno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();

  bool show = true;
  bool result=true;
  String otp = '';
  final form = GlobalKey<FormState>();
  String p1 = '''Email should contain Capital,small letter & Number &
@ Must be & Special Character''';
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  double mailstrength = 0;

  bool validatemail(String mail) {
    String Email = mail.trim();

    if (Email.isEmpty) {
      mailstrength = 0;
    } else if (Email.length < 6) {
      mailstrength = 1 / 4;
    } else if (Email.length < 8) {
      mailstrength = 2 / 4;
    } else {
      if (emailValid.hasMatch(Email)) {
        mailstrength = 4 / 4;
        return true;
      } else {
        mailstrength = 3 / 4;
        return false;
      }
    }
    return false;
  }

  showw() {
    if (show == true) {
      setState(() {
        show = false;
      });
    } else {
      setState(() {
        show = true;
      });
    }
  }

  Future<void> Registerpage() async {

    if (name.text.isEmpty) {
      AppConstant.showsnackbar(context, "Please Enter Name");
    }
    else if (mobileno.text.length !=10) {
      AppConstant.showsnackbar(context, "Please Enter 10 Digit Mobile Number");
    }
    else if (mail.text.isEmpty) {
      AppConstant.showsnackbar(context, "Please Enter Email");
    }
    else if (result==false) {
      AppConstant.showsnackbar(context, "Email should contain Capital,small letter & Number & @ Must be & Special Character");
    }
    else if (password.text.isEmpty) {
      AppConstant.showsnackbar(context, "Please Enter Mobile Number");
    }
    else {

      EasyLoading.show(status: "loading...").whenComplete(() async {
      print("registerrrrr");
      String mobile1 = mobileno.text;
      String name1 = name.text;
      String password1 = password.text;
      String mail1 = mail.text;

        var url = Uri.parse(
            'http://sms.unitechitsolution.in:6005/api/v2/SendSMS?SenderId=UNITCH&Is_Unicode=false&Is_Flash=false&Message=Dear user $otp is your Unitech IT Solution verification code, thank you for registration.&MobileNumbers=91${mobile1}&ApiKey=AI2aF6zxu1Mtv0NcUYKzkNxa+Sb86MmfiLXLObO0mDQ=&ClientId=85d288ac-b598-4627-a46e-0696f0446bcd');
        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        var val=jsonDecode(response.body);
        if (response.statusCode==200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return mobile(name1, password1,mail1,otp,mobile1);},));}

        EasyLoading.dismiss();
      });
    }
  }
}



