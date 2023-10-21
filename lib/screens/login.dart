import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/reusable_widget/round_button.dart';
import 'package:first_flutter_project/screens/adminpage.dart';
import 'package:first_flutter_project/screens/app_post.dart';
import 'package:first_flutter_project/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formkey = GlobalKey<FormState>();
//   final emailController  = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: ()async{
//         SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text('Login'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment:CrossAxisAlignment.center,
//             children: [
//               Form(
//                 key: _formkey ,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         controller:emailController  ,
//                         decoration: InputDecoration (
//                             hintText: 'Email',
//                             helperText: 'Enter like xyz@example.com'
//                         ),
//                         validator: (value){
//                           if(value!.isEmpty){
//                             return 'Enter Email';
//                           }
//                           return null ;
//                         },
//                       ),
//                       const SizedBox(height: 20,),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller:passwordController  ,
//                         obscureText: true,
//                         decoration: InputDecoration (
//                             hintText: 'password',
//                         ),
//                         validator: (value){
//                           if(value!.isEmpty){
//                             return 'Enter Password';
//                           }
//                           return null ;
//                         },
//                       ),
//                     ],
//                   )
//               ),
//               const SizedBox(height: 30,),
//               RoundButton(title: 'Login',
//                 onTab: (){
//                 if(_formkey.currentState!.validate()){
//
//                 }
//                 },),
//               const SizedBox(height:50,),
//               Row (
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Dont have Account?"),
//                   TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
//                   }, child: Text('Sign Up'))
//                 ],
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // Function to handle user authentication
  Future<void> authenticateUser() async {
    final email = emailController.text;
    final password = passwordController.text;

    // Your authentication logic here, for example using Firebase Authentication
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Authentication successful, navigate to AddPostScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminPage(
              adminEmail: email,
            ),
          ),
        );
      } else {
        // Authentication failed, handle the error or show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication failed')),
        );
      }
    } catch (error) {
      // Handle any errors that occurred during authentication
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        helperText: 'Enter like xyz@example.com',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RoundButton(
                title: 'Login',
                onTab: () {
                  if (_formkey.currentState!.validate()) {
                    authenticateUser(); // Call the authentication function
                  }
                },
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    child: Text('Sign Up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

