// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:first_flutter_project/screens/app_post.dart';
// import 'package:first_flutter_project/screens/signin_screen.dart';
// import 'package:first_flutter_project/utils/utils.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   final String userEmail;
//
//   HomeScreen({required this.userEmail});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final auth = FirebaseAuth.instance;
//   final ref = FirebaseDatabase.instance.ref('POST');
//   final searchFilter = TextEditingController();
//
//   final pricePerLiter = 40;
//   double totalPrice = 0; // Initialize total price to 0.
//   bool dataLoaded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               auth.signOut().then((value) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             SignInScreen(scannedText: "scannedText")));
//               }).onError((error, stackTrace) {
//                 Utils().toastMessage(error.toString());
//               });
//             },
//             icon: Icon(Icons.logout_outlined),
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FirebaseAnimatedList(
//               query: ref,
//               defaultChild: Text('Loading'),
//               itemBuilder: (context, snapshot, animation, index) {
//                 final email = snapshot.child('email').value.toString();
//                 final fat = snapshot.child('fat').value.toString();
//                 final liter = snapshot.child('liter').value.toString();
//                 final animalType =
//                 snapshot.child('animalType').value.toString();
//                 final date = snapshot.child('date').value.toString();
//
//                 if (searchFilter.text.isEmpty && email == widget.userEmail) {
//                   final price = pricePerLiter * int.parse(liter) * (int.parse(fat) / 8);
//
//                   // Add the price of the current entry to the total price.
//                   if (email == widget.userEmail) {
//                     totalPrice += price;
//                   }
//                   return Card(
//                     child: ListTile(
//                       leading: Icon(Icons.email, color: Colors.blue),
//                       title: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               text: 'Email: ',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: email,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Fat: ',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: fat,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Liter: ',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: liter,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Animal Type: ',
//                               style: TextStyle(
//                                 color: Colors.orange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: animalType,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Date: ',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: date,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Price of Milk: ',
//                               style: TextStyle(
//                                 color: Colors.orange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: '₹${price.toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           ),
//           // Display the total price card at the end.
//           Card(
//             child: ListTile(
//               title: Text(
//                 'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => AddPostScreen(userEmail: widget.userEmail)));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:first_flutter_project/screens/app_post.dart';
import 'package:first_flutter_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String userEmail;

  HomeScreen({required this.userEmail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('POST');
  final searchFilter = TextEditingController();

  final pricePerLiter = 40;
  double totalPrice = 0; // Initialize total price to 0.
  bool dataLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignInScreen(scannedText: "scannedText")));
              }).onError((error, stackTrace) {
                // Handle error
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Text('Loading'),
              itemBuilder: (context, snapshot, animation, index) {
                final email = snapshot.child('email').value.toString();
                final fat = snapshot.child('fat').value.toString();
                final liter = snapshot.child('liter').value.toString();
                final animalType =
                snapshot.child('animalType').value.toString();
                final date = snapshot.child('date').value.toString();

                if (searchFilter.text.isEmpty && email == widget.userEmail) {
                  final price = pricePerLiter * int.parse(liter) * (int.parse(fat) / 8);

                  // Add the price of the current entry to the total price.
                  totalPrice += price;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: email,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Fat: ',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: fat,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Liter: ',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: liter,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Animal Type: ',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: animalType,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Date: ',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: date,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Price of Milk: ',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: '₹${price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          // Display the total price card at the end.
          Card(
            child: ListTile(
              title: Text(
                'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPostScreen(userEmail: widget.userEmail)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
