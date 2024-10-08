import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewChildFourthScreen extends StatefulWidget {
  @override
  _AddNewChildScreenState createState() => _AddNewChildScreenState();
}

class _AddNewChildScreenState extends State<AddNewChildFourthScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController contactsController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Child'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.pink[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(Icons.camera_alt, size: 40),
                  onPressed: () {
                    // Handle profile picture upload
                  },
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.pink[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Father',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: dobController,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != selectedDate) {
                            setState(() {
                              selectedDate = picked;
                              dobController.text =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: nicController,
                        decoration: InputDecoration(
                          labelText: 'NIC',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: professionController,
                        decoration: InputDecoration(
                          labelText: 'Profession',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: contactsController,
                        decoration: InputDecoration(
                          labelText: 'Contacts',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addChildThirdPage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Button background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Button background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
