import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/Registerpage.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:skedulrs/main.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController mobileno = TextEditingController();
  TextEditingController password = TextEditingController();

  bool show = true;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: theight,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage("images/bgnew.png"),
          //   ),
          // ),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: theight * 0.40,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: theight * 0.02, top: theight * 0.05),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/bk_sign_in.jpg"),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          Text(
                            "Welcome Back User",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              fontSize: theight * 0.04,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("images/bgnew.png"),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(bottom: theight * 0.07),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/bgnew.png"),
                                  fit: BoxFit.cover
                              )),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: GoogleFonts.montserrat(
                                  fontSize: theight * 0.02,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("registere");
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return register();
                                    },
                                  ));
                                },
                                child: Text(
                                    " Register",
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
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: EdgeInsets.all(theight * 0.01),
                      padding: EdgeInsets.fromLTRB(
                          theight * 0.02, theight * 0.02, theight * 0.02, 0),
                      height: theight * 0.50,
                      width: twidth * 0.80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(theight * 0.01))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Sign in to procced",
                            style: GoogleFonts.montserrat(
                              fontSize: theight * 0.02,
                              color: Color(0xffbd7c1e),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: theight * 0.01,
                          ),
                          TextFormField(
                            // onTap: () {
                            //   print("mobi;eeeeeeee");
                            // },
                            controller: mobileno,
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 10,
                            decoration: const InputDecoration(
                                counterText: "",
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(fontFamily: "Montserrat")
                            ),
                          ),
                          SizedBox(
                            height: theight * 0.01,
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey)
                              ),
                            ],
                          ),
                          SizedBox(
                            height: theight * 0.01,
                          ),
                          GestureDetector(
                            onTap: () async {
                              print("aaaaaaaaaaaaaa");

                              logindata();
                            },
                            child: Container(
                              width: twidth * 0.30,
                              height: theight * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(theight * 0.01)),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Text("Login",
                                    style: GoogleFonts.montserrat(
                                      fontSize: theight * 0.02,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                            ),
                          ),
                          Text("or"),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: theight * 0.07,
                                  width: twidth * 0.32,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
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
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(theight * 0.01))),
                                  child: Image.asset(
                                    "images/google.png",
                                  )),
                            ],
                          ),
                          // SizedBox(height: theight*0.05,),
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

  void logindata() {
    if (mobileno.text.isEmpty) {
      AppConstant.showsnackbar(context, "Please Enter Mobile Number");
    } else if (mobileno.text.length != 10) {
      AppConstant.showsnackbar(context, "Please Enter Vaild Mobile Number");
    } else if (password.text.isEmpty) {
      AppConstant.showsnackbar(context, "Please Enter Password");
    } else {
       
        EasyLoading.show(status: "loading...").whenComplete(() async {
          var url = Uri.parse(
              '${AppConstant.BASEURL}api_mrbubble.php?request_for=login&mo_no=${mobileno.text}&password=${password.text}');
          var response = await http.get(url);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
          var Login = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (Login["success"] == 1) {

              AppConstant.gettost("LogIn Sucessfully");

              Future.delayed(Duration(seconds: 2))
                  .then((value) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return home();
                  },
                ));
              });
            } else {

              AppConstant.gettost("Invaild Mobile.No & Password");
            }
          }
          else {
              AppConstant.showsnackbar(context, "Server Connect lost");
          }

          splash.pref!.setBool("loginstatus", true);
          EasyLoading.dismiss();
      });
    }
  }
}