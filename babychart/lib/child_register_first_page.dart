import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChildRegisterFirstPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController dateOfBirthController;

  const ChildRegisterFirstPage({
    super.key,
    required this.nameController,
    required this.dateOfBirthController,
  });

  @override
  _ChildRegisterFirstPageState createState() => _ChildRegisterFirstPageState();
}

class _ChildRegisterFirstPageState extends State<ChildRegisterFirstPage> {
  final TextEditingController weightController = TextEditingController();
  String gender = 'Select';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Child',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        backgroundColor: Color(0xFF654089),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // White icon color
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, size: 40),
                  onPressed: () {
                    // Handle profile picture upload
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: widget.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: widget.dateOfBirthController,
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
                    widget.dateOfBirthController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: 'Born weight(kg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: gender,
              items: ['Select', 'Male', 'Female'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
