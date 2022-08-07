
import 'package:flutter/material.dart';
import 'package:skedulrs/main.dart';


class NoInternetOrDataScreen extends StatelessWidget {
  final bool isNoInternet;
  final Widget? child;

  NoInternetOrDataScreen({required this.isNoInternet, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.025),
            color: Colors.white),
        child: Center(
          child:AlertDialog(content: Text("No Internet Connection"), actions: [
            FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => splash(),
                    ));
              },
              child: Text('try again later'),
            ),
          ])
        ),
      ),
    );
  }
}
