import 'package:babychart/midChart.dart';
import 'package:flutter/material.dart';

class EnterWH extends StatelessWidget {
  final String? scannedData;

  const EnterWH({super.key, required this.scannedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8E42D6),
        title: const Text(
          'BabyChart',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Information
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/profile_pic.png'), // Replace with your image path
                  ),
                  SizedBox(width: 10),
                  Text(
                    'G.H.K. Wijerathna',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Enter Vaccination Title
              const Text(
                'Enter Chart Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),
              // Display the scanned QR code data
              if (scannedData != null)
                Card(
                  color: Color(0xFFF292DD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Image at the top
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              'assets/child.png'), // Replace with your image path or use NetworkImage for an online image
                        ),
                      ),
                      // Text section for scanned data
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        // title: const Text(
                        //   'Scanned Data',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //     textAlign:
                        //         TextAlign.center, // Centering the title text
                        //   ),
                        // ),
                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Center the content
                          children: const [
                            Text(
                              'Piumi Wathsala',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5), // Space between name and age
                            Text(
                              ' 3 Months',
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 44, 44),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              // Batch No TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true, // Enable filling background
                  fillColor: Color.fromARGB(137, 177, 111, 239),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true, // Enable filling background
                  fillColor: Color.fromARGB(137, 177, 111, 239),
                ),
              ),
              const SizedBox(height: 20),
              // Enter Data Button
              ElevatedButton(
                onPressed: () {
                  // Handle Enter Data button press
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MidChartScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF654089),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Enter Data',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
