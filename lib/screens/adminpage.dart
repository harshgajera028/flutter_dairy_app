import 'package:flutter/material.dart';
import 'package:first_flutter_project/screens/barcode_scan_page.dart';
import 'package:first_flutter_project/screens/sighup_screen.dart';

class AdminPage extends StatelessWidget {
  final String adminEmail; // Email passed from the login screen

  AdminPage({required this.adminEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(adminEmail), // Display only the admin's email
        centerTitle: true, // Center the title
      ),
      body: Center( // Center aligns the content vertically and horizontally
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the BarcodeScanPage when "Add Data" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarcodeScanPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue, // Set the button color to light blue
                onPrimary: Colors.white, // Text color
              ),
              child: Text('Add Data'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the SignUpScreen when "Add User" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue, // Set the button color to light blue
                onPrimary: Colors.white, // Text color
              ),
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}

