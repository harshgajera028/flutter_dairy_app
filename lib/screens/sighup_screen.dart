// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_project/reusable_widget/reusable_width.dart';
import 'package:first_flutter_project/screens/barcode_create_page.dart';
import 'package:first_flutter_project/screens/home_screen.dart';
import 'package:first_flutter_project/utils/color_utils.dart';
// import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_core.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 hexStringToColor("CB2B93"),
//                 hexStringToColor("9546C4"),
//                 hexStringToColor("5E61F4")
//               ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     reusableTextField("Enter UserName", Icons.person_outline, false,
//                         _userNameTextController),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     reusableTextField("Enter Email Id", Icons.person_outline, false,
//                         _emailTextController),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     // reusableTextField("Enter Password", Icons.lock_outlined, true,
//                     //     _passwordTextController),
//                     // const SizedBox(
//                     //   height: 20,
//                     // ),
//                     firebaseUIButton(context, "Sign Up", () {
//                       FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                           email: _emailTextController.text,
//                           password:"123456")
//                           .then((value) {
//                         print("Created New Account");
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => HomeScreen(userEmail: "userEmail")));
//                       }).onError((error, stackTrace) {
//                         print("Error ${error.toString()}");
//                       });
//                     })
//                   ],
//                 ),
//               ))),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/screens/home_screen.dart';
import 'package:first_flutter_project/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  // Create a new account with email and password
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text, // Use the entered password
                  )
                      .then((value) {
                    print("Created New Account");
                    // Store user data in the Realtime Database
                    final databaseRef = FirebaseDatabase.instance.ref('users');
                    final user = {
                      'userName': _userNameTextController.text,
                      'email': _emailTextController.text,
                    };
                    databaseRef.push().set(user);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeCreatePage(
                          userEmail: _emailTextController.text,
                        ),
                      ),
                    );
                  })
                      .onError((error, stackTrace) {
                    print("Error: ${error.toString()}");
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
