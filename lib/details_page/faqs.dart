import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';

class faqsssss extends StatefulWidget {
  const faqsssss({Key? key}) : super(key: key);

  @override
  State<faqsssss> createState() => _faqsssssState();
}

class _faqsssssState extends State<faqsssss> {
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
        title: Text("FAQs"),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              print("onclickkkkk");
              setState(() {
                AppConstant.faqshome[index].isExpanded = !isExpanded;
              });
            },
            children: AppConstant.faqshome.map((faqss) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    enabled: true,
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: theight * 0.02),
                      child: Text(faqss.name,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: theight * 0.02)),
                    ),
                  );
                },
                body: ListTile(
                  title: Text(faqss.descripation,
                      style: GoogleFonts.montserrat(
                        wordSpacing: 1,
                      )),
                ),
                canTapOnHeader: true,
                isExpanded: faqss.isExpanded,
              );
            }).toList(),
            dividerColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class contectus extends StatefulWidget {
  const contectus({Key? key}) : super(key: key);

  @override
  State<contectus> createState() => _contectusState();
}

class _contectusState extends State<contectus> {
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
          title: Text("Contact Us"),
        ),
        body: Column( 
          children: [
            Container(alignment: Alignment.center,
                height: theight * 0.30,
                margin: EdgeInsets.all(theight*0.01),
                padding: EdgeInsets.all(theight * 0.02),
                decoration: BoxDecoration(color: Colors.grey.shade50),
                child: Image.asset(
                  "images/launcher_logo.png",
                  height: theight * 0.15,
                )),
            Card(
              child: Container(
                alignment: Alignment.center,
                height: theight * 0.10,
                margin: EdgeInsets.all(theight*0.01),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(theight * 0.01))),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Email : ",
                        style: GoogleFonts.montserrat(
                          fontSize: theight * 0.02,
                          fontWeight: FontWeight.w700,
                        )),
                    Row(children: [
                      Icon(Icons.mail_outline),
                      Text("  Support@skedulars.co.in",
                          style: GoogleFonts.montserrat(
                            fontSize: theight * 0.02,
                            fontWeight: FontWeight.w500,
                          )),
                    ],)
                ],)
              ),
            ),
            Card(
              child: Container(
                alignment: Alignment.center,
                height: theight * 0.10,
                margin: EdgeInsets.all(theight*0.01),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(theight * 0.01))),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("Contact Us On : ",
                      style: GoogleFonts.montserrat(
                        fontSize: theight * 0.02,
                        fontWeight: FontWeight.w700,
                      )),
                  Row(children: [
                    Icon(Icons.phone_android),
                    Text("+ 91 9999999999",
                        style: GoogleFonts.montserrat(
                          fontSize: theight * 0.02,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Text("call now",
                        style: GoogleFonts.montserrat(
                          decoration: TextDecoration.underline,
                          fontSize: theight * 0.02,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue
                        )),

                  ],)
                ],)
              ),
            ),
          ],
        ));
  }
}

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text("Feedback"),
    ),
    body: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
                "images/fb_img.png",
                height: theight * 0.15,
                alignment: Alignment.center),
          ),
          Padding(padding: EdgeInsets.all(theight*0.01),
            child: Text("Give Your Valuable Feedback",
                style: GoogleFonts.montserrat(
                    fontSize: theight * 0.02,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                )),
          ),
          Padding( padding: EdgeInsets.all(theight*0.01),
            child: TextFormField(
              controller: feedback,
              textInputAction: TextInputAction.next,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)) ),
                  focusedBorder:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)) ),
                  hintStyle: TextStyle(fontFamily: "Montserrat")
              ),
            ),
          ),
          Padding( padding: EdgeInsets.all(theight*0.02),
            child: Text("If you have more detailed feedback to share, good and bad, we want it all.just drop an email to test@gmail.com",
                maxLines: 3,
                style: GoogleFonts.montserrat(
                    // fontSize: theight * 0.02,
                    color: Colors.grey
                )),
          ),
          Container(
            height: theight * 0.07,
            width: twidth * 0.90,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.grey),
                borderRadius: BorderRadius.all(
                    Radius.circular(theight * 0.01))),
            child: Center(
              child: Text(
                "SUBMIT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xf504091a),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

        ],
      ),
    ),);
  }
  TextEditingController feedback = TextEditingController();
}

