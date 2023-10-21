import 'package:firebase_database/firebase_database.dart';
import 'package:first_flutter_project/main.dart';
import 'package:first_flutter_project/reusable_widget/round_button.dart';
import 'package:first_flutter_project/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostModel {
  final String id;
  final String email;
  final int liter;
  final int fat;
  final String animalType;
  final DateTime date;

  PostModel({
    required this.id,
    required this.email,
    required this.liter,
    required this.fat,
    required this.animalType,
    required this.date,
  });
}

class AddPostScreen extends StatefulWidget {
  final String userEmail;
  const AddPostScreen({required this.userEmail, Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final literController = TextEditingController();
  final fatController = TextEditingController();
  String animalType = 'Cow';
  DateTime selectedDate = DateTime.now();

  final databaseRef = FirebaseDatabase.instance.ref('POST');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                initialValue: widget.userEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: literController,
                decoration: InputDecoration(
                  hintText: 'Liter',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: fatController,
                decoration: InputDecoration(
                  hintText: 'Fat',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Select Animal Type:'),
                  Radio(
                    value: 'Cow',
                    groupValue: animalType,
                    onChanged: (value) {
                      setState(() {
                        animalType = 'Cow';
                      });
                    },
                  ),
                  Text('Cow'),
                  Radio(
                    value: 'Buffalo',
                    groupValue: animalType,
                    onChanged: (value) {
                      setState(() {
                        animalType = 'Buffalo';
                      });
                    },
                  ),
                  Text('Buffalo'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Select Date:'),
                  Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (literController.text.isNotEmpty &&
                      fatController.text.isNotEmpty) {
                    final sanitizedEmail = widget.userEmail.replaceAll('.', '_');
                    final id = DateFormat('yyyyMMddHHmmss').format(DateTime.now()) +
                        '_' +
                        sanitizedEmail;

                    final date = selectedDate;

                    final post = PostModel(
                      id: id,
                      email: widget.userEmail,
                      liter: int.parse(literController.text),
                      fat: int.parse(fatController.text),
                      animalType: animalType,
                      date: date,
                    );

                    databaseRef.child(id).set({
                      'email': post.email,
                      'liter': post.liter,
                      'fat': post.fat,
                      'animalType': post.animalType,
                      'date': DateFormat('yyyy-MM-dd HH:mm:ss').format(date.toLocal()),
                    }).then((value) {
                      Utils().toastMessage('Data added');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  } else {
                    print('Please fill in all fields and select an animal type.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                ),
                child: Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
