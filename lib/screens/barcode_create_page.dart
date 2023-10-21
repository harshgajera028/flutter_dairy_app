import 'package:first_flutter_project/main.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeCreatePage extends StatefulWidget {
  final String userEmail; // Add a parameter to accept the email

  BarcodeCreatePage({required this.userEmail});

  @override
  _BarcodeCreatePageState createState() => _BarcodeCreatePageState();
}

class _BarcodeCreatePageState extends State<BarcodeCreatePage> {
  final controller = TextEditingController();
  String _email = ''; // Add a field to store the email

  @override
  void initState() {
    super.initState();

    // Set the initial value of the controller to the received email
    _email = widget.userEmail;
    controller.text = _email;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // Back button icon
        onPressed: () {
          // Navigate back to the AdminPage when the back button is clicked
          Navigator.pop(context);
        },
      ),
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: BarcodeWidget(
                barcode: Barcode.code128(),
                data: _email, // Use the email from the field
                width: 200,
                height: 200,
                drawText: false,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: buildTextField(context)),
                const SizedBox(width: 12),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.done, size: 30),
                  onPressed: () {
                    setState(() {
                      _email = controller.text;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.black, // Set text color to black
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Enter the data',
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.black, // Set border color to black
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.black, // Set border color to black
        ),
      ),
    ),
  );
}
