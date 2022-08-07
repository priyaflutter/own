import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/details_page/checkout.dart';


class clinning extends StatefulWidget {
  const clinning({Key? key}) : super(key: key);

  @override
  State<clinning> createState() => _clinningState();
}

class _clinningState extends State<clinning> {

  TextEditingController searchname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppConstant.issearch
          ? AppBar(
              backgroundColor: Colors.black,
              title: TextField(
                controller: searchname,
                enabled: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search here",
                  border: InputBorder.none,
                ),
                onChanged: (value) {},
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        AppConstant.issearch = false;
                      });
                    },
                    icon: Icon(Icons.close))
              ],
            )
          : AppBar(
              actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          AppConstant.issearch = true;
                        });
                      },
                      icon: Icon(Icons.search))
                ],
              backgroundColor: Colors.black,
              title:Text("Wash Iron", style: TextStyle(color: Colors.white))
                  ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: theight * 0.05,
              decoration: BoxDecoration(color: Colors.grey),
              width: double.infinity,
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  tabs: <Widget>[
                    Tab(
                      icon: Row(
                        children: [
                          Image.asset(
                            "images/man.png",
                            width: twidth * 0.06,
                          ),
                          Text(
                            "FOR MEN",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        children: [
                          Image.asset("images/woman.png", width: twidth * 0.06),
                          Text(
                            "FOR WOMEN",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        children: [
                          Image.asset("images/Household.png",
                              width: twidth * 0.06),
                          Text(
                            " HOUSEHOLD",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            Expanded(
                flex: 3,
                child: TabBarView(
                    children: <Widget>[men1(), women(), household()])),
          ],
        ),
        // TabBarView(children: <Widget>[newplan(), complete()])
      ),
    );
  }

  int selectedPage1 = 0;
  List<Widget> cliningpageoption = [
    men1(),
    women(),
    household(),
  ];
}

class men1 extends StatefulWidget {
  const men1({Key? key}) : super(key: key);

  @override
  State<men1> createState() => _men1State();
}

class _men1State extends State<men1> {
  bool internet_status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setConnectionCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double thight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return internet_status
        ? Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                children: [
                  GridView.builder(
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(thight * 0.01),
                    itemCount: AppConstant.title.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bottomsheet(
                              thight,
                              twidth,
                              index,
                              AppConstant.title,
                              AppConstant.image,
                              AppConstant.rs,
                              AppConstant.count);
                        },
                        child: Container(
                          height: thight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppConstant.image[index],
                                  width: twidth * 0.25,
                                ),
                              ),
                              Text(AppConstant.title[index],
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "₹${AppConstant.rs[index]}",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Center(
                                        child: AppConstant.status_cart[index]
                                            ? AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          RemoveProduct(index);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstant.count[index].toString()}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                thight * 0.02),
                                                      ),
                                                    ]),
                                              )
                                            : null),
                                    GestureDetector(
                                        onTap: () {
                                          print("ontapppp");
                                          AddProduct(index);
                                        },
                                        child: Visibility(
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return checkout1();
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: thight * 0.07,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child:
                                Icon(Icons.shopping_cart, color: Colors.white),
                          ),
                          Positioned(
                            top: 1,
                            right: -1,
                            child: Container(
                              width: twidth * 0.05,
                              child: Center(
                                  child: Text(
                                "1",
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: twidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("₹ 10.00",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                          Text(" 1 Garments",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      Text("CHECKOUT",
                          style: GoogleFonts.montserrat(
                              fontSize: thight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          )
        : NoInternetOrDataScreen(isNoInternet: true);
  }

    void AddProduct(int index) {
      setState(() {
        if (AppConstant.status_cart[index] == false) {
          AppConstant.status_cart[index] = true;
        }
        AppConstant.count[index] = AppConstant.count[index] + 1;
      });
      print(AppConstant.count[index]);
    }

    void RemoveProduct(int index) {
      setState(() {
        if (AppConstant.count[index] == 1) {
          AppConstant.status_cart[index] = false;
          AppConstant.count[index] = 0;
        } else if (AppConstant.count[index] == 0) {
          AppConstant.count[index] = 0;
        } else {
          AppConstant.count[index] = AppConstant.count[index] - 1;
        }
      });
    }

    void bottomsheet(double thight, double twidth, int index, List<String> title,
        List<String> image, List<String> rs, List<int> count) {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(thight * 0.02),
              topRight: Radius.circular(thight * 0.02)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                  height: thight * 0.80,
                  width: twidth,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: thight * 0.20,
                            margin: EdgeInsets.symmetric(vertical: thight * 0.01),
                            decoration: BoxDecoration(
                                // border: Border.all(width: 1),
                                image: DecorationImage(
                                    image: AssetImage(image[index]))),
                          ),
                          Center(
                            child: Text("${title[index]}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: thight * 0.03,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: thight * 0.01),
                            child: Row(
                              children: [
                                Text("Price: ",
                                    style: GoogleFonts.montserrat(
                                        fontSize: thight * 0.02,
                                        fontWeight: FontWeight.bold)),
                                Text("₹${rs[index]}/-",
                                    style: GoogleFonts.montserrat(
                                        fontSize: thight * 0.02,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    print("bottom sheet::::::");
                                    setState(() {
                                      setState1(() {
                                        RemoveProduct(index);
                                      });
                                    });
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(10),
                                      width: twidth * 0.10,
                                      height: thight * 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Visibility(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      )),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    width: twidth * 0.10,
                                    height: thight * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                    child: Visibility(
                                      visible: true,
                                      child: Text("${count[index].toString()}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: thight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    print("bottom sheet::::::");
                                    setState(() {
                                      setState1(() {
                                        AddProduct(index);
                                      });
                                    });
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(10),
                                      width: twidth * 0.10,
                                      height: thight * 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Visibility(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: thight * 0.01),
                            child: Text("Description",
                                style: GoogleFonts.montserrat(
                                    fontSize: thight * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: thight * 0.01,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: thight * 0.01),
                            child: Text(
                                "Fabric:100% Cotton,Sleeves:Long Sleeves,Pattern:Printed,Color:White,Collar:Regular Collar,FIT:Slim,Material:100% COTTON,Washcare:Regular Machine Wash",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                )),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return checkout1();
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: thight * 0.07,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.shopping_cart,
                                        color: Colors.white),
                                  ),
                                  Positioned(
                                    top: 1,
                                    right: -1,
                                    child: Container(
                                      width: twidth * 0.05,
                                      child: Center(
                                          child: Text(
                                        "1",
                                      )),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: twidth * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("₹ 10.00",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white)),
                                  Text(" 1 Garments",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white)),
                                ],
                              ),
                              Spacer(),
                              Text("CHECKOUT",
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            },
          );
        },
      );
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

class women extends StatefulWidget {
  const women({Key? key}) : super(key: key);

  @override
  State<women> createState() => _womenState();
}

class _womenState extends State<women> {
  bool internet_status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setConnectionCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double thight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return internet_status
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  GridView.builder(
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(thight * 0.01),
                    itemCount: AppConstant.womentitle.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bottomsheet(
                              thight,
                              twidth,
                              index,
                              AppConstant.womentitle,
                              AppConstant.womenimage,
                              AppConstant.womenrs,
                              AppConstant.count);
                        },
                        child: Container(
                          height: thight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppConstant.womenimage[index],
                                    style: TextStyle(fontSize: thight * 0.12),
                                  )),
                              Text(AppConstant.womentitle[index],
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "₹${AppConstant.womenrs[index]}",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Center(
                                        child: AppConstant.status_cart[index]
                                            ? AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          RemoveProduct(index);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstant.count[index].toString()}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                thight * 0.02),
                                                      ),
                                                    ]),
                                              )
                                            : null),
                                    GestureDetector(
                                        onTap: () {
                                          print("ontapppp");
                                          AddProduct(index);
                                        },
                                        child: Visibility(
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return checkout1();
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: thight * 0.07,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child:
                                Icon(Icons.shopping_cart, color: Colors.white),
                          ),
                          Positioned(
                            top: 1,
                            right: -1,
                            child: Container(
                              width: twidth * 0.05,
                              child: Center(
                                  child: Text(
                                "1",
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: twidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("₹ 10.00",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                          Text(" 1 Garments",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      Text("CHECKOUT",
                          style: GoogleFonts.montserrat(
                              fontSize: thight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          )
        : NoInternetOrDataScreen(isNoInternet: true);
  }

  void AddProduct(int index) {
    setState(() {
      if (AppConstant.status_cart[index] == false) {
        AppConstant.status_cart[index] = true;
      }
      AppConstant.count[index] = AppConstant.count[index] + 1;
    });
    print(AppConstant.count[index]);
  }

  void RemoveProduct(int index) {
    setState(() {
      if (AppConstant.count[index] == 1) {
        AppConstant.status_cart[index] = false;
        AppConstant.count[index] = 0;
      } else if (AppConstant.count[index] == 0) {
        AppConstant.count[index] = 0;
      } else {
        AppConstant.count[index] = AppConstant.count[index] - 1;
      }
    });
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

  void bottomsheet(double thight, double twidth, int index, List<String> title,
      List<String> image, List<String> rs, List<int> count) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(thight * 0.02),
            topRight: Radius.circular(thight * 0.02)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return Container(
                height: thight * 0.80,
                width: twidth,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: thight * 0.01),
                          child: Center(
                            child: Text("${AppConstant.womenimage[index]}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: thight * 0.15,
                                )),
                          ),
                        ),
                        Center(
                          child: Text("${title[index]}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: thight * 0.03,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Row(
                            children: [
                              Text("Price: ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold)),
                              Text("₹${rs[index]}/-",
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  print("bottom sheet::::::");
                                  setState(() {
                                    setState1(() {
                                      RemoveProduct(index);
                                    });
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    width: twidth * 0.10,
                                    height: thight * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Visibility(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: twidth * 0.10,
                                  height: thight * 0.05,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Visibility(
                                    visible: true,
                                    child: Text("${count[index].toString()}",
                                        style: GoogleFonts.montserrat(
                                            fontSize: thight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  print("bottom sheet::::::");
                                  setState(() {
                                    setState1(() {
                                      AddProduct(index);
                                    });
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    width: twidth * 0.10,
                                    height: thight * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Visibility(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Text("Description",
                              style: GoogleFonts.montserrat(
                                  fontSize: thight * 0.02,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: thight * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Text(
                              "Fabric:100% Cotton,Sleeves:Long Sleeves,Pattern:Printed,Color:White,Collar:Regular Collar,FIT:Slim,Material:100% COTTON,Washcare:Regular Machine Wash",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                              )),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return checkout1();
                          },
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: thight * 0.07,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.shopping_cart,
                                      color: Colors.white),
                                ),
                                Positioned(
                                  top: 1,
                                  right: -1,
                                  child: Container(
                                    width: twidth * 0.05,
                                    child: Center(
                                        child: Text(
                                      "1",
                                    )),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: twidth * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("₹ 10.00",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white)),
                                Text(" 1 Garments",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white)),
                              ],
                            ),
                            Spacer(),
                            Text("CHECKOUT",
                                style: GoogleFonts.montserrat(
                                    fontSize: thight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}

class household extends StatefulWidget {
  const household({Key? key}) : super(key: key);

  @override
  State<household> createState() => _householdState();
}

class _householdState extends State<household> {
  bool internet_status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setConnectionCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double thight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return internet_status
        ? Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                children: [
                  GridView.builder(
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(thight * 0.01),
                    itemCount: AppConstant.housetitle.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bottomsheet(
                              thight,
                              twidth,
                              index,
                              AppConstant.houseimage,
                              AppConstant.housers,
                              AppConstant.housetitle,
                              AppConstant.count);
                        },
                        child: Container(
                          height: thight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppConstant.houseimage[index],
                                  width: twidth * 0.25,
                                ),
                              ),
                              Text(AppConstant.title[index],
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "₹${AppConstant.housers[index]}",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Center(
                                        child: AppConstant.status_cart[index]
                                            ? AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          RemoveProduct(index);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstant.count[index].toString()}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                thight * 0.02),
                                                      ),
                                                    ]),
                                              )
                                            : null),
                                    GestureDetector(
                                        onTap: () {
                                          print("ontapppp");
                                          AddProduct(index);
                                        },
                                        child: Visibility(
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return checkout1();
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: thight * 0.07,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child:
                                Icon(Icons.shopping_cart, color: Colors.white),
                          ),
                          Positioned(
                            top: 1,
                            right: -1,
                            child: Container(
                              width: twidth * 0.05,
                              child: Center(
                                  child: Text(
                                "1",
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: twidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("₹ 10.00",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                          Text(" 1 Garments",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      Text("CHECKOUT",
                          style: GoogleFonts.montserrat(
                              fontSize: thight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          )
        : NoInternetOrDataScreen(isNoInternet: true);
  }

  void AddProduct(int index) {
    setState(() {
      if (AppConstant.status_cart[index] == false) {
        AppConstant.status_cart[index] = true;
      }
      AppConstant.count[index] = AppConstant.count[index] + 1;
    });
    print(AppConstant.count[index]);
  }

  void RemoveProduct(int index) {
    setState(() {
      if (AppConstant.count[index] == 1) {
        AppConstant.status_cart[index] = false;
        AppConstant.count[index] = 0;
      } else if (AppConstant.count[index] == 0) {
        AppConstant.count[index] = 0;
      } else {
        AppConstant.count[index] = AppConstant.count[index] - 1;
      }
    });
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

  void bottomsheet(
      double thight,
      double twidth,
      int index,
      List<String> houseimage,
      List<String> housers,
      List<String> housetitle,
      List<int> count) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(thight * 0.02),
            topRight: Radius.circular(thight * 0.02)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return Container(
                height: thight * 0.80,
                width: twidth,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      children: [
                        Container(
                          height: thight * 0.20,
                          margin: EdgeInsets.symmetric(vertical: thight * 0.01),
                          decoration: BoxDecoration(
                              // border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: AssetImage(houseimage[index]))),
                        ),
                        Center(
                          child: Text("${housetitle[index]}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: thight * 0.03,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Row(
                            children: [
                              Text("Price: ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold)),
                              Text("₹${housers[index]}/-",
                                  style: GoogleFonts.montserrat(
                                      fontSize: thight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  print("bottom sheet::::::");
                                  setState(() {
                                    setState1(() {
                                      RemoveProduct(index);
                                    });
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    width: twidth * 0.10,
                                    height: thight * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Visibility(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: twidth * 0.10,
                                  height: thight * 0.05,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Visibility(
                                    visible: true,
                                    child: Text("${count[index].toString()}",
                                        style: GoogleFonts.montserrat(
                                            fontSize: thight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  print("bottom sheet::::::");
                                  setState(() {
                                    setState1(() {
                                      AddProduct(index);
                                    });
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    width: twidth * 0.10,
                                    height: thight * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Visibility(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Text("Description",
                              style: GoogleFonts.montserrat(
                                  fontSize: thight * 0.02,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: thight * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: thight * 0.01),
                          child: Text(
                              "Fabric:100% Cotton,Sleeves:Long Sleeves,Pattern:Printed,Color:White,Collar:Regular Collar,FIT:Slim,Material:100% COTTON,Washcare:Regular Machine Wash",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                              )),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return checkout1();
                          },
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: thight * 0.07,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.shopping_cart,
                                      color: Colors.white),
                                ),
                                Positioned(
                                  top: 1,
                                  right: -1,
                                  child: Container(
                                    width: twidth * 0.05,
                                    child: Center(
                                        child: Text(
                                      "1",
                                    )),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: twidth * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("₹ 10.00",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white)),
                                Text(" 1 Garments",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white)),
                              ],
                            ),
                            Spacer(),
                            Text("CHECKOUT",
                                style: GoogleFonts.montserrat(
                                    fontSize: thight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
        );
      },
    );
  }

  int count1 = 0;
}
