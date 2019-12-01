import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'dart:async';
import 'main.dart';

class HomePage extends StatefulWidget
{
  HomePage({
    this.auth,
    this.onSignedOut,
});
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  @override
  State<StatefulWidget> createState()
  {
    return HomePageState();
  }
 }
 class HomePageState extends State<HomePage>
 {
//   void logoutUser() async
//   {
//     try{
//          await widget.auth.signOut();
//          widget.onSignedOut();
//     }
//     catch(e)
//     {
//        print(e.toString());
//     }
//   }
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     Timer(
       Duration(
        //   seconds:1
       ), () =>
     runApp(MaterialApp(
       home: MyApp() , //MappingPage(auth: Auth(),) ,//         //LoginRegisterPage(),
       debugShowCheckedModeBanner: false,
     )),
       ////print("Hello"),
     );
   }

   @override
//   void logout() {
  Widget build(BuildContext context) {
//
//       // TODO: implement build
       return Scaffold(
//         body: new Container(
//
//         ),
//         bottomNavigationBar: new BottomAppBar(
//           color: Colors.red,
//           child: new Container(
//             margin: const EdgeInsets.only(left: 70.0, right: 70.0),
//             child: new Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.local_car_wash), onPressed: logoutUser,
//                   iconSize: 50,
//                   color: Colors.white,
//                 ),
//                 IconButton(icon: Icon(Icons.add_a_photo), onPressed: null,
//                   iconSize: 50,
//                   color: Colors.white,
//                 )
//               ],
//             ),
//           ),
//         ),
       );
     }
   }
