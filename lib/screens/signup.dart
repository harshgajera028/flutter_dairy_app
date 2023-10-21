import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/reusable_widget/round_button.dart';
import 'package:first_flutter_project/screens/login.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController  = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey ,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller:emailController  ,
                      decoration: InputDecoration (
                          hintText: 'Email',
                          helperText: 'Enter like xyz@example.com'
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }
                        return null ;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller:passwordController  ,
                      obscureText: true,
                      decoration: InputDecoration (
                        hintText: 'password',
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                        return null ;
                      },
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            RoundButton(title: 'Signup',
              onTab: (){
                if(_formkey.currentState!.validate()){
                  _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString()
                  );
                }
              },),
            const SizedBox(height:50,),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you  have Account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                }, child: Text('Login'))
              ],
            )

          ],
        ),
      ),
    );

  }
}
