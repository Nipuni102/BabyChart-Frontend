import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<bool> _isChecked = [true, true, true, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('BabyChart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Immunization'),
            Tab(text: 'Charts'),
            Tab(text: 'Development'),
          ],
        ),
      ),*/
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(child: Text('Immunization')),
          const Center(child: Text('Charts')),
          buildDevelopmentTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mark all activities as fulfilled
          setState(() {
            _isChecked = List<bool>.filled(_isChecked.length, true);
          });
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget buildDevelopmentTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              leading: Image.asset(
                'assets/activities.jpeg',
                width: 60,
                height: 60,
              ),
              title: const Text(
                'Activities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Mark if your child fulfills these activities',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          buildActivityCheckbox('Smiles in response', 0),
          buildActivityCheckbox('Keep the head straight', 1),
          buildActivityCheckbox('Stands with help', 2),
          buildActivityCheckbox('Stands without help', 3),
          buildActivityCheckbox('Walk without help', 4),
          buildActivityCheckbox('Can say word "Mom"', 5),
          buildActivityCheckbox('Fulfills a simple order', 6),
        ],
      ),
    );
  }

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
