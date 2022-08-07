import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class manage extends StatefulWidget {
  const manage({Key? key}) : super(key: key);

  @override
  State<manage> createState() => _manageState();
}

class _manageState extends State<manage> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Select Address"),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Positioned(
                top: 5,
                right: 10,
                child: Container(
                  width: twidth * 0.05,
                  child: Center(
                      child: Text(
                    "1",
                  )),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                ),
              ),
              Container(
                height: theight * 0.20,
                width: twidth * 0.20,
                child: Icon(Icons.shopping_cart, color: Colors.white),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              alignment: Alignment.center,
              height: theight * 0.10,
              margin: EdgeInsets.symmetric(vertical: theight * 0.01),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(theight * 0.01))),
              child: ListTile(
               leading: Icon(Icons.add),
                title: Text("ADD ADDRESS",
                    style: GoogleFonts.montserrat(
                      fontSize: theight * 0.02,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
          ),
          Card(
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: theight*0.01),
                padding: EdgeInsets.symmetric(horizontal: theight*0.01),
                height: theight * 0.30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(theight * 0.01))),
                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("Choose from address below",
                        style: GoogleFonts.montserrat(
                          fontSize: theight * 0.02,
                          fontWeight: FontWeight.w700,
                            color: Colors.grey
                        )),
                    Text("*Selected address is default address for your order",
                        style: GoogleFonts.montserrat(
                            fontSize:12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        )),
                    Row(
                      children: [
                        Icon(Icons.home),
                        Text("   Home",
                            style: GoogleFonts.montserrat(
                                fontSize:12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            )),
                        Spacer(),
                        Icon(Icons.more_vert)
                        
                      ],
                    ),
                    Text("Jack test | +91 9999999999",
                        style: GoogleFonts.montserrat(
                            fontSize:12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        )),
                    Text("-----------------------------------------------------------------------------------",style: TextStyle(color: Colors.black,),),
                    Text("12, Varachha",
                        style: GoogleFonts.montserrat(
                            fontSize:12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        )),
                    Text("Home | c-9 Maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India",
                        maxLines: 3,style: GoogleFonts.montserrat(
                            fontSize:12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        )),

                  ],)
            ),
          ),
          Divider(thickness: 2,),
          
        ],
      ),
    );
  }
}
