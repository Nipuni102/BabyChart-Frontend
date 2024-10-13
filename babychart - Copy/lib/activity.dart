import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  final VoidCallback onBack;

  const ActivitiesScreen({super.key, required this.onBack});

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<bool> _isChecked = [true, true, true, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 2; // Set the index to Development tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Make the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              const Center(
                child: Text(
                  'Milestones',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple, // Customize the text color
                  ),
                ),
              ),
              const SizedBox(height: 0), // Space between title and image

              // Image Section
              Center(
                child: Image.asset(
                  'assets/trackBaby.png', // Replace with your image path
                  width: 200,
                  height: 120,
                ),
              ),

              const SizedBox(height: 5), // Spacing between image and checklist
              const Text(
                'Mark if your child fulfills these activities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Checklist of Activities
              buildActivityCheckbox('Smiles in response', 0),
              buildActivityCheckbox('Keep the head straight', 1),
              buildActivityCheckbox('Stands with help', 2),
              buildActivityCheckbox('Stands without help', 3),
              buildActivityCheckbox('Walk without help', 4),
              buildActivityCheckbox('Can say word "Mom"', 5),
              buildActivityCheckbox('Fulfills a simple order', 6),
            ],
          ),
        ),
      ),
      // Floating action button for back navigation
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onBack,
        backgroundColor: Color(0xFF67418C),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  // Widget for building the checkbox list
  Widget buildActivityCheckbox(String title, int index) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
        Checkbox(
          value: _isChecked[index],
          onChanged: (bool? value) {
            setState(() {
              _isChecked[index] = value!;
            });
          },
        ),
      ],
    );
  }
}
