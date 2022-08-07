import 'package:flutter/material.dart';

class walletpoint extends StatefulWidget {
  const walletpoint({Key? key}) : super(key: key);

  @override
  State<walletpoint> createState() => _walletpointState();
}

class _walletpointState extends State<walletpoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var top = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                            centerTitle: true,
                            title: top >= 80 ? TextField() : IconButton(icon: Icon(Icons.search), onPressed: () => _scrollController.jumpTo(0)) // condition
                        );
                      })),
            ];
          },body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context,index){
            return Text("List Item: " + index.toString());
          },
        ),
        ));
  }
}

class sliverappbar1 extends StatefulWidget {
  const sliverappbar1({Key? key}) : super(key: key);

  @override
  State<sliverappbar1> createState() => _sliverappbar1State();
}

class _sliverappbar1State extends State<sliverappbar1> {

  var top = 0.0;
  ScrollController scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        // controller: scrollcontroller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // expandedHeight: theight * 0.05,
              backgroundColor: Colors.white,
              pinned: true,
              flexibleSpace: TextField(
                // controller: search,
                enabled: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Search for services and packages",
                    hintStyle: TextStyle(fontFamily: "Montserrat")),
              ),
            ),
          ];
        },
        body: Text("data"),
      ),
    );
  }
}

// class _MyHomePage2State extends State<MyHomePage2> {
//   Offset position =Offset(20.0, 20.0);
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               decoration: new BoxDecoration(
//                 image: new DecorationImage(
//                   image: new AssetImage("data_repo/img/bg1.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//                 left : position.dx,
//                 top  : position.dy ,
//                 child : Draggable(
//                     feedback: Container(
//                         child : FloatingActionButton(child: Icon(Icons.add), onPressed: () {})
//                     ),
//                     child: Container(
//                       child : FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
//                     ),
//                     childWhenDragging: Container(),
//                     onDragEnd: (details){
//                       setState(() {
//                         position = details.offset;
//                       });
//                       print(position);
//                       print(position.dx);
//                       print(position.dy);
//                     }))
//           ],
//         ));
//   }
// }









