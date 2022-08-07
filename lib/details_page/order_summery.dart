import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';

class order_summery extends StatefulWidget {
  const order_summery({Key? key}) : super(key: key);

  @override
  State<order_summery> createState() => _order_summeryState();
}

class _order_summeryState extends State<order_summery> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Order Summery",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack( alignment: Alignment.bottomCenter,
        children: [ListView(physics: AlwaysScrollableScrollPhysics(),
          children: [
            Row(children: [
              Expanded(flex: 3,
                child: Container(
                  // width: twidth*0.35,
                  margin: EdgeInsets.all(theight*0.01),
                  padding: EdgeInsets.symmetric(vertical: theight*0.03,horizontal: theight*0.01),
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Text("Pickup",
                          style: GoogleFonts.montserrat(
                              fontSize:15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Saturday,30 Jul 2022 08:00 AM - 10:00 AM",
                          maxLines: 2,
                          style: GoogleFonts.montserrat(
                              fontSize:10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                  width: twidth*0.13,
                  margin: EdgeInsets.symmetric(vertical: theight*0.01,horizontal: theight*0.02),
                  child:Image(image: AssetImage("images/next.png"))
              ),
              Expanded(flex: 3,
                child: Container(
                  margin: EdgeInsets.all(theight*0.01),
                  // width: twidth*0.35,
                  padding: EdgeInsets.symmetric(vertical: theight*0.03,horizontal: theight*0.01),
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Text("Pickup",
                          style: GoogleFonts.montserrat(
                              fontSize:15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Saturday,30 Jul 2022 08:00 AM - 10:00 AM",
                          maxLines: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],),
            Card(
              child: Container(
                padding: EdgeInsets.all(theight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text("Garment Details",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    SizedBox(
                      height: theight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Service",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          width: twidth * 0.01,
                        ),
                        Text("Qty",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Price",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: theight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Towel-Steam Iron",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹5 X 1",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹ 5",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tie-Wash & Iron       ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹3 X 1",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹ 3",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("T-shirt-Wash & Iron",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹2 X 1",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹ 2",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: theight*0.11,
                padding: EdgeInsets.all(theight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Icon(Icons.add,color: Colors.black,),
                      Text("Add more Garments",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],),
                    Row(children: [
                      Icon(Icons.add,color: Colors.black,),
                      Text("Add Special Instruction to Mr.Bubble",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(theight * 0.01),
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Have a Promocode?",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: theight*0.10,
                padding: EdgeInsets.all(theight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹ 10.00",
                            style: GoogleFonts.montserrat(
                              fontSize:12,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Service Charge[Plus Delivery]",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("₹4.00",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.green
                            )),
                        Text("₹ 14.00",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),

                      ],
                    ),

                  ],
                ),
              ),
            ),
            Container(child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container( alignment: Alignment.center,
                    padding: EdgeInsets.all(theight * 0.01),
                    width: twidth*0.45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1,color: Colors.black)),
                    child:Text("COD",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(alignment: Alignment.center,
                    padding: EdgeInsets.all(theight * 0.01),
                    width: twidth*0.45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1,color: Colors.black)),
                    child:Text("Online Payment",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ],
            ),),
            Card(
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: theight*0.01),
                  padding: EdgeInsets.symmetric(horizontal: theight*0.01),
                  height: theight * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(theight * 0.01))),
                  child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text("test | +91 9999999999",
                              style: GoogleFonts.montserrat(
                                  fontSize:12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home),
                          Text("Home",
                              style: GoogleFonts.montserrat(
                                  fontSize:12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ],
                      ),
                      Text("Home | c-9 Maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India",
                          maxLines: 3,style: GoogleFonts.montserrat(
                              fontSize:12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          )),
                      Text("Change",
                          maxLines: 3,style: GoogleFonts.montserrat(
                              fontSize:12,
                              decoration:TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: Colors.red
                          )),

                    ],)
              ),
            ),
          ],
        ),GestureDetector( onTap:openCheckout,
          child: Container(
            alignment: Alignment.center,
            height: theight * 0.07,
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff4c4a4a), Color(0xff1c1b1b)])),
            child:Text("CONFIRM ORDER",
                style: GoogleFonts.montserrat(
                    fontSize: theight * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        )],
      ),
    );
  }


late Razorpay _razorpay;
double total=14.00;
String price="14";
void dispose() {
  super.dispose();
  _razorpay.clear();
}

void openCheckout() async {
  var options = {
    'key': 'rzp_test_Kg84my9pEQ1MGW',
    'amount':100*int.parse(price),
    // 'name': widget.productname,
    // 'description': 'Fine T-Shirt',
    'retry': {'enabled': true, 'max_count': 1},
    'send_sms_hash': true,
    'prefill': {'contact': '9999999999', 'email': 'Unitechitsolution@gmail.com'},
    'external': {
      'wallets': ['paytm']
    }
  };

  try {
    _razorpay.open(options);
  } catch (e) {
    debugPrint('Error: e');
  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  print('Success Response: $response');
  AppConstant.gettost("SUCCESS: " + response.paymentId!);
  // Fluttertoast.showToast(
  //     msg: "SUCCESS: " + response.paymentId!,
  //     toastLength: Toast.LENGTH_SHORT);
}

void _handlePaymentError(PaymentFailureResponse response) {
  print('Error Response: $response');
  AppConstant.gettost( "ERROR: " + response.code.toString() + " - " + response.message!);

  // Fluttertoast.showToast(
  //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
  //     toastLength: Toast.LENGTH_SHORT);
}

void _handleExternalWallet(ExternalWalletResponse response) {
  print('External SDK Response: $response');
  AppConstant.gettost( "EXTERNAL_WALLET: " + response.walletName!,);

  // Fluttertoast.showToast(
  //     msg: "EXTERNAL_WALLET: " + response.walletName!,
  //     toastLength: Toast.LENGTH_SHORT);
}

Future<bool> onback() {

  Navigator.pop(context);
  return Future.value(true);
}
}
