// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:skedulrs/Screen/internet_connectivity.dart';
// import 'package:skedulrs/Variable_Name/app_constant.dart';
// import 'package:skedulrs/details_page/checkout.dart';
// import 'package:skedulrs/provider/wash_fold_provider.dart';
//
// class household extends StatefulWidget {
//   const household({Key? key}) : super(key: key);
//
//   @override
//   State<household> createState() => _householdState();
// }
//
// class _householdState extends State<household> {
//   bool internet_status = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//       Provider.of<wash_fold_provi>(context, listen: false).getproduct(context);
//       setConnectionCheck(context);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double thight = MediaQuery.of(context).size.height;
//     double twidth = MediaQuery.of(context).size.width;
//
//     return internet_status
//         ? Consumer<wash_fold_provi>(
//             builder: (context, Wash_Fold, child) {
//               return Stack(alignment: Alignment.bottomCenter,
//                 children: [ Column(
//                   children: [
//                     GridView.builder(
//                       primary: true,
//                       shrinkWrap: true,
//                       padding: EdgeInsets.all(thight * 0.01),
//                       itemCount:AppConstant.housetitle.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                             onTap: () {
//                               bottomsheet(thight, twidth, index, AppConstant.housetitle, AppConstant.houseimage, AppConstant.housers, AppConstant.count);
//                             },
//                             child:Container(
//                               height: thight * 0.25,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(AppConstant.houseimage[index]),
//                                     // child:Image.network("${AppConstant.CATOGARYURL}${Wash_Fold.wash!.getCategory![index].image.toString()}",height: thight*0.10,)
//                                   ),
//                                   Text(
//                                       AppConstant.housetitle[index],
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold)),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(horizontal: 4),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           "₹${AppConstant.housers[index]}",
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18),
//                                         ),
//                                         Spacer(
//                                           flex: 1,
//                                         ),
//                                         Center(
//                                             child: AppConstant.status_cart[index]
//                                                 ? AnimatedContainer(
//                                               duration:
//                                               Duration(seconds: 1),
//                                               child: Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceEvenly,
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () {
//                                                         RemoveProduct(
//                                                             index);
//                                                       },
//                                                       child: const Icon(
//                                                         Icons
//                                                             .remove_circle_outline,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                     Text(
//                                                       "${AppConstant.count[index].toString()}",
//                                                       style: TextStyle(
//                                                           fontSize: thight *
//                                                               0.02),
//                                                     ),
//                                                   ]),
//                                             )
//                                                 : null),
//                                         GestureDetector(
//                                             onTap: () {
//                                               print("ontapppp");
//                                               AddProduct(index);
//                                             },
//                                             child: Visibility(
//                                               child: Icon(
//                                                 Icons.add_circle_outline_outlined,
//                                                 color: Colors.black,
//                                               ),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                         );
//                       },
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           childAspectRatio: 2 / 3,
//                           mainAxisSpacing: 5,
//                           crossAxisSpacing: 5),
//                     ),
//                   ],
//                 ),Column(
//                   children: [
//                     GridView.builder(
//                       primary: true,
//                       shrinkWrap: true,
//                       padding: EdgeInsets.all(thight * 0.01),
//                       itemCount: AppConstant.womentitle.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             bottomsheet(thight, twidth, index, AppConstant.womentitle,
//                                 AppConstant.womenimage, AppConstant.womenrs, AppConstant.count);
//                           },
//                           child: Container(
//                             height: thight * 0.25,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       AppConstant.womenimage[index],
//                                       style: TextStyle(fontSize: thight * 0.12),
//                                     )),
//                                 Text(AppConstant.womentitle[index],
//                                     style: GoogleFonts.montserrat(
//                                         fontSize: thight * 0.02, fontWeight: FontWeight.bold)),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 4),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text(
//                                         "₹${AppConstant.womenrs[index]}",
//                                         style: TextStyle(
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                       Spacer(
//                                         flex: 1,
//                                       ),
//                                       Center(
//                                           child: AppConstant.status_cart[index]
//                                               ? AnimatedContainer(
//                                             duration: Duration(seconds: 1),
//                                             child: Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       RemoveProduct(index);
//                                                     },
//                                                     child: Icon(
//                                                       Icons.remove_circle_outline,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     "${AppConstant.count[index].toString()}",
//                                                     style: TextStyle(
//                                                         fontSize: thight * 0.02),
//                                                   ),
//                                                 ]),
//                                           )
//                                               : null),
//                                       GestureDetector(
//                                           onTap: () {
//                                             print("ontapppp");
//                                             AddProduct(index);
//                                           },
//                                           child: Visibility(
//                                             child: Icon(
//                                               Icons.add_circle_outline_outlined,
//                                               color: Colors.black,
//                                             ),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           childAspectRatio: 2 / 3,
//                           mainAxisSpacing: 5,
//                           crossAxisSpacing: 5),
//                     ),
//                   ],
//                 ), GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return checkout1();
//                       },
//                     ));
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: thight * 0.07,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(color: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               child: Icon(Icons.shopping_cart, color: Colors.white),
//                             ),
//                             Positioned(
//                               top: 1,
//                               right: -1,
//                               child: Container(
//                                 width: twidth * 0.05,
//                                 child: Center(
//                                     child: Text(
//                                       "1",
//                                     )),
//                                 decoration: BoxDecoration(
//                                     color: Colors.red, shape: BoxShape.circle),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: twidth * 0.03,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text("₹ 10.00",
//                                 style: GoogleFonts.montserrat(color: Colors.white)),
//                             Text(" 1 Garments",
//                                 style: GoogleFonts.montserrat(color: Colors.white)),
//                           ],
//                         ),
//                         Spacer(),
//                         Text("CHECKOUT",
//                             style: GoogleFonts.montserrat(
//                                 fontSize: thight * 0.02,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                       ],
//                     ),
//                   ),
//                 )],
//               );
//
//             },
//           )
//         : NoInternetOrDataScreen(isNoInternet: true);
//   }
//
//   void AddProduct(int index) {
//     setState(() {
//       if (AppConstant.status_cart[index] == false) {
//         AppConstant.status_cart[index] = true;
//       }
//       AppConstant.count[index] = AppConstant.count[index] + 1;
//     });
//     print(AppConstant.count[index]);
//   }
//
//   void RemoveProduct(int index) {
//     setState(() {
//       if (AppConstant.count[index] == 1) {
//         AppConstant.status_cart[index] = false;
//         AppConstant.count[index] = 0;
//       }
//       else if(AppConstant.count[index]==0)
//         {
//           AppConstant.count[index] = 0;
//         }
//       else {
//         AppConstant.count[index] = AppConstant.count[index] - 1;
//       }
//     });
//   }
//
//   Future<void> setConnectionCheck(BuildContext context) async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       setState(() {
//         internet_status = true;
//       });
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       setState(() {
//         internet_status = true;
//       });
//     } else {
//       setState(() {
//         internet_status = false;
//       });
//     }
//   }
//
//   void bottomsheet(double thight, double twidth, int index, List<String> title,
//       List<String> image, List<String> rs, List<int> count) {
//     showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(thight * 0.02),
//             topRight: Radius.circular(thight * 0.02)),
//       ),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState1) {
//             return Container(
//                 height: thight * 0.80,
//                 width: twidth,
//                 child: Stack( alignment: Alignment.bottomCenter,
//                   children: [
//                     ListView(
//                       children: [
//                         Container(
//                           height: thight * 0.20,
//                           margin: EdgeInsets.symmetric(vertical: thight * 0.01),
//                           decoration: BoxDecoration(
//                             // border: Border.all(width: 1),
//                               image: DecorationImage(image: AssetImage(image[index]))),
//                         ),
//                         Center(
//                           child: Text("${title[index]}",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.montserrat(
//                                 fontSize: thight * 0.03,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: thight * 0.01),
//                           child: Row(
//                             children: [
//                               Text("Price: ",
//                                   style: GoogleFonts.montserrat(
//                                       fontSize: thight * 0.02,
//                                       fontWeight: FontWeight.bold)),
//                               Text("₹${rs[index]}/-",
//                                   style: GoogleFonts.montserrat(
//                                       fontSize: thight * 0.02,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green)),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   print("bottom sheet::::::");
//                                   setState(() {
//                                     setState1(() {
//                                       RemoveProduct(index);
//                                     });
//                                   });
//                                 },
//                                 child: Container(
//                                     alignment: Alignment.center,
//                                     margin: EdgeInsets.all(10),
//                                     width: twidth * 0.10,
//                                     height: thight * 0.05,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(width: 1),
//                                         color: Colors.grey.shade300,
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(5))),
//                                     child: Visibility(
//                                       child: Icon(
//                                         Icons.remove,
//                                         color: Colors.black,
//                                       ),
//                                     )),
//                               ),
//                               Container(
//                                   alignment: Alignment.center,
//                                   margin: EdgeInsets.all(10),
//                                   width: twidth * 0.10,
//                                   height: thight * 0.05,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(width: 1),
//
//                                       borderRadius: BorderRadius.all(Radius.circular(5))),
//                                   child: Visibility(
//                                     visible: true,
//                                     child: Text("${count[index].toString()}",
//                                         style: GoogleFonts.montserrat(
//                                             fontSize: thight * 0.02,
//                                             fontWeight: FontWeight.bold,color: Colors.red)),
//                                   )),
//                               GestureDetector(
//                                 onTap: () {
//                                   print("bottom sheet::::::");
//                                   setState(() {
//                                     setState1(() {
//                                       AddProduct(index);
//                                     });
//                                   });
//                                 },
//                                 child: Container(
//                                     alignment: Alignment.center,
//                                     margin: EdgeInsets.all(10),
//                                     width: twidth * 0.10,
//                                     height: thight * 0.05,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(width: 1),
//                                         color: Colors.grey.shade300,
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(5))),
//                                     child: Visibility(
//                                       child: Icon(
//                                         Icons.add,
//                                         color: Colors.black,
//                                       ),
//                                     )),
//                               ),
//
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: thight * 0.01),
//                           child: Text("Description",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: thight * 0.02, fontWeight: FontWeight.bold)),
//                         ),
//                         SizedBox(height: thight*0.01,),
//                         Padding(
//                           padding:EdgeInsets.symmetric(horizontal: thight * 0.01),
//                           child: Text(
//                               "Fabric:100% Cotton,Sleeves:Long Sleeves,Pattern:Printed,Color:White,Collar:Regular Collar,FIT:Slim,Material:100% COTTON,Washcare:Regular Machine Wash",
//                               textAlign: TextAlign.justify,
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 15,
//                               )),
//                         ),
//
//                       ],
//                     ),GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return checkout1();
//                           },
//                         ));
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: thight * 0.07,
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         width: double.infinity,
//                         decoration: BoxDecoration(color: Colors.black),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Stack(
//                               alignment: Alignment.topRight,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Icon(Icons.shopping_cart, color: Colors.white),
//                                 ),
//                                 Positioned(
//                                   top: 1,
//                                   right: -1,
//                                   child: Container(
//                                     width: twidth * 0.05,
//                                     child: Center(
//                                         child: Text(
//                                           "1",
//                                         )),
//                                     decoration: BoxDecoration(
//                                         color: Colors.red, shape: BoxShape.circle),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: twidth * 0.03,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text("₹ 10.00",
//                                     style: GoogleFonts.montserrat(color: Colors.white)),
//                                 Text(" 1 Garments",
//                                     style: GoogleFonts.montserrat(color: Colors.white)),
//                               ],
//                             ),
//                             Spacer(),
//                             Text("CHECKOUT",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: thight * 0.02,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white)),
//                           ],
//                         ),
//                       ),
//                     )],
//                 ));
//           },
//         );
//       },
//     );
//   }
//
//   int count1 = 0;
// }
