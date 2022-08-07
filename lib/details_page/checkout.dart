import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/details_page/booking.dart';

class checkout1 extends StatefulWidget {
  const checkout1({Key? key}) : super(key: key);

  @override
  State<checkout1> createState() => _checkout1State();
}

class _checkout1State extends State<checkout1> {

  // late Razorpay _razorpay;
  String img="images/shirt.png";
  String price="10";
  String qty="1";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _razorpay = Razorpay();
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  //
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("My Cart"),
      ),
      body: Stack(alignment: Alignment.bottomCenter,
        children: [
          Column(
          children: [
            Container(
              height: theight*0.14,
              padding: EdgeInsets.symmetric(horizontal: theight*0.01),
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Row(
                children: [
                  Text("👚",
                      style: GoogleFonts.montserrat(
                        fontSize:theight*0.08,
                        fontWeight: FontWeight.w700,
                      )),
                  Container( height: theight*0.08,
                    child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("socks-Steam Iron",
                            style: GoogleFonts.montserrat(
                              fontSize:13,
                              fontWeight: FontWeight.w700,
                            )),
                        Text("per piece",
                            style: GoogleFonts.montserrat(
                              fontSize:13,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey
                            )),
                        Text("₹ ${price}",
                            style: GoogleFonts.montserrat(
                              fontSize:13,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey
                            )),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                     Icon(Icons.delete),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.remove_circle_outline),
                          Text("${qty}",
                              style: GoogleFonts.montserrat(
                                fontSize:13,
                                fontWeight: FontWeight.w700,
                              )),
                          Icon(Icons.add_circle_outline_outlined)
                        ],
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
          Container(alignment: Alignment.center,
            height: theight * 0.07,
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:Icon(Icons.shopping_cart, color: Colors.white),
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
                        decoration:
                        BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: twidth*0.03,),
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("₹ ${price}",
                        style: GoogleFonts.montserrat(
                            color: Colors.white
                        )),
                    Text(" ${qty} Garments",
                        style: GoogleFonts.montserrat(
                            color: Colors.white
                        )),
                  ],),
                Spacer(),
                GestureDetector(onTap:() {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return booking();
                  },));
                },
                  child: Container( alignment: Alignment.center,
                  height: theight*0.05,
                    padding: EdgeInsets.symmetric(horizontal: theight*0.01),
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text("Proceed",
                        style: GoogleFonts.montserrat(
                            fontSize: theight * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // void dispose() {
  //   super.dispose();
  //   _razorpay.clear();
  // }

  // void openCheckout() async {
  //   var options = {
  //     'key': 'rzp_test_Kg84my9pEQ1MGW',
  //     'amount':100*int.parse(price),
  //     // 'name': widget.productname,
  //     // 'description': 'Fine T-Shirt',
  //     'retry': {'enabled': true, 'max_count': 1},
  //     'send_sms_hash': true,
  //     'prefill': {'contact': '9999999999', 'email': 'Unitechitsolution@gmail.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };
  //
  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     debugPrint('Error: e');
  //   }
  // }
  //
  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   print('Success Response: $response');
  //   AppConstant.gettost("SUCCESS: " + response.paymentId!);
  //   // Fluttertoast.showToast(
  //   //     msg: "SUCCESS: " + response.paymentId!,
  //   //     toastLength: Toast.LENGTH_SHORT);
  // }
  //
  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print('Error Response: $response');
  //   AppConstant.gettost( "ERROR: " + response.code.toString() + " - " + response.message!);
  //
  //   // Fluttertoast.showToast(
  //   //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
  //   //     toastLength: Toast.LENGTH_SHORT);
  // }
  //
  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   print('External SDK Response: $response');
  //   AppConstant.gettost( "EXTERNAL_WALLET: " + response.walletName!,);
  //
  //   // Fluttertoast.showToast(
  //   //     msg: "EXTERNAL_WALLET: " + response.walletName!,
  //   //     toastLength: Toast.LENGTH_SHORT);
  // }
  //
  // Future<bool> onback() {
  //
  //   Navigator.pop(context);
  //   return Future.value(true);
  // }
}
