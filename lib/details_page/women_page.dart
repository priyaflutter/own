import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/provider/wash_fold_provider.dart';

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
      Provider.of<wash_fold_provi>(context, listen: false).getproduct(context);
      setConnectionCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double thight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Consumer<wash_fold_provi>(builder: (context,Wash_foldd, child) {
      return internet_status?
              Wash_foldd.status?
              GridView.builder(
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.all(thight * 0.01),
        itemCount:Wash_foldd.wash!.getCategory!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                bottomsheet(thight, twidth, index,AppConstant.count,Wash_foldd);
              },
              child:Wash_foldd.wash!.getCategory![index].serviceId
                  .toString() == "2"?Container(
                height: thight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: thight*0.15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${AppConstant.CATOGARYURL}${Wash_foldd.wash!.getCategory![index].image.toString()}",),fit: BoxFit.fill)),
                    ),
                    Text(
                        Wash_foldd
                            .wash!.getCategory![index].name
                            .toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "₹${ Wash_foldd
                                .wash!.getCategory![index].price
                                .toString()}",
                            style: const TextStyle(
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
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          RemoveProduct(index);
                                        },
                                        child:  Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${AppConstant.count[index].toString()}",
                                        style: TextStyle(
                                            fontSize: thight * 0.02),
                                      ),
                                    ]),
                              )
                                  : null),
                          GestureDetector(
                              onTap: () {
                                print("ontapppp");
                                AddProduct(index);
                              },
                              child: const Visibility(
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
              ):null
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
      ) :Center(child: CircularProgressIndicator())
          :NoInternetOrDataScreen(isNoInternet: true);
    },) ;
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

  void bottomsheet(double thight, double twidth, int index, List<int> count, wash_fold_provi wash_foldd, ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(thight * 0.02),
            topRight: Radius.circular(thight * 0.02)),
      ),
      context: context,
      builder: (context) {
        return Container(
            height: thight * 0.80,
            width: twidth,
            padding: EdgeInsets.all(thight * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: thight * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("${AppConstant.CATOGARYURL}${wash_foldd.wash!.getCategory![index].image.toString()}"))),
                ),
                Center(
                  child: Text("${wash_foldd.wash!.getCategory![index].name.toString()}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: thight * 0.03,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Row(
                  children: [
                    Text("Price: ",
                        style: GoogleFonts.montserrat(
                            fontSize: thight * 0.02,
                            fontWeight: FontWeight.bold)),
                    Text("₹${wash_foldd.wash!.getCategory![index].price.toString()}/-",
                        style: GoogleFonts.montserrat(
                            fontSize: thight * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("bottom sheet::::::");
                        setState(() {
                          AddProduct(index);
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: Visibility(
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("bottom sheet::::::");
                        setState(() {
                          RemoveProduct(index);
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Visibility(
                          visible: true,
                          child: Text("${count[index].toString()}",
                              style: GoogleFonts.montserrat(
                                  fontSize: thight * 0.02,
                                  fontWeight: FontWeight.bold,color: Colors.red)),
                        )),
                  ],
                ),
                Text("Description",
                    style: GoogleFonts.montserrat(
                        fontSize: thight * 0.02, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: thight * 0.01,
                ),
                Text(
                    "Fabric:100% Cotton,Sleeves:Long Sleeves,Pattern:Printed,Color:White,Collar:Regular Collar,FIT:Slim,Material:100% COTTON,Washcare:Regular Machine Wash",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    )),
              ],
            ));
      },
    );
  }
}