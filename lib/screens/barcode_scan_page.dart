import 'package:first_flutter_project/main.dart';
import 'package:first_flutter_project/reusable_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'signin_screen.dart';
//
// class BarcodeScanPage extends StatefulWidget {
//   @override
//   _BarcodeScanPageState createState() => _BarcodeScanPageState();
// }
//
// class _BarcodeScanPageState extends State<BarcodeScanPage> {
//   String barcode = 'Unknown';
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text(MyApp.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Scan Result',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white54,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             '$barcode',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 72),
//           ButtonWidget(
//             text: 'Start Barcode scan',
//             onClicked: scanBarcode,
//           ),
//         ],
//       ),
//     ),
//   );
//
//   // Future<void> scanBarcode() async {
//   //   try {
//   //     final barcode = await FlutterBarcodeScanner.scanBarcode(
//   //       '#ff6666',
//   //       'Cancel',
//   //       true,
//   //       ScanMode.BARCODE,
//   //     );
//
//   //     if (!mounted) return;
//
//   //     setState(() {
//
//   //       this.barcode = barcode;
//   //     });
//   //   } on PlatformException {
//   //     barcode = 'Failed to get platform version.';
//   //   }
//   // }
//
//   Future<void> scanBarcode() async {
//     try {
//       final barcode = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666',
//         'Cancel',
//         true,
//         ScanMode.BARCODE,
//       );
//
//       if (!mounted) return;
//
//       setState(() {
//         this.barcode = barcode;
//       });
//
//       // Navigate to the Login Page with the scanned text
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => SignInScreen(scannedText: barcode),
//         ),
//       );
//     } on PlatformException {
//       setState(() {
//         barcode = 'Failed to get platform version.';
//       });
//     }
//   }
// }




class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String barcode = 'Unknown';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Scan Result',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '$barcode',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 72),
          ButtonWidget(
            text: 'Start Barcode scan',
            onClicked: scanBarcode,
          ),
        ],
      ),
    ),
  );

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });

      // Navigate to the Login Page with the scanned text
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignInScreen(scannedText: barcode),
        ),
      );
    } on PlatformException {
      setState(() {
        barcode = 'Failed to get platform version.';
      });
    }
  }
}
