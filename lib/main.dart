import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Screen/login_page.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:skedulrs/provider/service_provider.dart';
import 'package:skedulrs/provider/wash_fold_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => wash_fold_provi(),),
       ChangeNotifierProvider(create: (context) => Service_pro(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myapp(),
      ),
    ),
  );
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

class splash extends StatefulWidget {
  static SharedPreferences? pref;

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool loginstatus = false;
  bool internet_status = true;
  final controller = PageController();
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setConnectionCheck(context);
    });
    Getvalue();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: internet_status
            ? SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: theight,
                  width: twidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/Android Large _luncher.png")
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: theight * 0.10,
                      ),
                      // Container(
                      //   height: theight * 0.30,
                      //   // width: double.infinity,
                      //   child: Center(
                      //       child: Image.asset(
                      //     "images/launcher_logo.png",
                      //     height: theight * 0.25,
                      //   )),
                      // ),
                      Spacer(),
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: theight * 0.05,
                      ),
                      Text(
                        "Please Wait...",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: theight*0.02),
                      ),
                      SizedBox(
                        height: theight * 0.10,
                      ),
                    ],
                  ),
                ),
              )
            : NoInternetOrDataScreen(isNoInternet: true));
  }

  Future<void> Getvalue() async {
    splash.pref = await SharedPreferences.getInstance();
    setState(() {
      loginstatus = splash.pref!.getBool("loginstatus") ?? false;
    });

    internet_status
        ? Future.delayed(Duration(seconds: 10)).then((value) {
            if (loginstatus) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  print("viewwww");
                  return home();
                },
              ));
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  print("loginnnnnnnn");
                  return login();
                },
              ));
            }
          })
        : NoInternetOrDataScreen(isNoInternet: true);
  }

  Future<void> setConnectionCheck(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        internet_status = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet_status = true;
      });
    } else {
      setState(() {
        internet_status = false;
      });
    }
  }
}

//TODO

class splashsecond extends StatefulWidget {
  const splashsecond({Key? key}) : super(key: key);

  @override
  State<splashsecond> createState() => _splashsecondState();
}

class _splashsecondState extends State<splashsecond> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: theight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/Android Large - 61.png"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: theight * 0.20,
            ),
            // Container(
            //   height: theight * 0.30,
            //   // width: double.infinity,
            //   child: Center(
            //       child: Image.asset(
            //     "images/launcher_logo.png",
            //     height: theight * 0.25,
            //   )),
            // ),
            Spacer(),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.yellow,
            ),
            SizedBox(
              height: theight * 0.05,
            ),
            Text(
              "Please Wait...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: theight * 0.10,
            ),
          ],
        ),
      ),
    );
  }
}
