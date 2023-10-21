import 'package:first_flutter_project/screens/app_post.dart';
import 'package:first_flutter_project/screens/home_screen.dart';
import 'package:first_flutter_project/screens/login.dart';
import 'package:first_flutter_project/screens/signin_screen.dart';
import 'package:first_flutter_project/screens/splace_screen.dart';

import 'screens//barcode_create_page.dart';
import 'screens//barcode_scan_page.dart';
import 'reusable_widget/button_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {

 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 static final String title = 'Barcode Scanner';

 // @override
 // Widget build(BuildContext context) => MaterialApp(
 //  debugShowCheckedModeBanner: false,
 //  title: title,
 //  theme: ThemeData(
 //   primaryColor: Colors.red,
 //   scaffoldBackgroundColor: Colors.black,
 //  ),
 //  home: MainPage(title: title),
 // );
const MyApp({Key ? key}) : super (key:key);

@override
 Widget build(BuildContext context){
 return MaterialApp(
  title: 'Flutter Demo',
  home: LoginScreen(),
 );
}
}

// class MainPage extends StatefulWidget {
//  final String title;
//
//  const MainPage({
//   required this.title,
//  });
//
//  @override
//  _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//  @override
//  Widget build(BuildContext context) => Scaffold(
//   appBar: AppBar(
//    title: Text(widget.title),
//   ),
//   body: Center(
//    child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//      ButtonWidget(
//       text: 'Create Barcode',
//       onClicked: () => Navigator.of(context).push(MaterialPageRoute(
//        builder: (BuildContext context) => BarcodeCreatePage(),
//       )),
//      ),
//      const SizedBox(height: 32),
//      ButtonWidget(
//       text: 'Scan Barcode',
//       onClicked: () => Navigator.of(context).push(MaterialPageRoute(
//        builder: (BuildContext context) => BarcodeScanPage(),
//       )),
//      ),
//     ],
//    ),
//   ),
//  );
// }