import 'package:flutter/material.dart';

class AddNewChildSecScreen extends StatefulWidget {
  const AddNewChildSecScreen({super.key});

  @override
  _AddNewChildScreenState createState() => _AddNewChildScreenState();
}

class _AddNewChildScreenState extends State<AddNewChildSecScreen> {
  final TextEditingController districtController = TextEditingController();
  final TextEditingController gramaNiladariDivisionController =
      TextEditingController();
  final TextEditingController homeNoController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String district = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Add New Child'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: const Icon(Icons.camera_alt, size: 40),
                onPressed: () {
                  // Handle profile picture upload
                },
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Residence',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: district,
                      items: [
                        'Select',
                        'Ampara',
                        'Anuradhapura',
                        'Badulla',
                        'Batticaloa',
                        'Colombo',
                        'Galle',
                        'Gampaha',
                        'Hambantota',
                        'Jaffna',
                        'Kalutara',
                        'Kandy',
                        'Kegalle',
                        'Kilinochchi',
                        'Kurunegala',
                        'Mannar',
                        'Matale',
                        'Matara',
                        'Monaragala',
                        'Mullaitivu',
                        'Nuwara Eliya',
                        'Polonnaruwa',
                        'Puttalam',
                        'Ratnapura',
                        'Trincomalee',
                        'Vavuniya'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          district = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: gramaNiladariDivisionController,
                      decoration: InputDecoration(
                        labelText: 'Grama Niladari Division',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: homeNoController,
                      decoration: InputDecoration(
                        labelText: 'Home No',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: roadController,
                      decoration: InputDecoration(
                        labelText: 'Road',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addChildFirstPage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addChildThirdPage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Next',
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
    );
  }
}
