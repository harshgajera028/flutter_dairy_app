import 'package:flutter/material.dart';
import 'package:first_flutter_project/firbease_services/splash_services.dart';
class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  SplashService splaceScreen = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splaceScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Firbase',style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
